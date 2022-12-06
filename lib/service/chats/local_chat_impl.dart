import 'package:grpc/grpc.dart';
import '../lib_db.dart';

class LocalChatServices implements ILocalChatsServices {
  final ClientChannel channel;

  LocalChatServices({required this.channel});

  @override
  Future<dynamic> createChat(
      {required int chatIdMainDB, required int friendId}) async {
    return await DBHelper.instanse
        .onAdd(tableName: DatabaseConst.chatsTable, model: {
      DatabaseConst.chatsColumnChatIdMain: chatIdMainDB,
      DatabaseConst.chatsColumnFriendId: friendId
    });
  }

  @override
  deleteChat({required int id}) async {
    var db = await DBHelper.instanse.database;
    return db.rawDelete(
        'DELETE FROM ${DatabaseConst.chatsTable} WHERE ${DatabaseConst.chatsColumnChatIdMain}=$id');
  }

  @override
  Future<List<Map<String, Object?>>> getAllChats() async {
    var db = await DBHelper.instanse.database;
    var chats = await db.rawQuery('''
              SELECT *
              FROM ${DatabaseConst.chatsTable}
              ''');
    return chats;
  }

  @override
  Future<Map<String, Object?>> getChatById({required int id}) async {
    var db = await DBHelper.instanse.database;
    var chat = await db.rawQuery('''
              SELECT *
              FROM ${DatabaseConst.chatsTable}
              WHERE ${DatabaseConst.chatsColumnLocalChatId} = $id
              ''');
    return chat[0];
  }

  @override
  Future<int> getMainIdChatByMessage({required int localId}) async {
    var db = await DBHelper.instanse.database;
    var chat = await db.rawQuery(
        'SELECT chat_id_main_db FROM chats WHERE local_chats_id = $localId}');

    return chat[0]['chat_id_main_db'] as int;
  }
}
