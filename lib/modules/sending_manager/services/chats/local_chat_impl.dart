// ignore_for_file: avoid_print

import '../../../../src/constants/db_constants.dart';
import '../../../../domain/data/library/library_data.dart';
import '../../library/library_sending_manager.dart';
import '../../../storage_manager/library/library_storage_manager.dart';

class LocalChatServices implements ILocalChatsServices {
  LocalChatServices();

  @override
  Future<List<ChatDto>> createChat(
      {required String createDate,
      required int userId,
      required chatId}) async {
    await DBHelper.instanse.onAdd(tableName: DatabaseConst.chatsTable, model: {
      DatabaseConst.chatsColumnChatId: chatId,
      DatabaseConst.chatsColumnUserId: userId,
      DatabaseConst.chatsColumnCreatedDate: createDate,
      DatabaseConst.chatsColumnUpdatedDate: createDate
    });
    var db = await DBHelper.instanse.database;
    var chats = await db.rawQuery('''
              SELECT *
              FROM ${DatabaseConst.chatsTable}
              ''');
    return chats.map((item) => ChatDto.fromMap(item)).toList();
  }

  @override
  Future<int> deleteChat({required int id}) async {
    var db = await DBHelper.instanse.database;
    DBHelper.instanse.updateListenController.sink.add(true);

    return await db.rawDelete(
        'DELETE FROM ${DatabaseConst.chatsTable} WHERE ${DatabaseConst.chatsColumnChatId}=?',
        [id]);
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

  Future<List<ChatDto>> getAllChatsSortedByUpdatedDate() async {
    var db = await DBHelper.instanse.database;

    var chats =
        await db.rawQuery('''SELECT * FROM chats ORDER BY update_date DESC''');

    var res = chats.map((item) => ChatDto.fromMap(item)).toList();

    /// TODO: refactor print
    print('getAllChatsSortedByUpdatedDate chats: $chats');
    print('getAllChatsSortedByUpdatedDate res: $res');

    return res;
  }

  @override
  Future<Map<String, Object?>> getChatById({required int id}) async {
    var db = await DBHelper.instanse.database;
    var chat = await db.rawQuery('''
              SELECT *
              FROM ${DatabaseConst.chatsTable}
              WHERE ${DatabaseConst.chatsColumnChatId}=?
              ''', [id]);
    return chat[0];
  }

  @override
  Future<int> getMainIdChatByMessage({required int localId}) async {
    var db = await DBHelper.instanse.database;
    var chat = await db.rawQuery('''SELECT ${DatabaseConst.chatsColumnChatId} 
        FROM ${DatabaseConst.chatsTable} 
        WHERE ${DatabaseConst.chatsColumnChatId}=?''', [localId]);

    return chat[0][DatabaseConst.chatsColumnChatId] as int;
  }

  @override
  Future updateChatDateUpdated(
      {required int chatId, required String dateUpdated}) async {
    var db = await DBHelper.instanse.database;
    await db.rawQuery('''
      UPDATE chats
      SET update_date = '$dateUpdated'
      WHERE (chat_id = $chatId)
    ''');
  }

  @override
  Future<int> getMaxId() async {
    var db = await DBHelper.instanse.database;
    var chat =
        await db.rawQuery('''SELECT MAX(${DatabaseConst.chatsColumnChatId}) 
                as ${DatabaseConst.chatsColumnChatId} 
                FROM ${DatabaseConst.chatsTable}''');
    return (chat[0][DatabaseConst.chatsColumnChatId] ?? 0) as int;
  }
}
