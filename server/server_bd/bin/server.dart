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
  Future<Empty> connecting(ServiceCall call, Empty request) async {
    // TODO: implement connecting
    return Empty();
  }

  @override
  Future<MessageBase> createMessage(ServiceCall call, Message request) async {
    var src = await messagesService.addNewMessage(
        friendsChatId: request.chatIdMaint,
        senderId: request.senderMainId,
        content: request.content,
        date: request.date);

    var message = MessageBase();

    if (src != 0) {
      message.ok = true;
      message.mainMessagesId = src;
    } else {
      message.ok = false;
    }
    return message;
  }

  @override
  Stream<MessageBase> createMessages(
      ServiceCall call, Stream<Message> request) {
    // TODO: implement createNessages
    throw UnimplementedError();
  }

  @override
  Stream<MessageFromBase> synchronization(
      ServiceCall call, LastMessage request) async* {
    if (request.mainIdMessage == 0) {
      MessageFromBase lastMessage = MessageFromBase();
      yield lastMessage;
    } else {
      var messages = await messagesService.getRecentMessages(message: request);
      MessageFromBase lastMessage = MessageFromBase();
      if (messages.length == 0) {
        MessageFromBase lastMessage = MessageFromBase();
        yield lastMessage;
      } else {
        for (int i = 0; i < messages.length; i++) {
          MessageFromBase lastMessage = MessageFromBase();
          lastMessage.mainIdMessage = messages[i]['main_messages_id'];
          lastMessage.chatIdMain = messages[i]['friends_chat_id'];
          lastMessage.senderMainId = messages[i]['sender_id'];
          lastMessage.content = messages[i]['content'];
          lastMessage.date = messages[i]['date'];
          yield lastMessage;
        }
      }
    }
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

  await server.serve(port: 5000);
  print('✅ Server listening on port ${server.port}...');
}
