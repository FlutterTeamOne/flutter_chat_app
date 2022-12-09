import 'package:server/src/generated/grpc_manager.pb.dart';
import 'package:server/src/library/library_server.dart';

class MessagesServices implements IMessagesServices {
  @override
  addNewMessage(
      {required int friendsChatId,
      required int senderId,
      required String content,
      required String date}) async {
    var db = await dbServerServices.openDatabase();

    await db.execute('''
      INSERT INTO messages (friends_chat_id, sender_id, content, date) VALUES (
        $friendsChatId,
        $senderId,
        "$content",
        "$date"
      )
      ''');

    var id = await db.rawQuery('''
      SELECT main_messages_id FROM messages
      WHERE (
        (friends_chat_id = $friendsChatId) 
        AND 
        (sender_id = $senderId)
        AND
        (content = '$content')
        AND
        (date = '$date')
        )
    ''');
    return id[0]['main_messages_id'];
  }

  @override
  deleteMessage({required int id}) async {
    var db = await dbServerServices.openDatabase();

    return await db
        .rawDelete('''DELETE FROM messages WHERE (main_messages_id = $id)''');
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
        WHERE (main_messages_id = $id)''');
  }

  @override
  getMessagesByChatId({required int chatID}) async {
    var db = await dbServerServices.openDatabase();

    return await db.rawQuery(
        '''SELECT * FROM messages WHERE (friends_chat_id = $chatID)''');
  }

  @override
  getMessagesBySenderId({required int senderID}) async {
    var db = await dbServerServices.openDatabase();

    return await db
        .rawQuery('''SELECT * FROM messages WHERE (sender_id = $senderID)''');
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
      FROM messages, friends_chat AS friend
      WHERE (main_messages_id > ${message.mainIdMessage} AND
        (friend.friend1_id = ${message.mainIdUser} OR 
        friend.friend2_id = ${message.mainIdUser}))''');
    return messages;
  }
}
