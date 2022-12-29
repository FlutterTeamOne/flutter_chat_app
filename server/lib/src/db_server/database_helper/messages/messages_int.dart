import '../../../library/library_server.dart';

abstract class IMessagesDBServices {
  factory IMessagesDBServices() => MessagesDBServices();

  addNewMessage({
     required int chatId,
    required int senderId,
    required String content,
    int? attachmentId,
    required ContentType contentType,
  });

  getMessageById({required int id});

  updateMessage({required String newValues, required String condition});

  deleteMessage({required int id});

  getMessagesBySenderId({required int senderId});

  getMessagesByChatId({required int chatId});

  getAllMessages();

  // getRecentMessages({required LastMessage message});
}

final messagesServices = IMessagesDBServices();
