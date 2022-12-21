import 'package:dio/dio.dart';

import 'chat_api.dart';

void main(List<String> args) async {
  var url = 'http://localhost:8080/chats/';
  var urlId = 'http://localhost:8080/chats/';
  var uri = Uri.parse(url);
  var dio = Dio();
  var chat = Chats(
      chatId: 2,
      friend1Id: 2,
      friend2Id: 3,
      createdDate: DateTime.now().toIso8601String(),
      updatedDate: DateTime.now().toIso8601String());

  // var getRes = await dio.get(url);
  // print('GET RES: $getRes');

  // var resp = await dio.post(url, data: chat.toJson());
  // print('DATA:${resp.data}');

  // var delResp = await dio.delete('${urlId}1', data: 1, );
  // print('del: $delResp');
  
  // var resp = await dio.put(url, data: chat.toJson());
  // print('DATA:${resp.data}');
}
