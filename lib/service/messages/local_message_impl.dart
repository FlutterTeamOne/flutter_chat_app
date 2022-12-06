import 'package:flutter_chat_app/storage_manager/db_helper.dart';
import 'package:grpc/service_api.dart';

import '../../features/data/models/message_model/message_model.dart';
import '../../library.dart';
import '../../storage_manager/database_const.dart';
import 'local_message_int.dart';

class LocalMessagesServices implements ILocalMessagesServices {
  final ClientChannel channel;

  LocalMessagesServices({required this.channel});
  @override
  Future<dynamic> addNewMessage(
      {required int localChatId,
      required int senderId,
      required String content,
      required String date}) async {
    var stub = GrpcChatClient(channel);

    await DBHelper.instanse.onAdd(
      tableName: DatabaseConst.messageTable,
      model: {
        DatabaseConst.messagesColumnLocalChatId: localChatId,
        DatabaseConst.messagesColumnSenderLocalId: senderId,
        DatabaseConst.messagesColumnContent: content,
        DatabaseConst.messagesColumnDate: date
      },
    );

    // await stub.createMessage(
    //   Message(chatIdMaint: 1, senderMainId: 1, content: content, date: date),
    // );
  }

  @override
  Future<int> deleteMessage({required int id}) async {
    var db = await DBHelper.instanse.database;

    return await db
        .rawDelete('''DELETE FROM messages WHERE (local_messages_id = $id)''');
  }

  @override
  Future<List<MessageModel>> getAllMessages() async {
    var db = await DBHelper.instanse.database;
    var message = await db.rawQuery('SELECT * FROM messages');

    return message
        .map((item) => MessageModel(
            localMessageId: item['local_messages_id'] as int,
            localChatId: item['local_chat_id'] as int,
            localSendId: item['sender_is_user'] as int,
            date: item['date'] as String,
            content: item['content'] as String,
            isWrittenToDb: item['is_written_to_db'] as int))
        .toList();
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
  updateMessage({required String newValues, required String condition}) {}

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
