import 'package:chat_app/src/generated/grpc_lib/grpc_message_lib.dart';

import '../../../../src/constants/db_constants.dart';
import '../../../../domain/data/library/library_data.dart';
import '../../../storage_manager/library/library_storage_manager.dart';

import 'local_message_int.dart';

class LocalMessagesServices implements ILocalMessagesServices {
  LocalMessagesServices();
  @override
  Future<dynamic> addNewMessage(
      {required int chatId,
      required int senderId,
      required String content,
      required String date}) async {
    var db = await DBHelper.instanse.database;
    await DBHelper.instanse.onAdd(
      tableName: DatabaseConst.messageTable,
      model: {
        DatabaseConst.messagesColumnChatId: chatId,
        DatabaseConst.messagesColumnSenderId: senderId,
        DatabaseConst.messagesColumnContent: content,
        DatabaseConst.messagesColumnCreatedDate: date,
        DatabaseConst.messagesColumnUpdatedDate: date
      },
    );
    var message = await db.rawQuery('''
            SELECT ${DatabaseConst.messagesColumnLocalMessagesId} 
            FROM ${DatabaseConst.messageTable}
            WHERE ((${DatabaseConst.messagesColumnChatId} = $chatId) AND
                  (${DatabaseConst.messagesColumnSenderId} = $senderId) AND
                  (${DatabaseConst.messagesColumnContent} = '$content') AND
                  (${DatabaseConst.messagesColumnCreatedDate} = '$date'))''');
    return message[0][DatabaseConst.messagesColumnLocalMessagesId] as int;
  }

  // Future addNewMessageFromBase(
  //     {required List<MessageFromBase> messages}) async {
  //   var db = await DBHelper.instanse.database;
  //   var msgMap = <Map<String, Object>>[];
  //   var messageMap = <String, Object>{};
  //    messages.map((msg) {
  //     msgMap.add({
  //       DatabaseConst.messagesColumnChatId: msg.chatIdMain,
  //       DatabaseConst.messagesColumnSenderId: msg.senderMainId,
  //       DatabaseConst.messagesColumnContent: msg.content,
  //       DatabaseConst.messagesColumnCreatedDate: msg.date,
  //       DatabaseConst.messagesColumnUpdatedDate: msg.date,
  //       DatabaseConst.messagesColumnMessageId: msg.mainIdMessage
  //     });
  //   }).toList();
  // for (var msg in messages) {
  //   msgMap.add({
  //     DatabaseConst.messagesColumnChatId: msg.chatIdMain,
  //     DatabaseConst.messagesColumnSenderId: msg.senderMainId,
  //     DatabaseConst.messagesColumnContent: msg.content,
  //     DatabaseConst.messagesColumnCreatedDate: msg.date,
  //     DatabaseConst.messagesColumnUpdatedDate: msg.date,
  //     DatabaseConst.messagesColumnMessageId: msg.mainIdMessage
  //   });
  // }

  //   for (var msg in msgMap) {
  //     messageMap.addAll(msg);
  //   }
  //   await db.insert(DatabaseConst.messageTable, messageMap);
  //   // return
  // }

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

  Future<List<MessageDto>> getAllMessagesNotNull() async {
    var db = await DBHelper.instanse.database;
    var message = await db
        .rawQuery('SELECT * FROM messages WHERE message_id IS NOT NULL');

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
    //       DatabaseConst.messagesColumnChatId: message.localChatId,
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
          DatabaseConst.messagesColumnChatId: message.localChatId,
          DatabaseConst.messagesColumnSenderId: message.localSendId,
          DatabaseConst.messagesColumnCreatedDate: message.createdDate,
          DatabaseConst.messagesColumnIsRead: message.isRead,
          DatabaseConst.messagesColumnContent: message.content
        },
        id: localMessageId);
  }

  updateWrittenToServer(
      {required int localMessageId,
      required int messagesId,
      required String updatedDate}) async {
    var db = await DBHelper.instanse.database;

    await db.rawUpdate(
      ''' UPDATE ${DatabaseConst.messageTable}
          SET ${DatabaseConst.messagesColumnMessageId} = $messagesId, ${DatabaseConst.messagesColumnUpdatedDate} = '$updatedDate'
          WHERE ${DatabaseConst.messagesColumnLocalMessagesId} = $localMessageId
                ''',
    );
  }

  deleteWrittenToServer(
      {required int localMessageId, required String deletedDate}) async {
    var db = await DBHelper.instanse.database;

    await db.rawUpdate(
      ''' UPDATE ${DatabaseConst.messageTable}
          SET ${DatabaseConst.messagesColumnDeletedDate} = '$deletedDate'
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
