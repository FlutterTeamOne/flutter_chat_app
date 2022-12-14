import 'package:sqflite_common/sqlite_api.dart';

import '../../../library/library_server.dart';

class ChatsServices implements IChatsServices {
  @override
  createChat({required int friend1_id, required int friend2_id}) async {
    Database db = await DbServerServices.instanse.database;

    await db.execute('''
      INSERT INTO chats (friend1_id, friend2_id) VALUES (
        $friend1_id,
        $friend2_id
      );
      ''');

    return await db.rawQuery('''
      SELECT main_friends_chat_id FROM chats 
      WHERE (
        (friend1_id = $friend1_id) 
        AND 
        (friend2_id = $friend2_id));
    ''');
  }

  @override
  getAllChats() async {
    Database db = await DbServerServices.instanse.database;

    return await db.rawQuery('''SELECT * FROM chats''');
  }

  @override
  getChatById({required int id}) async {
    Database db = await DbServerServices.instanse.database;

    return await db.rawQuery('''
      SELECT * FROM chats 
        WHERE (main_friends_chat_id = $id)
    ''');
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

    return await db
        .rawDelete('''DELETE FROM chats WHERE (main_friends_chat_id = $id)''');
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
  getChatsByUserId({required int userID}) async {
    Database db = await DbServerServices.instanse.database;

    return await db.rawQuery('''SELECT * FROM chats f 
	    WHERE ((f.friend1_id = $userID) OR (f.friend2_id = $userID))''');
  }
}
