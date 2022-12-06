import 'dart:io';
import 'dart:math';
import 'package:grpc/grpc.dart';
import 'package:flutter_chat_app/library.dart';

class Client {
  ClientChannel? channel;
  //Класс заглушка, определяет все функции которые есть на сервере
  GrpcChatClient? stub;
  var response;
  bool executionInProgress = true;

  Future<MessageBase> SendMessage(Message message) async {
    channel = ClientChannel('localhost',
        port: 50000,
        options:
            const ChannelOptions(credentials: ChannelCredentials.insecure()));

    stub = GrpcChatClient(channel!,
        options: CallOptions(timeout: Duration(seconds: 30)));

    try {
      response = await stub!.createMessage(message);
    } catch (e) {
      print(e);
      response = MessageBase(ok: false, mainMessagesId: 0);
    } finally {
      if (response.ok) {
        print('Записали сообщение на сервер');
      } else {
        print('Произошла ошибка с записью, попробуй еще раз');
      }
      await channel!.shutdown();
    }
    return response;
  }
}

var con = false;
void main() async {
  var client = Client();
  var message = Message();
  message.chatIdMaint = 1;
  message.senderMainId = 2;
  message.content = "Hello";
  message.date = "2022-12-02T21:36:32.653715";

  ///
  ///Если присылает один и тот же mainMessageId
  ///поменяй message.date или message.content
  ///
  print("Обратный ответ:");
  print(await client.SendMessage(message));
}
