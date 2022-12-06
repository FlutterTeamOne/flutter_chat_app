import 'package:flutter_chat_app/src/generated/grpc_chat.pbgrpc.dart';

import '../../client/grpc_client.dart';
import 'local_message_impl.dart';

abstract class ILocalMessagesServices {
  factory ILocalMessagesServices() =>
      LocalMessagesServices(channel: GrpcClient().channel);

  void addNewMessage(
      {required int localChatId,
      required int senderId,
      required String content,
      required String date});

  void getMessageById({required int id});

  void updateMessage({required String newValues, required String condition});

  void deleteMessage({required int id});

  getMessagesBySenderId({required int senderID});

  getMessagesByChatId({required int chatID});

  getAllMessages();
}

final localMessagesServices = ILocalMessagesServices();
