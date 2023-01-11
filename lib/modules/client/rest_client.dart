import 'dart:async';
import 'dart:convert';

import 'package:chat_app/domain/data/dto/attach_dto/attach_dto.dart';
import 'package:chat_app/domain/data/library/library_data.dart';
import 'package:chat_app/modules/sending_manager/library/library_sending_manager.dart';
import 'package:dio/dio.dart';

class RestClient {
  static const String _url = 'http://localhost:8080';

  final _dio = Dio();

  Future<List<ChatDto>> getChats() async {
    var chatUrl = '$_url/chats/';
    var chats = <ChatDto>[];
    try {
      var resp = await _dio.get(chatUrl);
      if (resp.statusCode == 200) {
        var respChats = resp.data.map((el) => ChatDto.fromMap(el)).toList();
        chats.add(respChats);
      }
    } catch (e) {

    }
    return chats;
  }

  Future createChatRest(
      {required creatorUserId, required user2Id, required String date}) async {
    var chatUrl = '$_url/chats/';
    var restChat;
    var chatId;
    // var date = DateTime.now().toIso8601String();
    // try {
    //возвращает один созданный элемент
    var resp = await _dio.put(chatUrl, data: {
      "friend1_id": creatorUserId,
      "friend2_id": user2Id,
      "date": date
    });

    if (resp.statusCode == 200) {
      var responseFromRest = resp.data.toString().split(',');

      int userId =
          int.tryParse(responseFromRest[0].split('{friend: {user_id: ')[1])!;
      String username = responseFromRest[1].split(' name: ')[1];
      String userEmail = responseFromRest[2].split(' email: ')[1];
      String userCreatedDate = responseFromRest[3].split(' created_date: ')[1];
      String profilePicUrl = responseFromRest[4].split(' profile_pic_url: ')[1];
      String userUpdatedDate = responseFromRest[5].split(' updated_date: ')[1];
      String? userDeletedDate = responseFromRest[6].split(' deleted_date: ')[1];

      await LocalUsersServices().createUser(
          userId: userId,
          name: username,
          email: userEmail,
          createdDate: userCreatedDate,
          updatedDate: userUpdatedDate,
          profilePicUrl: profilePicUrl);

      // name, email, created_date, profile_pic_url, updated_date, deleted_date,

      String createdDateInput =
          responseFromRest[12].split(' created_date: ')[1];
      String updatedDateInput =
          responseFromRest[14].split(' updated_date: ')[1];

      chatId =
          int.tryParse('${responseFromRest[9].split('res: [{chat_id: ')[1]}')!;

      int friend1_id =
          int.tryParse('${responseFromRest[10].split(' friend1_id: ')[1]}')!;

      int friend2_id =
          int.tryParse('${responseFromRest[11].split(' friend2_id: ')[1]}')!;

      String updatedDate =
          '"${updatedDateInput.substring(0, updatedDateInput.length - 3)}"';

      String createdDate = '"${createdDateInput}"';


      restChat = {
        'chat_id': chatId,
        'friend1_id': friend1_id,
        'friend2_id': friend2_id,
        'created_date': createdDateInput,
        'deleted_date': "",
        'updated_date': updatedDateInput
      };

    } else if (resp.statusCode == 404) {
      throw Exception(resp.data);
    }
    // } on DioError catch (e) {
    //   print('ERROR RESP CHAT:$e HAHAH');
    //   print("ERROR");
    //   throw Exception(e.response);
    // }
    return ChatDto(
        chatId: chatId,
        userIdChat: restChat['friend2_id'],
        createdDate: restChat['created_date'].toString(),
        updatedDate: restChat['updated_date'].toString());
  }

  Future deleteChatRest({required int id}) async {
    var chatUrl = '$_url/chats/';
    try {
      var resp = await _dio.delete('$chatUrl$id');

      if (resp.statusCode == 200) {
        var data = json.decode(resp.data);

      }
    } catch (e) {}
  }

  Future<AttachModel> sendImageRest({required String path}) async {
    var imageUrl = '$_url/images/';
    late AttachModel attach;
    try {
      var resp = await _dio.put(imageUrl, data: {"path": path});

      if (resp.statusCode == 200) {
        var source = resp.data
            .toString()
            .replaceAll('attachment_id', '"attachment_id"')
            .replaceAll('attachment_meta', '"attachment_meta"');


        attach = AttachModel.fromJson(source);

      }
    } catch (e) {

    }
    return attach;
  }

  Future getImageRest({required int imageId}) async {
    var imageUrl = '$_url/images/';
    try {
      var resp = await _dio.get('$imageUrl$imageId');
      if (resp.statusCode == 200) {
        return resp;
      }
    } catch (e) {

    }
  }

  Future deleteImageRest({required int imageId}) async {
    var imageUrl = '$_url/images/';
    try {
      var resp = await _dio.delete(imageUrl, data: imageId);
      if (resp.statusCode == 200) {
        return resp;
      }
    } catch (e) {

    }
  }
}
