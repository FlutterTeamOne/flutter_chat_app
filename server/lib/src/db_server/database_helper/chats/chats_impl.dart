import 'package:sqflite_common/sqlite_api.dart';

import '../../../library/library_server.dart';

class ChatsServices implements IChatsServices {
  @override
  createChat(
      {required int friend1Id,
      required int friend2Id,
      required String date}) async {
    Database db = await DbServerServices.instanse.database;

    await db.insert(
      'chats',
      {
        "friend1_id": friend1Id,
        "friend2_id": friend2Id,
        "created_date": date,
        "updated_date": date
      },
    );

    return await db.rawQuery('''
      SELECT chat_id FROM chats 
      WHERE (
        (friend1_id = ?) 
        AND 
        (friend2_id = ?)
        AND
        (created_date = ?)
        AND
        (updated_date = ?));
    ''', [friend1Id, friend2Id, date, date]);
  }

  @override
  Future<List<Map<String, Object?>>> getAllChats() async {
    Database db = await DbServerServices.instanse.database;

    return await db.rawQuery('''SELECT * FROM chats''');
  }

  @override
  Future<Map<String, Object?>> getChatById({required int id}) async {
    Database db = await DbServerServices.instanse.database;
    var chats = await db.rawQuery('''
      SELECT * FROM chats 
        WHERE (chat_id = $id)
    ''');
    return chats[0];
  }

  @override
  updateChat({required String newValues, required String condition}) async {
    Database db = await DbServerServices.instanse.database;
    return await db
        .rawUpdate('''UPDATE chats SET $newValues WHERE ($condition)''');
  }

  @override
  deleteChat({required int id}) async {
    Database db = await DbServerServices.instanse.database;

    return await db.rawDelete('''DELETE FROM chats WHERE (chat_id = $id)''');
  }

  @override
  getChatByTwoIds({required int friend1_id, required int friend2_id}) async {
    Database db = await DbServerServices.instanse.database;

    var id_chat = await db.rawQuery('''
      SELECT f.main_friends_chat_id FROM chats f 
	      WHERE 
        (((f.friend1_id = $friend1_id) AND (f.friend2_id = $friend2_id)) 
        OR 
        ((f.friend1_id = $friend2_id) AND (f.friend2_id = $friend1_id)))''');
    return id_chat[0]['main_friends_chat_id'];
  }

  @override
  Future<List<Map<String, Object?>>> getChatsByUserId(
      {required int userId}) async {
    Database db = await DbServerServices.instanse.database;

    return await db.rawQuery('''SELECT * FROM chats f 
	    WHERE ((f.friend1_id = $userId) OR (f.friend2_id = $userId))''');
  }

  @override
  getChatsByUserIdMoreChatId({required int userId, required int chatId}) async {
    Database db = await DbServerServices.instanse.database;

    return await db.rawQuery('''SELECT * FROM chats 
	    WHERE ((friend1_id = $userId) OR (friend2_id = $userId)) AND (chat_id > $chatId)''');
  }
}
