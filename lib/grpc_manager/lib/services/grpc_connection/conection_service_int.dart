import 'package:grpc_connection/proto/generated/grpc_connection/grpc_connection.pb.dart';
import 'package:grpc_connection/services/grpc_connection/connection_service.impl.dart';

abstract class IConnectionServices {
  factory IConnectionServices() => ConnectionServices();
  Message? checkConnection(Message message);
}

final connectionServices = ConnectionServices();
