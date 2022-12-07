import 'package:grpc/grpc.dart';

class GrpcClient {
  final ClientChannel _channel;

  GrpcClient()
      : _channel = ClientChannel('192.168.16.107',
            port: 5000,
            options: const ChannelOptions(
              credentials: ChannelCredentials.insecure(),
            ));

  ClientChannel get channel => _channel;
}
