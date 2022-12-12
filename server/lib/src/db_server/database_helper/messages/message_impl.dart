import 'package:sqflite_common/sqlite_api.dart';

import '../../../generated/grpc_manager.pb.dart';
import '../../../library/library_server.dart';

class MessagesServices implements IMessagesServices {
  @override
  Future<int> addNewMessage({
    required int chatId,
    required int senderId,
    required String content,
    required String createdDate,
    required String updatedDate,
    String? deletedDate,
  }) async {
    Database db = await dbServerServices.openDatabase();
    await db.insert('messages', {
      'chat_id': chatId,
      'sender_id': senderId,
      'content': content,
      'created_date': createdDate,
      'updated_date': updatedDate,
      'deleted_date': deletedDate??""
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

    var id = await db.rawQuery('''
      SELECT message_id FROM messages
      WHERE (
        (chat_id = $chatId) 
        AND 
        (sender_id = $senderId)
        AND
        (content = '$content')
        AND
        (created_date = '$createdDate')
        AND
        (updated_date = '$updatedDate')       
        )
    ''');
    return id[0]['message_id'] as int;
  }

  @override
  deleteMessage({required int id}) async {
    var db = await dbServerServices.openDatabase();

    return await db
        .rawDelete('''DELETE FROM messages WHERE (message_id = $id)''');
  }

  @override
  getAllMessages() async {
    var db = await dbServerServices.openDatabase();

    return await db.rawQuery('''SELECT * FROM messages''');
  }

  @override
  getMessageById({required int id}) async {
    var db = await dbServerServices.openDatabase();

    return await db.rawQuery('''SELECT * FROM messages 
        WHERE (message_id = $id)''');
  }

  @override
  getMessagesByChatId({required int chatId}) async {
    var db = await dbServerServices.openDatabase();

    return await db
        .rawQuery('''SELECT * FROM messages WHERE (chat_id = $chatId)''');
  }

  @override
  getMessagesBySenderId({required int senderId}) async {
    var db = await dbServerServices.openDatabase();

    return await db
        .rawQuery('''SELECT * FROM messages WHERE (sender_id = $senderId)''');
  }

  @override
  updateMessage({required String newValues, required String condition}) async {
    var db = await dbServerServices.openDatabase();

    return await db
        .rawUpdate('''UPDATE messages SET $newValues WHERE ($condition)''');
  }

  @override
  getRecentMessages({required LastMessage message}) async {
    var db = await dbServerServices.openDatabase();
    var messages = await db.rawQuery('''SELECT *
      FROM messages, chats AS friend
      WHERE (main_messages_id > ${message.mainIdMessage} AND
        (friend.friend1_id = ${message.mainIdUser} OR 
        friend.friend2_id = ${message.mainIdUser}))''');
    return messages;
  }
}
