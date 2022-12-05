import 'package:sqflite_common/sqlite_api.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

import 'IMessages.dart';

class MessagesHelper extends IMessages {

  MessagesHelper();


  

  addNewMessage({required Database db, required int friendsChatId, required int senderId, required String content, required String date}) async {

    await db.execute('''
      INSERT INTO messages (friends_chat_id, sender_id, content, date) VALUES (
        $friendsChatId,
        $senderId,
        "$content",
        "$date"
      )
      ''');

    return  await db.rawQuery('''
      SELECT main_messages_id FROM messages 
      WHERE (
        (friends_chat_id = $friendsChatId) 
        AND 
        (sender_id = $senderId)
        AND
        (content = "$content")
        AND
        (date = "$date"))
    ''');
  }
  
  @override
  deleteMessage({required Database db, required int id}) async {

    return await db.rawDelete('''DELETE FROM messages WHERE (main_messages_id = $id)''');
  }
  
  @override
  getAllMessages({required Database db}) async {

    return await db.rawQuery('''SELECT * FROM messages''');
  }
  
  @override
  getMessageById({required Database db, required int id}) async {

    return await db.rawQuery('''SELECT * FROM messages 
        WHERE (main_messages_id = $id)''');
  }
  
  @override
  getMessagesByChatId({required Database db, required int chatID}) async {

    return await db.rawQuery('''SELECT * FROM messages WHERE (friends_chat_id = $chatID)''');
  }
  
  @override
  getMessagesBySenderId({required Database db, required int senderID}) async {

    return await db.rawQuery('''SELECT * FROM messages WHERE (sender_id = $senderID)''');
  }
  
  @override
  updateMessage({required Database db, required String newValues, required String condition}) async {

    return await db.rawUpdate('''UPDATE messages SET $newValues WHERE ($condition)''');
  }
}