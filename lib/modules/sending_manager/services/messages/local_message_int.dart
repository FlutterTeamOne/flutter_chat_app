import '../../../../domain/data/library/library_data.dart';
import 'local_message_impl.dart';

abstract class ILocalMessagesServices {
  factory ILocalMessagesServices() => LocalMessagesServices();

  Future<dynamic> addNewMessage(
      {required int localChatId,
      required int senderId,
      required String content,
      required String date});

  Future<Map<String, Object?>> getMessageById({required int id});

  Future updateMessage(
      {required  MessageDto message, required int localMessageId});

  Future<int> deleteMessage({required int id});

  Future<List<Map<String, Object?>>> getMessagesBySenderId(
      {required int senderID});

  Future<List<Map<String, Object?>>> getMessagesByChatId({required int chatID});

  Future<List<MessageDto>> getAllMessages();

  Future<int> deleteAllMessagesInChat({required int chatID});
}

final localMessagesServices = ILocalMessagesServices();
