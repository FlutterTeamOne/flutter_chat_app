import 'package:sqflite_common/sqlite_api.dart';
import 'package:server/src/library/library_server.dart';

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
            .rawUpdate('''UPDATE messages SET $newValues WHERE ($condition)''')
        as int;
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

  getMessageByUserId({required int idUser}) async {
    Database db = await DbServerServices.instanse.database;

    var idChatsFriends = await db.rawQuery(''' SELECT chat_id 
          FROM chats 
          WHERE (friend1_id = $idUser) OR (friend2_id = $idUser)''');
    List<int> idChats = [];

    for (var idF in idChatsFriends) {
      idChats.add(idF['chat_id'] as int);
    }
    var messages = await db.rawQuery('''SELECT *
          FROM messages
          WHERE chat_id IN (${idChats.join(",")})''');
    return messages;
  }

  getMessageByUserId({required int idUser}) async {
    Database db = await DbServerServices.instanse.database;

    var idChatsFriends = await db.rawQuery(''' SELECT chat_id 
          FROM chats 
          WHERE (friend1_id = $idUser) OR (friend2_id = $idUser)''');
    List<int> idChats = [];
    for (var idF in idChatsFriends) {
      idChats.add(idF['chat_id'] as int);
    }
    var messages = await db.rawQuery('''SELECT *
          FROM messages
          WHERE chat_id IN (${idChats.join(",")})''');
    return messages;
  }
}
