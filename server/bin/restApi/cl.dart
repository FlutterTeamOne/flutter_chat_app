import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

import 'chat_api.dart';

void main(List<String> args) async {
  var url = 'http://localhost:8080/chats/';
  var uri = Uri.parse(url);
  var dio = Dio();
  var chat = Chats(
      chatId: 2,
      friend1Id: 1,
      friend2Id: 2,
      createdDate: DateTime.now().toIso8601String(),
      updatedDate: DateTime.now().toIso8601String());
  var getRes = await dio.get(url);
  var resp = await dio.post(url, data: chat.toJson());

  print('GET RES: $getRes');
  print('DATA:${resp.data}');
}
