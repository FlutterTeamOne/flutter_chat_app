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
        DatabaseConst.messagesColumnDate: date
      },
    );
    var message = await db.rawQuery('''
            SELECT local_messages_id 
            FROM messages
            WHERE ((${DatabaseConst.messagesColumnLocalChatId} = $localChatId) AND
                  (${DatabaseConst.messagesColumnSenderLocalId} = $senderId) AND
                  (${DatabaseConst.messagesColumnContent} = '$content') AND
                  (${DatabaseConst.messagesColumnDate} = '$date'))''');
    return message[0]['local_messages_id'] as int;
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
        .rawQuery('SELECT * FROM messages where local_chats_id = $chatID}');
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
 Future<int> updateMessage({required String newValues, required int localMessageId}) async {
    var db = await DBHelper.instanse.database;
  return await db.rawUpdate('''
UPDATE messages
SET content = $newValues
WHERE local_message_id = $localMessageId
''');
  }

  updateWrittenToServer(
      {required int localMessageId, required int isWrittenToDB}) async {
    var db = await DBHelper.instanse.database;

    await db.rawUpdate(
      ''' UPDATE messages 
          SET is_written_to_db = $isWrittenToDB
          WHERE local_messages_id = $localMessageId
                ''',
    );
  }
}
