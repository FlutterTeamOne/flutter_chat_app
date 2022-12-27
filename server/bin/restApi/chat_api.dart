import 'dart:convert';
import 'dart:io';

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
    router.get('/<user_id>', (Request request, String userId) async {
      final id = int.parse(userId);
      var chats = await _chatService.getChatsByUserId(userId: id);
      print('got chats: $chats');
      return Response.ok(json.encode(chats), headers: _headers);
    });
    router.get('/<chat_id>', (Request request, String chatId) async {
      final id = int.parse(chatId);
      var chats = await _chatService.getChatById(id: id);
      print('got chats: $chats');
      return Response.ok(json.encode(chats), headers: _headers);
    });
    //запрос на добавление в чата в список чатов
    router.put('/', (Request request) async {
      final body = await request.readAsString();
      var resp = jsonDecode(body);
      print('RESP: $resp');
      List<Map<String, Object?>> chatId = await _chatService.getChatByTwoIds(
          friend1_id: resp['friend1_id'], friend2_id: resp['friend2_id']);
      print('user ID: $chatId');
      if (chatId.isEmpty) {
        print('user id is not empty');
        var res = await _chatService.createChat(
            friend1Id: resp['friend1_id'],
            friend2Id: resp['friend2_id'],
            date: resp['date']);
        print('RES: $res');
        var userFriend = await UsersServices()
            .getUserById(userId: resp['friend2_id'] as int);
        var result = {'friend': userFriend, 'res': res}.toString();
        return Response.ok(result);
      } else {
        return Response.ok('Chat is already created,');
      }
    });
    router.delete('/', (Request request) async {
      final body = await request.readAsString();
      var id = int.parse(body);
      await _chatService.deleteChat(id: id);

      return Response.ok('Чат удален', headers: _headers);
    });
    //запрос на удаление чата по ид
    router.delete('/<id>', (Request request, String id) async {
      var chatId = int.tryParse(id);
      if (chatId != null) {
        await ChatsServices().deleteChat(id: chatId);
      }
      return Response.ok('Удалено', headers: _headers);
    });
    //запрос на редактирования чата по ид
    // router.post('/<id>', (Request request, int id) {
    //   data[data.indexWhere((element) => element.id == id)];
    //   return Response.ok(data);
    // });
    //запрос на добавление чата в список чаты
    router.put('/', (Request request) async {
      final body = await request.readAsString();
      var resp = jsonDecode(body);

      await _chatService.createChat(
          friend1Id: resp['friend1_id'],
          friend2Id: resp['friend2_id'],
          date: resp['date']);
      return Response.ok(body, headers: _headers);
    });
    //запрос на поиск чата по ид
    router.get('/<id>', (Request requst, String id) async {
      var chatId = int.parse(id);
      var chat = await _chatService.getChatById(id: chatId);
      return chat['chat_id'] != null
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
