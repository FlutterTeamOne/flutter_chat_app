import 'package:chat_app/src/generated/sync/grpcsynh.pbgrpc.dart';

import '../../../../domain/data/dto/attach_dto/attach_dto.dart';
import '../../../../src/generated/grpc_lib/grpc_message_lib.dart';

import '../../../../src/constants/db_constants.dart';
import '../../../../domain/data/library/library_data.dart';
import '../../../storage_manager/library/library_storage_manager.dart';

import 'local_message_int.dart';

class LocalMessagesServices implements ILocalMessagesServices {
  LocalMessagesServices();
  @override
  Future<dynamic> addNewMessage({
    required int chatId,
    required int senderId,
    required String content,
    required String date,
    int? attachId,
    ContentType? contentType,
  }) async {
    var db = await DBHelper.instanse.database;
    if (attachId == null) {
      await DBHelper.instanse.onAdd(
        tableName: DatabaseConst.messageTable,
        model: {
          DatabaseConst.messagesColumnChatId: chatId,
          DatabaseConst.messagesColumnSenderId: senderId,
          DatabaseConst.messagesColumnContent: content,
          DatabaseConst.messagesColumnCreatedDate: date,
          DatabaseConst.messagesColumnUpdatedDate: date,
          DatabaseConst.messagesColumnContentType: ContentType.isText.name
        },
      );
    } else {
      await DBHelper.instanse.onAdd(
        tableName: DatabaseConst.messageTable,
        model: {
          DatabaseConst.messagesColumnChatId: chatId,
          DatabaseConst.messagesColumnSenderId: senderId,
          DatabaseConst.messagesColumnContent: content,
          DatabaseConst.messagesColumnCreatedDate: date,
          DatabaseConst.messagesColumnUpdatedDate: date,
          DatabaseConst.messagesColumnAttachmentId: attachId,
          DatabaseConst.messagesColumnContentType: contentType?.name,
        },
      );
    }
    var message = await db.rawQuery(
        '''SELECT ${DatabaseConst.messagesColumnLocalMessagesId} 
            FROM ${DatabaseConst.messageTable}
            WHERE ((${DatabaseConst.messagesColumnChatId} = ?) AND
                  (${DatabaseConst.messagesColumnSenderId} = ?) AND
                  (${DatabaseConst.messagesColumnContent} = ?) AND
                  (${DatabaseConst.messagesColumnCreatedDate} = ?))''',
        [chatId, senderId, content, date]);

    return message[0][DatabaseConst.messagesColumnLocalMessagesId] as int;
  }

  Future addNewMessageFromBase({required Message message}) async {
    var db = DBHelper.instanse;

    return await db.onAdd(tableName: DatabaseConst.messageTable, model: {
      DatabaseConst.messagesColumnChatId: message.chatId,
      DatabaseConst.messagesColumnSenderId: message.senderId,
      DatabaseConst.messagesColumnContent: message.content,
      DatabaseConst.messagesColumnCreatedDate: message.dateCreate,
      DatabaseConst.messagesColumnUpdatedDate: message.dateUpdate,
      DatabaseConst.messagesColumnMessageId: message.messageId,
      DatabaseConst.messagesColumnAttachmentId: message.attachmentId,
      DatabaseConst.messagesColumnContentType: message.contentType.name
    });

    ///Загрузка листа сообщений
    ///

    // var msgMap = <Map<String, Object>>[];
    // var messageMap = <String, Object>{};
    // messages.map((msg) {
    //   msgMap.add({
    //     DatabaseConst.messagesColumnChatId: msg.chatIdMain,
    //     DatabaseConst.messagesColumnSenderId: msg.senderMainId,
    //     DatabaseConst.messagesColumnContent: msg.content,
    //     DatabaseConst.messagesColumnCreatedDate: msg.date,
    //     DatabaseConst.messagesColumnUpdatedDate: msg.date,
    //     DatabaseConst.messagesColumnMessageId: msg.mainIdMessage
    //   });
    // }).toList();
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

    // for (var msg in msgMap) {
    //   messageMap.addAll(msg);
    // }
    // await db.insert(DatabaseConst.messageTable, messageMap);
    // // return
  }

  @override
  Future<int> deleteMessage({required int id}) async {
    var db = await DBHelper.instanse.database;

    var deleted = await db.rawDelete(
        '''DELETE FROM ${DatabaseConst.messageTable}  WHERE ${DatabaseConst.messagesColumnLocalMessagesId}=?''',
        [id]);
    return deleted;
    
  }

  Future<int> deleteMessageFromBase(
      {required int id, required String dateDelete}) async {
    var db = await DBHelper.instanse.database;

    return await db.rawDelete(
        '''DELETE FROM ${DatabaseConst.messageTable}  WHERE ${DatabaseConst.messagesColumnMessageId}=?''',
        [
          id,
        ]);
  }

  @override
  Future<List<MessageDto>> getAllMessages() async {
    var db = await DBHelper.instanse.database;
    var message = await db.rawQuery('SELECT * FROM messages');

    return message.map((item) => MessageDto.fromMap(item)).toList();
  }

