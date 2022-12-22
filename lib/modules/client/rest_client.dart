import 'dart:convert';

import 'package:chat_app/domain/data/library/library_data.dart';
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
      print(e);
    }
    return chats;
  }

  Future<ChatDto> createChatRest(
      {required creatorUserId, required user2Id}) async {
    var chatUrl = '$_url/chats/';
    var restChat;
    var date = DateTime.now().toIso8601String();
    try {
      //возвращает один созданный элемент
      var resp = await _dio.put(chatUrl, data: {
        "friend1_id": creatorUserId,
        "friend2_id": user2Id,
        "date": date
      });
      if (resp.statusCode == 200) {
        restChat = resp;
      }
    } catch (e) {
      print(e);
    }
    return restChat;
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
