import 'package:flutter_chat_app/client/grpc_client.dart';
import 'package:flutter_chat_app/service/lib_db.dart';

abstract class IMessageIdServices {
  factory IMessageIdServices() =>
      MessageIdServices(channel: GrpcClient().channel);
  createMessageId({required int mainId, required int localId});

  updateMessageId({required String newValues, required String condition});

  deleteMessageId({required int mainId});
}

final messageIdServices = IMessageIdServices();
