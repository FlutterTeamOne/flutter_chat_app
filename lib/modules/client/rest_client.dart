import 'dart:async';
import 'dart:convert';

import 'package:chat_app/domain/data/library/library_data.dart';
import 'package:chat_app/modules/sending_manager/library/library_sending_manager.dart';
import 'package:dio/dio.dart';

void main() {
  var rest = RestClient();
  rest.createChatRest(
      creatorUserId: 1, user2Id: 5, date: DateTime.now().toIso8601String());
}

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
      print(e);
    }
    return chats;
  }

  Future createChatRest(
      {required creatorUserId, required user2Id, required String date}) async {
    var chatUrl = '$_url/chats/';
    var restChat;
    var chatId;
    // var date = DateTime.now().toIso8601String();
    try {
      //возвращает один созданный элемент
      var resp = await _dio.put(chatUrl, data: {
        "friend1_id": creatorUserId,
        "friend2_id": user2Id,
        "date": date
      });
      print('HELLO');
      print('RESP DATA:${resp.data}');
      if (resp.statusCode == 200) {
        var responseFromRest = resp.data.toString().split(',');

        int userId =
            int.tryParse(responseFromRest[0].split('{friend: {user_id: ')[1])!;
        String username = responseFromRest[1].split(' name: ')[1];
        String userEmail = responseFromRest[2].split(' email: ')[1];
        String userCreatedDate =
            responseFromRest[3].split(' created_date: ')[1];
        String profilePicUrl =
            responseFromRest[4].split(' profile_pic_url: ')[1];
        String userUpdatedDate =
            responseFromRest[5].split(' updated_date: ')[1];
        String? userDeletedDate =
            responseFromRest[6].split(' deleted_date: ')[1];

        await LocalUsersServices().createUser(
            userId: userId,
            name: username,
            email: userEmail,
            createdDate: userCreatedDate,
            updatedDate: userUpdatedDate,
            profilePicUrl: profilePicUrl);

        Timer(Duration(seconds: 1), () {});

        // name, email, created_date, profile_pic_url, updated_date, deleted_date,

        String createdDateInput =
            responseFromRest[12].split(' created_date: ')[1];
        String updatedDateInput =
            responseFromRest[14].split(' updated_date: ')[1];

        chatId = int.tryParse(
            '${responseFromRest[9].split('res: [{chat_id: ')[1]}')!;
        print('CHAT ID: $chatId');
        int friend1_id =
            int.tryParse('${responseFromRest[10].split(' friend1_id: ')[1]}')!;
        print('FRIEND ID: $friend1_id');
        int friend2_id =
            int.tryParse('${responseFromRest[11].split(' friend2_id: ')[1]}')!;
        print('FRIEND 2: $friend2_id');
        String updateDate =
            '"${updatedDateInput.substring(0, updatedDateInput.length - 3)}"';
        print('UPDATEDDATE: $updateDate');
        String createdDate = '"${createdDateInput}"';
        print('CREATE DATE: $createdDate');

        restChat = {
          'chat_id': chatId,
          'friend1_id': friend1_id,
          'friend2_id': friend2_id,
          'created_date': createdDate,
          'deleted_date': "",
          'updated_date': updateDate
        };
        // print(source.);
        print('RESTCHAT CLIENT $restChat');
      }
    } catch (e) {
      print('ERROR RESP CHAT:$e');
    }
    return ChatDto(
        chatId: chatId,
        userIdChat: restChat['friend2_id'],
        createdDate: restChat['created_date'].toString(),
        updatedDate: restChat['updated_date'].toString());
  }

  Future deleteChatRest({required int id}) async {
    var chatUrl = '$_url/chats';
    try {
      var resp = await _dio.delete('$chatUrl/$id');
      print('DEL RESP:$resp');
    } catch (e) {}
  }

  Future<int> sendImageRest({required String path}) async {
    var imageUrl = '$_url/images/';
    var attachId;
    try {
      var resp = await _dio.post(imageUrl, data: {"path": path});
      if (resp.statusCode == 200) {
        var data = jsonDecode(resp.data);
        attachId = data['attachment_id'];
      }
    } catch (e) {
      print(e);
    }
    return attachId as int;
  }

  Future getImageRest({required int imageId}) async {
    var imageUrl = '$_url/images/';
    try {
      var resp = await _dio.get('$imageUrl$imageId');
      if (resp.statusCode == 200) {
        return resp;
      }
    } catch (e) {
      print(e);
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
      print(e);
    }
  }
}
