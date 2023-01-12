// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:dio/dio.dart';
import 'package:test/test.dart';

void main() {
  //Для теста необходимо запустить rest server
  Dio dio = Dio();
  var url = 'http://localhost:8080';

  group('GET rest api tests', () {
    //1
    test('GET all chats', () async {
      String urlChats = '$url/chats/';
      try {
        var response = await dio.get(urlChats);

        expect(response.statusCode, 200);
      } catch (e) {
        print(e);
      }
    });

    //2
    test('GET 404 error', () async {
      String urlGet = '$url/';
      var response;
      try {
        response = await dio.get(urlGet);

        expect(response.error, 404);
      } catch (e) {
        print(e);
      }
    });

    //3
    test('GET chats by user id 1', () async {
      String urlChats = '$url/chats/1';
      var response;
      bool isChatsWithUserId;
      try {
        response = await dio.get(urlChats);
        isChatsWithUserId =
            response.toString().contains(RegExp(r'friend[1-2]_id: 1'));

        expect(response.statusCode, 200);
        expect(isChatsWithUserId, true);
      } catch (e) {
        print(e);
      }
    });

    //4
    test('GET chats by user id 2', () async {
      String urlChats = '$url/chats/2';
      var response;
      bool isChatsWithUserId;
      try {
        response = await dio.get(urlChats);
        isChatsWithUserId =
            response.toString().contains(RegExp(r'friend[1-2]_id: 2'));

        expect(response.statusCode, 200);
        expect(isChatsWithUserId, true);
      } catch (e) {
        print(e);
      }
    });

    //5
    test('GET error chats by user id 100', () async {
      String urlChats = '$url/chats/100';
      var response;
      bool isChatsWithUserId;
      try {
        response = await dio.get(urlChats);
        isChatsWithUserId =
            response.toString().contains(RegExp(r'friend[1-2]_id: 100'));

        expect(isChatsWithUserId, false);
      } catch (e) {
        print(e);
      }
    });

    //6
    test('PUT create chat', () async {
      String urlChat = '$url/chats/';
      var response;
      var res;
      //Проверка создания чата 4, 5 юзеров
      //Проверка наличия чата с id 6
      //Может не проходить тест, если в вашей базе другие данные, нужно поменять
      bool isChatWithUserId4;
      bool isChatWithUserId5;
      bool isChatId6;
      try {
        response = await dio.put(urlChat, data: {
          "friend1_id": 4,
          "friend2_id": 5,
          "date": DateTime.now().toIso8601String()
        });

        isChatWithUserId4 = response.toString().contains('friend1_id: 4');
        isChatWithUserId5 = response.toString().contains('friend2_id: 5');
        isChatId6 = response.toString().contains('chat_id: 6');

        expect(response.statusCode, 200);
        expect(isChatWithUserId4, true);
        expect(isChatWithUserId5, true);
        expect(isChatId6, true);

        res = await dio.get(urlChat);
        isChatId6 = res.toString().contains('chat_id: 6');

        expect(isChatId6, true);
      } catch (e) {
        print(e);
      }
    });

    //7
    test('DELETE chat by chat id 6', () async {
      String urlChat = '$url/chats/6';
      var response;
      var res;
      bool isChatId6;
      try {
        res = await dio.get(urlChat);
        print('DELETE CHAT res1: $res');
        isChatId6 = res.toString().contains('chat_id: 6');
        expect(isChatId6, true);

        response = await dio.delete(urlChat);
        print('DELETE CHAT response: $response');
        expect(response.statusCode, 200);

        res = await dio.get(urlChat);
        print('DELETE CHAT res2: $res');
        isChatId6 = res.toString().contains('chat_id: 6');
        expect(isChatId6, false);
      } catch (e) {
        print(e);
      }
    });

    //8
    test('GET image by id 1', () async {
      var urlGetImageById1 = '$url/images/1';
      var response;
      try {
        response = await dio.get(urlGetImageById1);

        expect(response.statusCode, 200);
      } catch (e) {
        print(e);
      }
    });

    //9
    test('GET image by id 2', () async {
      var urlGetImageById2 = '$url/images/2';
      var response;
      try {
        response = await dio.get(urlGetImageById2);
        expect(response.statusCode, 200);
      } catch (e) {
        print(e);
      }
    });
  });
}
