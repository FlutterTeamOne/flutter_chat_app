import '../../src/libs/models_lib.dart';
import 'local_chat_impl.dart';

abstract class ILocalChatsServices {
  factory ILocalChatsServices() => LocalChatServices();
  createChat({required int chatIdMainDB, required int friendId});

  getChatById({required int id});

  deleteChat({required int id});

  Future<List<ChatModel>> getAllChats();
  getMainIdChatByMessage({required int localId});
}

final localChatServices = ILocalChatsServices();
