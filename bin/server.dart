import 'dart:math';

import 'package:flutter_chat_app/library.dart';
import 'package:grpc/grpc.dart';

///
///Заполняем все методы как и в Protoc файле
///
class GrpcChat extends GrpcChatServiceBase {
  @override
  Future<Empty> connecting(ServiceCall call, Empty request) {
    // TODO: implement connecting
    throw UnimplementedError();
  }

  @override
  Future<MessageBase> createMessage(ServiceCall call, Message request) async {
    // TODO: implement createMessage
    var message = MessageBase();
    message.ok = false;
    Random rnd;
    rnd = new Random();
    var r = rnd.nextInt(5);
    print("$r is in the range of $min and $max");
    if (r % 2 == 0) {
      message.ok = true;
      return message;
    }
    return message;
  }

  @override
  Stream<MessageBase> createNessages(
      ServiceCall call, Stream<Message> request) {
    // TODO: implement createNessages
    throw UnimplementedError();
  }
}

///
///Настройка
///
Future<void> main() async {
  final server = Server(
    [GrpcChat()], //

    const <Interceptor>[], //Перехватчик

    //Реестр кодеков, отслеживает чем будем пользоваться
    CodecRegistry(codecs: const [GzipCodec(), IdentityCodec()]),
  );

  await server.serve(port: 50000);
  print('✅ Server listening on port ${server.port}...');
}
