

import '../../proto/generated/grpc_connection_exports.dart';
import 'connection_service.impl.dart';

abstract class IConnectionServices {
  factory IConnectionServices() => ConnectionServices();
  Message? checkConnection(Message message);
}

final connectionServices = ConnectionServices();
