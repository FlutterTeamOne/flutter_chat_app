import 'dart:async';
import 'dart:convert';

import 'package:chat_app/domain/data/dto/attach_dto/attach_dto.dart';
import 'package:chat_app/domain/data/library/library_data.dart';
import 'package:chat_app/modules/client/custom_exception.dart';
import 'package:chat_app/modules/sending_manager/library/library_sending_manager.dart';
import 'package:chat_app/modules/storage_manager/db_helper/user_path.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

class RestClient {
  static const String _url = 'http://localhost:8080';

  final _dio = Dio();
  final Logger _logger = Logger();
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
      _logger.e(e.toString());
    }
    return chats;
  }

  Future createChatRest(
      {required creatorUserId, required user2Id, required String date}) async {
    var chatUrl = '$_url/chats/';
    late Map<String, Object> restChat;
    late int chatId;
    // var date = DateTime.now().toIso8601String();
    // try {
    //возвращает один созданный элемент
    var resp = await _dio.put(chatUrl, data: {
      "friend1_id": creatorUserId,
      "friend2_id": user2Id,
      "date": date
    });
    _logger.d('HELLO');
    _logger.i('RESP DATA:${resp.data}');
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

      bool isNoUser = true;
      for (var user in await LocalUsersServices().getAllUsers()) {
        if (user.userId == userId) {
          isNoUser = false;
        }
      }

      if (isNoUser) {
        await LocalUsersServices().createUser(
            userId: userId,
            name: username,
            email: userEmail,
            createdDate: userCreatedDate,
            updatedDate: userUpdatedDate,
            profilePicUrl: profilePicUrl);
      }

      // name, email, created_date, profile_pic_url, updated_date, deleted_date,

      String createdDateInput =
          responseFromRest[12].split(' created_date: ')[1];
      String updatedDateInput =
          responseFromRest[14].split(' updated_date: ')[1];

      chatId = int.tryParse(responseFromRest[9].split('res: [{chat_id: ')[1])!;
      _logger.d('CHAT ID: $chatId');
      int friend1Id =
          int.tryParse(responseFromRest[10].split(' friend1_id: ')[1])!;
      _logger.d('FRIEND ID: $friend1Id');

      int friend2Id =
          int.tryParse(responseFromRest[11].split(' friend2_id: ')[1])!;
      _logger.d('FRIEND 2: $friend2Id');

      String updatedDate =
          '"${updatedDateInput.substring(0, updatedDateInput.length - 3)}"';
      _logger.d('UPDATEDDATE: $updatedDate');

      String createdDate = '"$createdDateInput"';
      _logger.d('CREATE DATE: $createdDate');

      restChat = {
        'chat_id': chatId,
        'friend1_id': friend1Id,
        'friend2_id': friend2Id,
        'created_date': createdDateInput,
        'deleted_date': "",
        'updated_date': updatedDateInput
      };

      _logger.d('RESTCHAT CLIENT $restChat');
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
        userIdChat: (UserPref.getUserId == restChat['friend1_id']
            ? restChat['friend2_id']
            : restChat['friend1_id']) as int,
        createdDate: restChat['created_date'].toString(),
        updatedDate: restChat['updated_date'].toString());
  }

  Future deleteChatRest({required int id}) async {
    const String chatUrl = '$_url/chats/';
    dynamic data;
    try {
      final Response<dynamic> resp = await _dio.delete('$chatUrl$id');
      _logger.d('DEL RESP:$resp');

      if (resp.statusCode == 200) {
        data = json.decode(resp.data);
        _logger.d('DEL DATA: $data');
      }
    } on DioError catch (e) {
      _logger.e("DioError DeleteChat ${e.response.toString()}");

      throw CustomException(e.response.toString());
    } catch (e) {
      _logger.e("Error DeleteChat $e");

      throw CustomException(e.toString());
    }
    return data;
  }

  Future<AttachModel> sendImageRest({required String path}) async {
    var imageUrl = '$_url/images/';
    late AttachModel attach;
    try {
      var resp = await _dio.put(imageUrl, data: {"path": path});
      _logger.d("RESP: $resp");

      if (resp.statusCode == 200) {
        var source = resp.data
            .toString()
            .replaceAll('attachment_id', '"attachment_id"')
            .replaceAll('attachment_meta', '"attachment_meta"');
        _logger.d('source:$source');

        // var res = json.decode(source);

        attach = AttachModel.fromJson(source);
        _logger.d('mod:$attach');
      }
    } catch (e) {
      _logger.e(e.toString());
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
     _logger.e(e.toString());
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
      _logger.e(e.toString());
    }
  }

  Future getChatById({required int chatId, required int userId}) async {
    const String chatUrl = '$_url/chats/getchatuser/';

    try {
      var resp = await _dio
          .get(chatUrl, queryParameters: {'chatId': chatId, 'userId': userId});
      _logger.d('GET CHAT BY ID: $resp');
      if (resp.statusCode == 200) {
        var data = resp.data.toString().split(',');
        int chatId = int.parse(data[0].split('chats: {chat_id: ')[1]);
        _logger.e(chatId);
        int friend1Id = int.parse(data[1].split('friend1_id: ')[1]);
        _logger.e('f1:$friend1Id');
        int friend2Id = int.parse(data[2].split('friend2_id: ')[1]);
        _logger.e('f2:$friend2Id');
        String chatCreatedDate = data[3].split('created_date: ')[1];
        // String chatDeletedDate = data[4].split('deleted_date: ')[1];
        // String chatUpdatedDate =
        //     data[5].split('updated_date: ')[1].split('}')[0];

        int userId = int.parse(data[6].split('user_id: ')[1]);
        String userName = data[7].split('name: ')[1];
        String userEmail = data[8].split('email: ')[1];
        String userCreatedDate = data[9].split('created_date: ')[1];
        String userProfileLink = data[10].split('profile_pic_url: ')[1];
        String userUpdatedDate = data[11].split('updated_date: ')[1];
        
        await LocalUsersServices().createUser(
            userId: userId,
            name: userName,
            email: userEmail,
            createdDate: userCreatedDate,
            updatedDate: userUpdatedDate,
            profilePicUrl: userProfileLink);
        await LocalChatServices().createChat(
            createDate: chatCreatedDate,
            userId: UserPref.getUserId == friend1Id ? friend2Id : friend1Id,
            chatId: chatId);
      }
    } catch (e) {
     _logger.e(e.toString());
    }
  }
}
