import 'dart:convert';

import 'package:server/src/library/library_server.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

class ChatApi {
  // static const String _chats = 'server/bin/restApi/chat.json';
  static const _headers = {'Content-Type': 'application/json'};
  // final _file = File(_chats);
  static final _chatService = ChatsServices();
  // final List data = json.decode(File(_chats).readAsStringSync());
  Router get router {
    final router = Router();

    //запрос к чатам
    router.get('/', (Request request) async {
      var chats = await _chatService.getAllChats();
      return Response.ok(json.encode(chats), headers: _headers);
    });
    // router.get('/<user_id>', (Request request, String userId) async {
    //   final id = int.parse(userId);
    //   var chats = await _chatService.getChatsByUserId(userId: id);
    //   print('got chats: $chats');
    //   return Response.ok(json.encode(chats), headers: _headers);
    // });
    //запрос чата по id
    //http://localhost/chats/getChatUser
    router.get('/getchatuser/', (Request request) async {
      print("Я тут ${request.url.queryParameters}");
      Map<String, Object> param = {...request.url.queryParameters};
      print("PARAM $param");
      final int chatId = int.parse(param['chatId'] as String);
      final int userId = int.parse(param['userId'] as String);

      List<Map<String, Object?>> chats =
          await _chatService.getChatById(id: chatId);
      Map<String, Object?> users =
          await UsersServices().getUserById(userId: userId);
      print('got chats: $chats');
      print('got users: $users');
      return Response.ok({'chats': chats[0], 'users': users}.toString());
    });
    //запрос на добавление в чата в список чатов
    router.put('/', (Request request) async {
      final body = await request.readAsString();
      var resp = jsonDecode(body);
      dynamic res;
      Map<String, Object?> userFriend;
      print('RESP: $resp');

      //Чат с самим собой
      // if (resp['friend1_id'] == resp['friend2_id']) {
      //   return Response.notFound("You can't create a chat with yourself");
      // }
      print("GetChatByTwoIds");
      List<Map<String, Object?>> chatId = await _chatService.getChatByTwoIds(
          friend1Id: resp['friend1_id'], friend2Id: resp['friend2_id']);
      print('user ID: $chatId');
      userFriend =
          await UsersServices().getUserById(userId: resp['friend2_id'] as int);
      String date = DateTime.now().toIso8601String();
      if (chatId.isEmpty) {
        print('ТАКОГО ЧАТА НЕ БЫЛО');
        res = await _chatService.createChat(
            friend1Id: resp['friend1_id'],
            friend2Id: resp['friend2_id'],
            date: date);
        print('RES: $res');
        //[{chat_id: 4, friend1_id: 1, friend2_id: 5, created_date: 2023-01-13T14:11:06.664694, deleted_date: null, updated_date: 2023-01-13T14:11:06.664694}]
        String result = {'friend': userFriend, 'res': res}.toString();
        return Response.ok(result);
      } else if (chatId.length == 1 &&
          (chatId[0]['deleted_date'] != '' &&
              chatId[0]['deleted_date'] != null)) {
        print("ЧАТ БЫЛ УДАЛЕН ОДНИМ ИЗ ПОЛЬЗОВАТЕЛЕЙ");
        await _chatService.updateChat(
            newValues: 'deleted_date = "", updated_date = "$date"',
            condition: 'chat_id = ${chatId[0]['chat_id']}');
        print("CHAT: $chatId");
        res =
            await ChatsServices().getChatById(id: chatId[0]['chat_id'] as int);
        print("RES: $res");
//{chat_id: 1, friend1_id: 1, friend2_id: 2, created_date: 2022-12-02T21:36:32.653712, deleted_date: , updated_date: 2023-01-13T14:08:22.259917}
        String result = {'friend': userFriend, 'res': res}.toString();
        return Response.ok(result);
      } else {
        return Response.notFound('Chat is already created.');
      }
    });
    router.delete('/', (Request request) async {
      print('req del:${await request.readAsString()}');
      final body = await request.readAsString();
      var chatId = json.decode(body);
      var id = int.parse(chatId);
      await _chatService.deleteChat(id: id);

      return Response.ok('Чат удален');
    });
    //запрос на удаление чата по ид
    router.delete('/<id>', (Request request, String id) async {
      var chatId = int.tryParse(id);
      print('CHAI ID DEL: $chatId');
      late dynamic resp;
      String date = DateTime.now().toIso8601String();
      if (chatId != null) {
        resp = await _chatService.updateChat(
            newValues: 'deleted_date = "$date", updated_date = "$date"',
            condition: 'chat_id = $chatId');
      } else {
        return Response.badRequest(body: "Not valid ChatId: $chatId");
      }
      print(resp);
      if (resp != 1) {
        return Response.badRequest(body: "Delete $resp chats");
      }
      return Response.ok(resp.toString());
    });
    //запрос на редактирования чата по ид
    // router.post('/<id>', (Request request, int id) {
    //   data[data.indexWhere((element) => element.id == id)];
    //   return Response.ok(data);
    // });
    //запрос на поиск чата по ид
    router.get('/<id>', (Request requst, String id) async {
      var chatId = int.parse(id);
      var chat = await _chatService.getChatById(id: chatId);
      return chat[0]['chat_id'] != null
          ? Response.ok(json.encode(chat), headers: _headers)
          : Response.notFound('Чат не найден');
    });
    return router;
  }

  // Future<File> writeCounter(int counter) async {
  //   // Write the file
  //   return _file.writeAsString('$counter');
  // }
}

class Chats {
  final int chatId;
  final int friend1Id;
  final int friend2Id;
  final String createdDate;
  final String updatedDate;
  final String? deletedDate;
  Chats({
    required this.chatId,
    required this.friend1Id,
    required this.friend2Id,
    required this.createdDate,
    required this.updatedDate,
    this.deletedDate,
  });

  Chats copyWith({
    int? chatId,
    int? friend1Id,
    int? friend2Id,
    String? createdDate,
    String? updatedDate,
    String? deletedDate,
  }) {
    return Chats(
      chatId: chatId ?? this.chatId,
      friend1Id: friend1Id ?? this.friend1Id,
      friend2Id: friend2Id ?? this.friend2Id,
      createdDate: createdDate ?? this.createdDate,
      updatedDate: updatedDate ?? this.updatedDate,
      deletedDate: deletedDate ?? this.deletedDate,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'chat_id': chatId,
      'friend1_id': friend1Id,
      'friend2_id': friend2Id,
      'created_date': createdDate,
      'updated_date': updatedDate,
      'deleted_date': deletedDate,
    };
  }

  factory Chats.fromMap(Map<String, dynamic> map) {
    return Chats(
      chatId: map['chat_id']?.toInt() ?? 0,
      friend1Id: map['friend1_id']?.toInt() ?? 0,
      friend2Id: map['friend2_id']?.toInt() ?? 0,
      createdDate: map['created_date'] ?? '',
      updatedDate: map['updated_date'] ?? '',
      deletedDate: map['deleted_date'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Chats.fromJson(String source) => Chats.fromMap(json.decode(source));

  @override
  String toString() => 'Chats(chatId: $chatId)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Chats && other.chatId == chatId;
  }

  @override
  int get hashCode => chatId.hashCode;
}
