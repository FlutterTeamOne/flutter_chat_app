import 'dart:async';
import 'dart:io';
import 'package:grpc/grpc.dart';
import 'package:grpc_connection/proto/generated/grpc_connection_exports.dart';

class Client {
  ClientChannel? channel;
  ConnectionServiceClient? stub;
  dynamic message;
  String? response;
  bool? isConnected;
  Future<void> main() async {
    channel = ClientChannel('localhost',
        port: 5000,
        options:
            const ChannelOptions(credentials: ChannelCredentials.insecure()));

    stub = ConnectionServiceClient(channel!,
        options: CallOptions(timeout: Duration(seconds: 5)));

    while (true) {
      try {
        print('wait connection status...');
        final result = await InternetAddress.lookup('www.google.com');
        message =
            await stub?.checkConnection(Message(message: result.toString()));
        response = message.toString();
        print(response);
        if (response!.contains('ok')) {
          isConnected = true;
        } else {
          isConnected = false;
        }
      } catch (e) {
        print("Соединение нет");
        isConnected = false;
      } finally {
        print('connection status: $isConnected');
      }
      await Future.delayed(Duration(seconds: 15));
      print('delay: 15 sec');
    }
  }
}

main() {
  var client = Client();
  client.main();
}
