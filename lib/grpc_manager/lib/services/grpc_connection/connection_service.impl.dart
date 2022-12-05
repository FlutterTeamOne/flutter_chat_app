import 'package:flutter_chat_app/grpc_manager/lib/proto/generated/grpc_connection_exports.dart';
import 'package:flutter_chat_app/grpc_manager/lib/services/grpc_connection/conection_service_int.dart';

class ConnectionServices implements IConnectionServices {
  @override
  Message? checkConnection(Message message) {
    if (message.message.isNotEmpty && message.message[0].isNotEmpty) {
      return Message(message: 'ok');
    } else {
      return Message(message: '404');
    }
  }
}
