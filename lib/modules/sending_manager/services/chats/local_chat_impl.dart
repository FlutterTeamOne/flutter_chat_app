import '../../../../src/constants/db_constants.dart';
import '../../../../domain/data/library/library_data.dart';
import '../../library/library_sending_manager.dart';
import '../../../storage_manager/library/library_storage_manager.dart';

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
  Future<int> deleteChat({required int id}) async {
    var db = await DBHelper.instanse.database;
    return await db.rawDelete(
        'DELETE FROM ${DatabaseConst.chatsTable} WHERE ${DatabaseConst.chatsColumnChatIdMain}=$id');
  }

  @override
  Future<List<ChatDto>> getAllChats() async {
    var db = await DBHelper.instanse.database;
    var chats = await db.rawQuery('''
              SELECT *
              FROM ${DatabaseConst.chatsTable}
              ''');
    return chats.map((item) => ChatDto.fromMap(item)).toList();
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
