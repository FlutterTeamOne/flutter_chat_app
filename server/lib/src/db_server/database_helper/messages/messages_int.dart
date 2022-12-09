import 'package:server/src/generated/grpc_manager.pb.dart';
import 'package:server/src/library/library_server.dart';

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