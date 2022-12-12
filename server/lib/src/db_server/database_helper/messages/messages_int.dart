import '../../../generated/grpc_manager.pb.dart';
import '../../../library/library_server.dart';

abstract class IMessagesServices {
  factory IMessagesServices() => MessagesServices();

  addNewMessage({
    required int chatId,
    required int senderId,
    required String content,
    required String createdDate,
    required String updatedDate,
    required String deletedDate,
  });

  getMessageById({required int id});

  updateMessage({required String newValues, required String condition});

  deleteMessage({required int id});

  getMessagesBySenderId({required int senderId});

  getMessagesByChatId({required int chatId});

  getAllMessages();

  getRecentMessages({required LastMessage message});
}

final messagesServices = IMessagesServices();
