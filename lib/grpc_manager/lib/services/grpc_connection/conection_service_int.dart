// import 'package:flutter_chat_app/grpc_manager/lib/proto/generated/grpc_connection_exports.dart';
// import 'package:flutter_chat_app/grpc_manager/lib/services/grpc_connection/connection_service.impl.dart';
import 'package:grpc_connection/services/grpc_connection/connection_service.impl.dart';

import '../../proto/generated/grpc_connection/grpc_connection.pb.dart';

abstract class IConnectionServices {
  factory IConnectionServices() => ConnectionServices();
  Message? checkConnection(Message message);
}

final connectionServices = ConnectionServices();
