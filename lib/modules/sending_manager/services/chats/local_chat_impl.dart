import 'package:chat_app/src/constants/db_constants.dart';
import 'package:chat_app/domain/data/library/library_data.dart';
import 'package:chat_app/modules/sending_manager/library/library_sending_manager.dart';
import 'package:chat_app/modules/storage_manager/library/library_storage_manager.dart';

class LocalChatServices implements ILocalChatsServices {
  LocalChatServices();

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
  Future<List<ChatDto>> getAllChats() async {
    var db = await DBHelper.instanse.database;
    var chats = await db.rawQuery('''
              SELECT *
              FROM ${DatabaseConst.chatsTable}
              ''');
    return await chats
        .map((item) => ChatDto(
            localChatId: item[DatabaseConst.chatsColumnLocalChatId] as int,
            chatIdMain: item[DatabaseConst.chatsColumnChatIdMain] as int,
            friendId: item[DatabaseConst.chatsColumnFriendId] as int))
        .toList();
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
        'SELECT chat_id_main FROM chats WHERE local_chat_id = $localId');

    return chat[0]['chat_id_main'] as int;
  }
}
