import '../../../../domain/data/library/library_data.dart';

import 'local_chat_impl.dart';

abstract class ILocalChatsServices {
  factory ILocalChatsServices() => LocalChatServices();
  createChat(
      {required String createDate, required int userId, required int chatId});

  getChatById({required int id});

  deleteChat({required int id});

  Future<List<ChatDto>> getAllChats();
  getMainIdChatByMessage({required int localId});
  // Future<int> updateChat({required int chatId});
  Future updateChatDateUpdated(
      {required int chatId, required String dateUpdated});
  Future<int> getMaxId();
  Future<List<Map<String, Object?>>> getChatByUserId({required int id});
  Future<int> getUserIdByChatId({required int id});
}

final localChatServices = ILocalChatsServices();
