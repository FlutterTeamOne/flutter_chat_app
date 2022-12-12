import '../../../../src/constants/db_constants.dart';
import '../../../../domain/data/library/library_data.dart';
import '../../../storage_manager/library/library_storage_manager.dart';

import 'local_message_int.dart';

class LocalMessagesServices implements ILocalMessagesServices {
  LocalMessagesServices();
  @override
  Future<dynamic> addNewMessage(
      {required int localChatId,
      required int senderId,
      required String content,
      required String date}) async {
    var db = await DBHelper.instanse.database;
    await DBHelper.instanse.onAdd(
      tableName: DatabaseConst.messageTable,
      model: {
        DatabaseConst.messagesColumnLocalChatId: localChatId,
        DatabaseConst.messagesColumnSenderLocalId: senderId,
        DatabaseConst.messagesColumnContent: content,
        DatabaseConst.messagesColumnCreatedDate: date,
        DatabaseConst.messagesColumnUpdatedDate: date
      },
    );
    var message = await db.rawQuery('''
            SELECT ${DatabaseConst.messagesColumnLocalMessagesId} 
            FROM ${DatabaseConst.messageTable}
            WHERE ((${DatabaseConst.messagesColumnLocalChatId} = $localChatId) AND
                  (${DatabaseConst.messagesColumnSenderLocalId} = $senderId) AND
                  (${DatabaseConst.messagesColumnContent} = '$content') AND
                  (${DatabaseConst.messagesColumnCreatedDate} = '$date'))''');
    return message[0][DatabaseConst.messagesColumnLocalMessagesId] as int;
  }

  @override
  Future<int> deleteMessage({required int id}) async {
    var db = await DBHelper.instanse.database;

    return await db
        .rawDelete('''DELETE FROM messages WHERE (local_messages_id = $id)''');
  }

  @override
  Future<List<MessageDto>> getAllMessages() async {
    var db = await DBHelper.instanse.database;
    var message = await db.rawQuery('SELECT * FROM messages');

    return message.map((item) => MessageDto.fromMap(item)).toList();
  }

  @override
  Future<Map<String, Object?>> getMessageById({required int id}) async {
    var db = await DBHelper.instanse.database;
    var message = await db
        .rawQuery('SELECT * FROM messages where local_messages_id = $id');
    return message[0];
  }

  @override
  Future<List<Map<String, Object?>>> getMessagesByChatId(
      {required int chatID}) async {
    var db = await DBHelper.instanse.database;
    var messages = await db
        .rawQuery('SELECT * FROM messages where local_chats_id = $chatID');
    return messages;
  }

  @override
  Future<List<Map<String, Object?>>> getMessagesBySenderId(
      {required int senderID}) async {
    var db = await DBHelper.instanse.database;
    var messages = await db
        .rawQuery('SELECT * FROM messages where sender_local_id = $senderID}');
    return messages;
  }

  @override
  Future updateMessage(
      {required MessageDto message, required int localMessageId}) async {
    var db = await DBHelper.instanse.database;
    // return await db.update(
    //     'messages',
    //     {
    //       DatabaseConst.messagesColumnLocalMessagesId: localMessageId,
    //       DatabaseConst.messagesColumnLocalChatId: message.localChatId,
    //       DatabaseConst.messagesColumnSenderLocalId: message.localSendId,
    //       DatabaseConst.messagesColumnDate: message.date,
    //       DatabaseConst.messagesColumnIsWrittenToDb: message.isWrittenToDb,
    //       DatabaseConst.messagesColumnContent: message.content
    //     },
    //     where: '${DatabaseConst.messagesColumnLocalMessagesId} = ?',
    //     whereArgs: [localMessageId]);
    await DBHelper.instanse.onUpdate(
        tableName: 'messages',
        column: DatabaseConst.messagesColumnLocalMessagesId,
        model: {
          DatabaseConst.messagesColumnLocalMessagesId: localMessageId,
          DatabaseConst.messagesColumnLocalChatId: message.localChatId,
          DatabaseConst.messagesColumnSenderLocalId: message.localSendId,
          DatabaseConst.messagesColumnCreatedDate: message.createdDate,
          DatabaseConst.messagesColumnIsRead: message.isRead,
          DatabaseConst.messagesColumnContent: message.content
        },
        id: localMessageId);
  }

  updateWrittenToServer(
      {required int localMessageId, required String updatedDate}) async {
    var db = await DBHelper.instanse.database;

    await db.rawUpdate(
      ''' UPDATE ${DatabaseConst.messageTable}
          SET ${DatabaseConst.messagesColumnUpdatedDate} = $updatedDate
          WHERE ${DatabaseConst.messagesColumnLocalMessagesId} = $localMessageId
                ''',
    );
  }

  @override
  Future<int> deleteAllMessagesInChat({required int chatID}) async {
    var db = await DBHelper.instanse.database;
    return await db.rawDelete('''
DELETE FROM messages
WHERE  local_chats_id = $chatID
''');
  }
}
