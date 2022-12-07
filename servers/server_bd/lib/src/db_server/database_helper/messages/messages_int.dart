import 'package:server_bd/src/db_server/database_helper/library_db.dart';

abstract class IMessagesServices {
  factory IMessagesServices() => MessagesServices();

  addNewMessage(
      {required int friendsChatId,
      required int senderId,
      required String content,
      required String date});

  getMessageById({required int id});

  updateMessage({required String newValues, required String condition});

  deleteMessage({required int id});

  getMessagesBySenderId({required int senderID});

  getMessagesByChatId({required int chatID});

  getAllMessages();

  getRecentMessages({required LastMessage message});
}

final messagesServices = IMessagesServices();
