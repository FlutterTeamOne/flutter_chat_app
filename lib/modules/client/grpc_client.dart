import 'package:grpc/grpc.dart';

class GrpcClient {
  final ClientChannel _channel;

  GrpcClient()
      : _channel = ClientChannel('localhost',
            port: 6000,
            options: const ChannelOptions(
              credentials: ChannelCredentials.insecure(),
            ));

  ClientChannel get channel => _channel;
  Stream<ConnectionState> get channelState => _channel.onConnectionStateChanged;
}
