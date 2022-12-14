import 'package:sqflite_common/sqlite_api.dart';
import 'package:server/src/library/library_server.dart';

class MessagesDBServices implements IMessagesDBServices {
  @override
  Future<Map<String, Object?>> addNewMessage({
    required int chatId,
    required int senderId,
    required String content,
    int? attachmentId,
    required ContentType contentType,
  }) async {
    var date = DateTime.now().toIso8601String();
    Database db = await DbServerServices.instanse.database;
    await db.insert('messages', {
      'chat_id': chatId,
      'sender_id': senderId,
      'content': content,
      'created_date': date,
      'updated_date': date,
      'attachment_id': attachmentId,
      'content_type': contentType.name
    });

    var idAndDate = await db.rawQuery('''
      SELECT message_id, created_date, updated_date FROM messages
      WHERE (
        (chat_id = ?) 
        AND 
        (sender_id = ?)
        AND
        (content = ?)
        AND
        (created_date = ?)
        AND
        (updated_date = ?)       
       
        )
    ''', [chatId, senderId, content, date, date]);
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
        .rawUpdate('UPDATE messages SET $newValues WHERE ($condition)');
  }

  // @override
  // getRecentMessages({required LastMessage message}) async {
  //   Database db = await DbServerServices.instanse.database;
  //   var messages = await db.rawQuery('''SELECT *
  //     FROM messages, chats
  //     WHERE (message_id > ${message.mainIdMessage} AND
  //       (chats.friend1_id = ${message.mainIdUser} OR
  //       chats.friend2_id = ${message.mainIdUser}))''');
  //   return messages;
  // }

  getMessageByUserId({required int userId}) async {
    Database db = await DbServerServices.instanse.database;

    var idChatsFriends = await db.rawQuery(''' SELECT chat_id 
          FROM chats 
          WHERE (friend1_id = $userId) OR (friend2_id = $userId)''');
    List<int> idChats = [];

    for (var idF in idChatsFriends) {
      idChats.add(idF['chat_id'] as int);
    }
    var messages = await db.rawQuery('''SELECT *
          FROM messages
          WHERE chat_id IN (${idChats.join(",")})''');
    return messages;
  }

  getMessageByUserIdMoreMessageId(
      {required int userId, required int messageId}) async {
    Database db = await DbServerServices.instanse.database;

    var idChatsFriends = await db.rawQuery(''' SELECT chat_id 
          FROM chats 
          WHERE (friend1_id = $userId) OR (friend2_id = $userId)''');
    List<int> idChats = [];

    for (var idF in idChatsFriends) {
      idChats.add(idF['chat_id'] as int);
    }
    var messages = await db.rawQuery('''SELECT *
          FROM messages
          WHERE (chat_id IN (${idChats.join(",")})) AND 
          (message_id > $messageId)''');
    return messages;
  }

  @override
  Future getUpdatedMessages({required List<MessageRequest> messages}) async {
    List<Map<String, Object?>> messagesUpdated = [];
    Database db = await DbServerServices.instanse.database;
    for (var message in messages) {
      var messageUpdated = await db.rawQuery('''SELECT *
          FROM messages
          WHERE (message_id = ${message.messageId} AND 
                updated_date NOT LIKE "${message.updatedDate}")''');
      if (messageUpdated.isNotEmpty) {
        messagesUpdated.add(messageUpdated[0]);
      }
    }
    return messagesUpdated;
  }
}
