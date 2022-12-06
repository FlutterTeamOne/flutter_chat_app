import 'package:flutter_chat_app/client/grpc_client.dart';

import 'local_chat_impl.dart';

abstract class ILocalChatsServices {
  factory ILocalChatsServices() =>
      LocalChatServices(channel: GrpcClient().channel);
  createChat({required int chatIdMainDB, required int friendId});

  getChatById({required int id});

  deleteChat({required int id});

  getAllChats();
  getMainIdChatByMessage({required int localId});
}

final localChatServices = ILocalChatsServices();
