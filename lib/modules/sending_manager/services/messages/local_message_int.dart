import 'local_message_impl.dart';

abstract class ILocalMessagesServices {
  factory ILocalMessagesServices() => LocalMessagesServices();

  void addNewMessage(
      {required int localChatId,
        required int senderId,
        required String content,
        required String date});

  void getMessageById({required int id});

  Future<int> updateMessage({required String newValues, required  int localMessageId});

  void deleteMessage({required int id});

  getMessagesBySenderId({required int senderID});

  getMessagesByChatId({required int chatID});

  getAllMessages();
}

final localMessagesServices = ILocalMessagesServices();
