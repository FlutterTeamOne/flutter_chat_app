import 'package:grpc/grpc.dart';

import '../../src/generated/users/users.pbgrpc.dart';

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

  Future deleteUser({required int userId, required String deleteDate}) async {
    late GrpcClient stub;
    stub = GrpcClient();
    // var request = DeleteUserRequest()
    // ..dateDeleted = deleteDate
    // ..id = userId;
    var response = await stub.deleteUser(userId: userId, deleteDate: deleteDate);
    print('User delete: $response');
    return response;
  }
}
