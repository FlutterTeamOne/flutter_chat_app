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

  Future<void> SendMessage(Message message) async {
    channel = ClientChannel('localhost',
        port: 50000,
        options:
            const ChannelOptions(credentials: ChannelCredentials.insecure()));

    stub = GrpcChatClient(channel!,
        options: CallOptions(timeout: Duration(seconds: 30)));

    while (executionInProgress) {
      try {
        print('---- Welcome to the dart store API ---');
        print('   ---- what do you want to do? ---');
        print('👉 0: Connecting');
        print('👉 1: Send Message to server');

        var option = int.parse(stdin.readLineSync()!);
        switch (option) {
          case 1:
            response = await stub!.createMessage(message);
            if (response.ok) {
              print('Записали сообщение на сервер');
            } else {
              print('Произошла ошибка с записью, попробуй еще раз');
            }
            break;
        }
      } catch (e) {
        print(e);
      }

      print('Do you wish to exit the store? (Y/n)');
      //Пользовательский ввод в консоль
      var result = stdin.readLineSync() ?? 'y';
      executionInProgress = result.toLowerCase() != 'y';
    }

    await channel!.shutdown();
  }

  // Future<Category> _findCategoryByName(String name) async {
  //   var category = Category()..name = name;
  //   category = await stub!.getCategory(category);
  //   return category;
  // }

  // Future<Item> _findItemByName(String name) async {
  //   var item = Item()..name = name;
  //   item = await stub!.getItem(item);
  //   return item;
  // }
}

var con = false;
void main() {
  var client = Client();
  var message = Message();
  message.userMainId1 = 1;
  message.userMainId2 = 2;
  message.senderMainId = 2;
  message.content = "Hello";
  client.SendMessage(message);
}