  Future<List<MessageDto>> getAllMessagesNotNull() async {
    var db = await DBHelper.instanse.database;
    var message = await db.rawQuery(
        'SELECT * FROM ${DatabaseConst.messageTable} WHERE ${DatabaseConst.messagesColumnMessageId} IS NOT NULL');

    return message.map((item) => MessageDto.fromMap(item)).toList();
  }

  @override
  Future<Map<String, Object?>> getMessageById({required int id}) async {
    var db = await DBHelper.instanse.database;
    var message = await db.rawQuery(
        'SELECT * FROM ${DatabaseConst.messageTable}  where ${DatabaseConst.messagesColumnLocalMessagesId} = $id');
    return message[0];
  }

  @override
  Future<List<Map<String, Object?>>> getMessagesByChatId(
      {required int chatID}) async {
    var db = await DBHelper.instanse.database;
    var messages = await db.rawQuery(
        'SELECT * FROM ${DatabaseConst.messageTable}  WHERE ${DatabaseConst.messagesColumnChatId}=?',
        [chatID]);
    return messages;
  }

  @override
  Future<List<Map<String, Object?>>> getMessagesBySenderId(
      {required int senderID}) async {
    var db = await DBHelper.instanse.database;
    var messages = await db.rawQuery(
        'SELECT * FROM ${DatabaseConst.messageTable}  WHERE ${DatabaseConst.messagesColumnSenderId}=?',
        [senderID]);
    return messages;
  }

  @override
  Future 
  updateMessage(
      {required MessageDto message, required int localMessageId}) async {
    await DBHelper.instanse.onUpdate(
        tableName: 'messages',
        column: DatabaseConst.messagesColumnLocalMessagesId,
        model: {
          // DatabaseConst.messagesColumnLocalMessagesId:message.localMessageId,
          DatabaseConst.messagesColumnChatId: message.chatId,
          DatabaseConst.messagesColumnSenderId: message.senderId,
          DatabaseConst.messagesColumnCreatedDate: message.createdDate,
          DatabaseConst.messagesColumnUpdatedDate: message.updatedDate,
          DatabaseConst.messagesColumnDeletedDate: message.deletedDate,
          DatabaseConst.messagesColumnIsRead: message.isRead,
          DatabaseConst.messagesColumnContent: message.content,
          DatabaseConst.messagesColumnMessageId:message.messageId
        },
        id: localMessageId);
  }

  updateMessageFromBase(
      {required int messageId,
      required String content,
      required String updateDate}) async {
    var db = await DBHelper.instanse.database;
    await db.rawUpdate('''
    UPDATE ${DatabaseConst.messageTable}
    SET 
    ${DatabaseConst.messagesColumnMessageId}=?,
    ${DatabaseConst.messagesColumnUpdatedDate}=?,
    ${DatabaseConst.messagesColumnContent}=?
    WHERE (${DatabaseConst.messagesColumnMessageId} = $messageId);''',
        [messageId, updateDate, content]);
    DBHelper.instanse.updateListenController.add(true);
  }

  updateMessageSynh({required MessageDto msg}) async {
    var db = await DBHelper.instanse.database;
    await db.rawUpdate('''UPDATE ${DatabaseConst.messageTable}
    SET 
    ${DatabaseConst.messagesColumnUpdatedDate}=?,
    ${DatabaseConst.messagesColumnContent}=?,
    ${DatabaseConst.messagesColumnDeletedDate}=?      
    WHERE ${DatabaseConst.messagesColumnMessageId} = ${msg.messageId}''',
        [msg.updatedDate, msg.content, msg.deletedDate]);
    DBHelper.instanse.updateListenController.add(true);
  }

  updateWrittenToServer(
      {required int localMessageId,
      required int messagesId,
      required String updatedDate}) async {
    var db = await DBHelper.instanse.database;

    await db.rawUpdate(''' UPDATE ${DatabaseConst.messageTable}
          SET ${DatabaseConst.messagesColumnMessageId}=$messagesId, ${DatabaseConst.messagesColumnUpdatedDate}="$updatedDate"
          WHERE (${DatabaseConst.messagesColumnLocalMessagesId} = $localMessageId)
    ''');
  }

  deleteWrittenToServer(
      {required int localMessageId, required String deletedDate}) async {
    var db = await DBHelper.instanse.database;

    await db.rawUpdate(''' UPDATE ${DatabaseConst.messageTable}
          SET ${DatabaseConst.messagesColumnDeletedDate}=?
          WHERE ${DatabaseConst.messagesColumnLocalMessagesId} = $localMessageId
                ''', [deletedDate]);
  }

  @override
  Future<int> deleteAllMessagesInChat({required int chatID}) async {
    var db = await DBHelper.instanse.database;
    return await db.rawDelete('''
        DELETE FROM messages
        WHERE  ${DatabaseConst.messagesColumnChatId} = $chatID
        ''');
  }

  @override
  Future<int> getMaxMessageId() async {
    var db = await DBHelper.instanse.database;
    var messageId = await db.rawQuery('''
                SELECT MAX(${DatabaseConst.messagesColumnLocalMessagesId})
                FROM ${DatabaseConst.messageTable}
                ''');
    return (messageId[0]['MAX(local_messages_id)'] ?? 0) as int;
  }

  Future addAttach(AttachModel model) async {
    await DBHelper.instanse
        .onAdd(tableName: DatabaseConst.attachmentsTable, model: model.toMap());
  }
}
