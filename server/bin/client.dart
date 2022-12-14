import 'package:grpc/grpc.dart';

import '../lib/src/generated/grpc_manager.pbgrpc.dart';

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
    // print('Do you wish to exit the store? (Y/n)');
    // //Пользовательский ввод в консоль
    // var result = stdin.readLineSync() ?? 'y';
    // executionInProgress = result.toLowerCase() != 'y';
  }

// await channel!.shutdown();
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
// }

var con = false;
void main() async {
  var client = Client();
  var message = Message();
  message.chatIdMaint = 1;
  message.senderMainId = 1;
  message.content = "Hello";
  message.date = "2022-12-02T21:36:32.653712";

  ///
  ///Если присылает один и тот же mainMessageId
  ///поменяй message.date или message.content
  ///
  print("Обратный ответ:");
  print(await client.SendMessage(message));
}
