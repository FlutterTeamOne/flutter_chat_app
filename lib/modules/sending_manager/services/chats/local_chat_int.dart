import 'package:chat_app/domain/data/library/library_data.dart';

import 'local_chat_impl.dart';

abstract class ILocalChatsServices {
  factory ILocalChatsServices() => LocalChatServices();
  createChat({required int chatIdMainDB, required int friendId});

  getChatById({required int id});

  deleteChat({required int id});

  Future<List<ChatDto>> getAllChats();
  getMainIdChatByMessage({required int localId});
}

final localChatServices = ILocalChatsServices();
