import 'package:sqflite_common/sqlite_api.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

import 'ichats.dart';

class ChatsHelper extends IChats {

  ChatsHelper();

  @override
  createChat({required Database db, required int friend1_id, required int friend2_id}) async {
    var db = await openDatabase();

    await db.execute('''
      INSERT INTO friends_chat (friend1_id, friend2_id) VALUES (
        $friend1_id,
        $friend2_id
      );
      ''');

    return  await db.rawQuery('''
      SELECT main_friends_chat_id FROM friends_chat 
      WHERE (
        (friend1_id = $friend1_id) 
        AND 
        (friend2_id = $friend2_id));
    ''');
  }

  @override
  getAllChats({required Database db}) async {

    return await db.rawQuery('''SELECT * FROM friends_chat''');
  }

  @override
  getChatById({required Database db, required int id})  async {

    return await db.rawQuery('''
      SELECT * FROM friends_chat 
        WHERE (main_friends_chat_id = $id)
    ''');
  }

  @override
  updateChat({required Database db, required String newValues, required String condition}) async {

    return await db.rawUpdate('''UPDATE friends_chat SET $newValues WHERE ($condition)''');
  }

  @override
  deleteChat({required Database db, required int id}) async {

    return await db.rawDelete('''DELETE FROM friends_chat WHERE (main_friends_chat_id = $id)''');
  }

  @override
  getChatByTwoIds({required Database db, required int friend1_id, required int friend2_id}) async {

    return await db.rawQuery('''
      SELECT f.main_friends_chat_id FROM friends_chat f 
	      WHERE 
        (((f.friend1_id = $friend1_id) AND (f.friend2_id = $friend2_id)) 
        OR 
        ((f.friend1_id = $friend2_id) AND (f.friend2_id = $friend1_id)))''');
  }

  @override
  getChatsByUserId({required Database db, required int userID}) async {

    return await db.rawQuery('''SELECT * FROM friends_chat f 
	    WHERE ((f.friend1_id = $userID) OR (f.friend2_id = $userID))''');
  }
}