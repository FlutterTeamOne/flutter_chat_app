import 'package:grpc/grpc.dart' as grpc;

import 'package:grpc_connection/proto/generated/grpc_connection_exports.dart';
import 'package:grpc_connection/services/grpc_connection/conection_service_int.dart';

class ConnectionService extends ConnectionServiceBase {
  @override
  Future<Message> checkConnection(
          grpc.ServiceCall call, Message request) async =>
      connectionServices.checkConnection(request)!;
}

Future<void> main(List<String> args) async {
  final server = grpc.Server([ConnectionService()]);
  await server.serve(port: 5000);
  print('Server listening...');
}
