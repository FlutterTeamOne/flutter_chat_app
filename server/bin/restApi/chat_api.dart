import 'dart:convert';
import 'dart:io';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

final chats = <Chats>[];

class ChatApi {
  static const String _chats = 'server/bin/restApi/chat.json';
  static const _headers = {'Content-Type': 'application/json'};
  final _file = File(_chats);

  final List data = json.decode(File(_chats).readAsStringSync());
  Router get router {
    final router = Router();

    //запрос к чатам
    router.get('/',
        (Request request) => Response.ok(json.encode(data), headers: _headers));
    router.get('/<user_id>', (Request request, String userId) {
      final id = int.parse(userId);
      var chats = data.where((el) => el['user_id'] == id);
      print('get chats: $chats');
      return Response.ok(json.encode(chats), headers: _headers);
    });
    //запрос на добавление в чата в список чатов
    router.post('/', (Request request) async {
      final body = await request.readAsString();
      var resp = jsonDecode(body);
      data.add(resp);
      _file.writeAsStringSync(json.encode(data));
      return Response.ok(body, headers: _headers);
    });
    router.delete('/', (Request request) async {
      final body = await request.readAsString();
      print('body: $body');
      var resp = jsonDecode(body);
      data.remove(resp);
      _file.writeAsStringSync(json.encode(data));

      return Response.ok(body, headers: _headers);
    });
    //запрос на удаление чата по ид
    router.delete('/<id>', (Request request, String id) {
      var chatId = int.tryParse(id);
      data.removeWhere((chat) => chat['chat_id'] == chatId);
      _file.writeAsStringSync(json.encode(data));
      return Response.ok('Удалено');
    });
    //запрос на редактирования чата по ид
    router.post('/<id>', (Request request, int id) {
      data[data.indexWhere((element) => element.id == id)];
      return Response.ok(data);
    });
    //запрос на добавление чата в список чаты
    router.put('/', (Request request) async {
      final body = await request.readAsString();
      var resp = jsonDecode(body);
      data.add(resp);
      _file.writeAsStringSync(json.encode(data));
      return Response.ok(body, headers: _headers);
    });
    //запрос на поиск чата по ид
    router.get('/<id>', (Request requst, int id) {
      final chat = data.firstWhere(
        (chat) => chat.chatId == id,
      );
      return chat.chatId.isNaN
          ? Response.ok(json.encode(chat), headers: _headers)
          : Response.notFound('Чат не найден');
    });
    return router;
  }

  Future<File> writeCounter(int counter) async {
    // Write the file
    return _file.writeAsString('$counter');
  }
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
