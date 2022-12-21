import 'package:grpc/grpc.dart';

import '../../src/generated/users/users.pbgrpc.dart';
import '../../src/generated/grpc_lib/grpc_user_lib.dart';

class GrpcClient {
  final ClientChannel _channel;

  GrpcClient()
      : _channel = ClientChannel('localhost',
            port: 50000,
            options: const ChannelOptions(
              credentials: ChannelCredentials.insecure(),
            ));

  ClientChannel get channel => _channel;
  Stream<ConnectionState> get channelState => _channel.onConnectionStateChanged;

  Future deleteUser({required int userId}) async {
    late GrpcUsersClient stub;
    stub = GrpcUsersClient(channel,
        options: CallOptions(timeout: Duration(seconds: 30)));
    var request = DeleteUserRequest()..id = userId;
    var response = await stub.deleteUser(request);
    print('User delete: $response');
    return response;
  }
}
