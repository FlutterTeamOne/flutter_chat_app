import '../../../../domain/data/library/library_data.dart';

import 'local_chat_impl.dart';

abstract class ILocalChatsServices {
  factory ILocalChatsServices() => LocalChatServices();
  createChat({required String createDate, required int userId});

  getChatById({required int id});

  deleteChat({required int id});

  Future<List<ChatDto>> getAllChats();
  getMainIdChatByMessage({required int localId});
  Future<int> updateChat({required int chatId});
}

final localChatServices = ILocalChatsServices();
