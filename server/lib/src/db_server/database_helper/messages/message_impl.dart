import 'package:server/src/generated/messages.pb.dart';
import 'package:sqflite_common/sqlite_api.dart';

import '../../../library/library_server.dart';

class MessagesServices implements IMessagesServices {
  @override
  Future<Map<String, Object?>> addNewMessage({
    required int chatId,
    required int senderId,
    required String content,
  }) async {
    var date = DateTime.now().toIso8601String();
    Database db = await DbServerServices.instanse.database;
    await db.insert('messages', {
      'chat_id': chatId,
      'sender_id': senderId,
      'content': content,
      'created_date': date,
      'updated_date': date
    });
    // await db.execute('''
    //   INSERT INTO messages (chat_id, sender_id, content, created_date, updated_date, deleted_date) VALUES (
    //     $chatId,
    //     $senderId,
    //     "$content",
    //     "$createdDate",
    //     "$updatedDate",
    //     "$deletedDate"
    //   )
    //   ''');

    var idAndDate = await db.rawQuery('''
      SELECT message_id, created_date FROM messages
      WHERE (
        (chat_id = $chatId) 
        AND 
        (sender_id = $senderId)
        AND
        (content = '$content')
        AND
        (created_date = '$date')
        AND
        (updated_date = '$date')       
        )
    ''');
    return idAndDate[0];
  }

  @override
  deleteMessage({required int id}) async {
    Database db = await DbServerServices.instanse.database;

    return await db
        .rawDelete('''DELETE FROM messages WHERE (message_id = $id)''');
  }

  @override
  getAllMessages() async {
    Database db = await DbServerServices.instanse.database;

    return await db.rawQuery('''SELECT * FROM messages''');
  }

  @override
  getMessageById({required int id}) async {
    Database db = await DbServerServices.instanse.database;

    return await db.rawQuery('''SELECT * FROM messages 
        WHERE (message_id = $id)''');
  }

  @override
  getMessagesByChatId({required int chatId}) async {
    Database db = await DbServerServices.instanse.database;
    return await db
        .rawQuery('''SELECT * FROM messages WHERE (chat_id = $chatId)''');
  }

  @override
  getMessagesBySenderId({required int senderId}) async {
    Database db = await DbServerServices.instanse.database;
    return await db
        .rawQuery('''SELECT * FROM messages WHERE (sender_id = $senderId)''');
  }

  @override
  Future<int> updateMessage(
      {required String newValues, required String condition}) async {
    Database db = await DbServerServices.instanse.database;
    return await db
            .rawUpdate('''UPDATE messages SET $newValues WHERE ($condition)''')
        as int;
  }

  @override
  getRecentMessages({required LastMessage message}) async {
    Database db = await DbServerServices.instanse.database;
    var messages = await db.rawQuery('''SELECT *
      FROM messages, chats AS friend
      WHERE (main_messages_id > ${message.mainIdMessage} AND
        (friend.friend1_id = ${message.mainIdUser} OR 
        friend.friend2_id = ${message.mainIdUser}))''');
    return messages;
  }
}
