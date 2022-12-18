import 'package:grpc/grpc.dart';
import 'package:server/src/library/library_server.dart';

class Client {
  ClientChannel? channel;
  //Класс заглушка, определяет все функции которые есть на сервере
  GrpcMessagesClient? stub;
  late CreateMessageResponse response;
  bool executionInProgress = true;

  // Future<CreateMessageResponse> SendMessage(
  //     CreateMessageRequest message) async {
  //   channel = ClientChannel('localhost',
  //       port: 5000,
  //       options:
  //           const ChannelOptions(credentials: ChannelCredentials.insecure()));

  //   stub = GrpcChatClient(channel!,
  //       options: CallOptions(timeout: Duration(seconds: 30)));

  //   try {
  //     response = CreateMessageResponse();
  //     print('message: $message');
  //     response = await stub!.createMessage(message);
  //     print('rc: ${response.dateCreate} ');
  //     print('id: ${response.mainMessagesId}');
  //   } catch (e) {
  //     print(e);
  //     print('id: ${response.mainMessagesId}');
  //   } finally {
  //     if (response.mainMessagesId != 0) {
  //       print('Записали сообщение на сервер');
  //     } else {
  //       print('Произошла ошибка с записью, попробуй еще раз');
  //     }
  //     await channel!.shutdown();
  //   }
  //   return response;
  //   // print('Do you wish to exit the store? (Y/n)');
  //   // //Пользовательский ввод в консоль
  //   // var result = stdin.readLineSync() ?? 'y';
  //   // executionInProgress = result.toLowerCase() != 'y';
  // }

  // Future<UpdateMessageResponse> UpdateMessage(
  //     UpdateMessageRequest message) async {
  //   channel = ClientChannel('localhost',
  //       port: 5000,
  //       options:
  //           const ChannelOptions(credentials: ChannelCredentials.insecure()));

  //   stub = GrpcChatClient(channel!,
  //       options: CallOptions(timeout: Duration(seconds: 30)));
  //   var response = UpdateMessageResponse();
  //   try {
  //     print('message: $message');
  //     response = await stub!.updateMessage(message);
  //     print('RESP: $response');
  //   } catch (e) {
  //     print(e);
  //     print('id: ${response.idMessageMain}');
  //   } finally {
  //     if (response.idMessageMain != 0) {
  //       print('Записали сообщение на сервер');
  //     } else {
  //       print('Произошла ошибка с записью, попробуй еще раз');
  //     }
  //     await channel!.shutdown();
  //   }
  //   return response;
  //   // print('Do you wish to exit the store? (Y/n)');
  //   // //Пользовательский ввод в консоль
  //   // var result = stdin.readLineSync() ?? 'y';
  //   // executionInProgress = result.toLowerCase() != 'y';
  // }

  Future<Users> getUsers(Empty message) async {
    channel = ClientChannel('localhost',
        port: 5000,
        options:
            const ChannelOptions(credentials: ChannelCredentials.insecure()));

    stub = GrpcMessagesClient(channel!, options: CallOptions());

    var response = Users();
    try {
      print('message: $message');
      response = await stub!.getAllUsers(message);
      print('RESP: $response');
    } catch (e) {
      print(e);
    } finally {
      await channel!.shutdown();
    }
    return response;
  }

// // await channel!.shutdown();
//   Future<UpdateUserResponse> updateUser(UpdateUserRequest user) async {
//     var resp = UpdateUserResponse();

//     return resp;
//   }
// }

// Future<DeleteMessageResponse> deleteMessage(
//     DeleteMessageRequest message) async {
//   // channel = ClientChannel('localhost',
//   //     port: 5000,
//   //     options:
//   //         const ChannelOptions(credentials: ChannelCredentials.insecure()));
//   // stub = GrpcChatClient(channel!,
//   //     options: CallOptions(timeout: Duration(seconds: 30)));
//   var resp = DeleteMessageResponse();
//   return resp;
}

//var con = false;
void main() async {
  var client = Client();
  var messageEmpty = Empty();
  print("Обратный ответ:");
  print(await client.getUsers(messageEmpty));
}
