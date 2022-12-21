import '../../../../src/constants/db_constants.dart';
import '../../../../domain/data/library/library_data.dart';
import '../../library/library_sending_manager.dart';
import '../../../storage_manager/library/library_storage_manager.dart';

class LocalChatServices implements ILocalChatsServices {
  LocalChatServices();

  @override
  Future<List<ChatDto>> createChat(
      {required String createDate, required int userId}) async {
     await DBHelper.instanse
        .onAdd(tableName: DatabaseConst.chatsTable, model: {
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
    return await db.rawDelete(
        'DELETE FROM ${DatabaseConst.chatsTable} WHERE ${DatabaseConst.chatsColumnUserId}=?',
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
  Future<int> updateChat({required int chatId}) {
    // TODO: изменение в БД информации о чате
    throw UnimplementedError();
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
