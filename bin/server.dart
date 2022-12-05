import 'dart:math';

import 'package:flutter_chat_app/library.dart';
import 'package:grpc/grpc.dart';
import 'package:flutter_chat_app/src/db_server/database_helper/library_db.dart';

///
///Заполняем все методы как и в Protoc файле
///
class GrpcChat extends GrpcChatServiceBase {
  var messagesService = MessagesServices();
  var chatsService = ChatsServices();
  var usersService = UsersServices();

  @override
  Future<Empty> connecting(ServiceCall call, Empty request) {
    // TODO: implement connecting
    throw UnimplementedError();
  }

  @override
  Future<MessageBase> createMessage(ServiceCall call, Message request) async {
    var friendsChatId = chatsService.getChatByTwoIds(
        friend1_id: request.userMainId1, friend2_id: request.userMainId2);
    var src = messagesService.addNewMessage(
        friendsChatId: friendsChatId,
        senderId: request.senderMainId,
        content: request.content,
        date: request.date);
    print(src);
    var message = MessageBase();
    message.ok = false;
    return message;

    // // TODO: implement createMessage
    // var message = MessageBase();
    // message.ok = false;
    // Random rnd;
    // rnd = new Random();
    // var r = rnd.nextInt(5);
    // print("$r is in the range of $min and $max");
    // if (r % 2 == 0) {
    //   message.ok = true;
    //   return message;
    // }
    // return message;
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

  await server.serve(port: 8000);
  print('✅ Server listening on port ${server.port}...');
}
