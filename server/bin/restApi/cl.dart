import 'dart:io';

import 'package:dio/dio.dart';

import 'chat_api.dart';

void main(List<String> args) async {
  var imgbb = 'https://api.imgbb.com/1/upload';
  var key = '903c9fb8e9c7996408d27ba9699f84a6';
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
  // var data = {
  //   "friend1_id": 1,
  //   "friend2_id": 3,
  //   "date": DateTime.now().toIso8601String()
  // };
  // var resp = await dio.put(url, data: data);
  // print('DATA:${resp.data}');
  // var filePath = File('server/bin/restApi/image/ppc.png');
  // var image = await MultipartFile.fromFile(filePath.path, filename: 'piedpapers');
  // FormData data = FormData.fromMap({
  //   'key': key,
  //   'image':image,
  //   'name': 'rsf'
  // });
  // var resp =
  //     await dio.post(imgbb, data: data, onSendProgress: (int sent, int total) {
  //   print('post: $sent and $total');
  // });
  // print('resp:$resp');

  var resp = await dio.get(imgbb, queryParameters: {'key': key});
  print(resp);
}
// {"data":
// {"id":"xHXZzYV",
// "title":"r-png",
// "url_viewer":"https://ibb.co/xHXZzYV",
// "url":"https://i.ibb.co/BNckTG8/r-png.png",
// "display_url":"https://i.ibb.co/BNckTG8/r-png.png",
// "width":"168",
// "height":"168",
// "size":39570,
// "time":"1671639274",
// "expiration":"0",
// "image":{"filename":"r-png.png",
// "name":"r-png",
// "mime":"image/png",
// "extension":"png",
// "url":"https://i.ibb.co/BNckTG8/r-png.png"
// },
// "thumb":{"filename":"r-png.png",
// "name":"r-png",
// "mime":"image/png",
// "extension":"png",
// "url":"https://i.ibb.co/xHXZzYV/r-png.png"
// },
// "delete_url":"https://ibb.co/xHXZzYV/5d66e5db9f37ba0de750a54889d0c09d"
// },
// "success":true,
// "status":200
// }