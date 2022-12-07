import 'package:flutter_chat_app/storage_manager/db_helper.dart';
import 'package:flutter_chat_app/storage_manager/impl/local_message_int.dart';
import 'package:grpc/service_api.dart';

import '../../library.dart';
import '../database_const.dart';

class LocalMessagesServices implements ILocalMessagesServices {
  final ClientChannel channel;

  LocalMessagesServices({required this.channel});
  @override
  addNewMessage(
      {int? id = 1,
      required int localChatId,
      required int senderId,
      int? isWrittenToDb = 0,
      required String content,
      required String date}) async {
    var stub = GrpcChatClient(channel);
    await DBHelper.instanse.onAdd(
      tableName: DatabaseConst.messageTable,
      model: {
        // DatabaseConst.columnId: id,
        DatabaseConst.messagesColumnLocalChatId: localChatId,
        DatabaseConst.messagesColumnSenderLocalId: senderId,
        DatabaseConst.messagesColumnIsWrittenToDb: isWrittenToDb,
        DatabaseConst.messagesColumnContent: content,
        DatabaseConst.messagesColumnDate: date
      },
    );

    await stub.createMessage(
      Message(chatIdMaint: 1, senderMainId: 1, content: content, date: date),
    );
  }

  @override
  deleteMessage({required int id}) {
    // TODO: implement deleteMessage
    throw UnimplementedError();
  }

  @override
  Future<List<Message>> getAllMessages() async {
    var stub = GrpcChatClient(channel);
    var db = await DBHelper.instanse.database;
    var message = await db.rawQuery('SELECT * FROM messages');

    return message
        .map((item) => Message(
            chatIdMaint:
                item[DatabaseConst.messagesColumnLocalMessagesId] as int,
            senderMainId: item['sender_id'] as int,
            content: item['content'] as String,
            date: item['date'] as String))
        .toList();
  }

  @override
  getMessageById({required int id}) {
    // TODO: implement getMessageById
    throw UnimplementedError();
  }

  @override
  getMessagesByChatId({required int chatID}) {
    // TODO: implement getMessagesByChatId
    throw UnimplementedError();
  }

  @override
  getMessagesBySenderId({required int senderID}) {
    // TODO: implement getMessagesBySenderId
    throw UnimplementedError();
  }

  @override
  updateMessage({required String newValues, required String condition}) {
    // TODO: implement updateMessage
    throw UnimplementedError();
  }
}
