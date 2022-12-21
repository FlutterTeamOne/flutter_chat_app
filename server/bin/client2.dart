// import 'dart:async';
// import 'dart:convert';
// import 'dart:io';
// import 'package:grpc/grpc.dart';
// import 'package:server/src/library/library_server.dart';

// late GrpcMessagesClient stub;

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:grpc/grpc.dart';
import 'package:server/src/generated/messages.pbgrpc.dart';
import 'package:server/src/generated/messages.pbjson.dart';

Future<void> main(List<String> args) async {
  if (args.isEmpty) {
    print('Specify your name please.');
    return;
  }
  var id = int.tryParse(args[0]) as int;

  final channel = ClientChannel('localhost',
      port: 50000,
      options: const ChannelOptions(
        credentials: ChannelCredentials.insecure(),
      ));

  final client = GrpcMessagesClient(channel);
  StreamController controller = StreamController.broadcast();
  final responses = client.streamMessage(postStream(id));
  print('responses:  $responses');
  try {
    await for (final res in responses) {
      print("res: ${res.messageState}");
      if (res.messageState == MessageStateEnum.isCreateMessage) {
        print('[${res.createMessage.message}]');
      } else if (res.messageState == MessageStateEnum.isReadMessage) {
        print('[${res.readMessage.message}]');
      }
    }
  } catch (e) {
    print(e);
  } finally {
    await channel.shutdown();
    exit(0);
  }
}

Stream<DynamicRequest> postStream(int id) async* {
  var stub = GrpcMessagesClient(ClientChannel('localhost',
      port: 5000,
      options: const ChannelOptions(
        credentials: ChannelCredentials.insecure(),
      )));
  yield DynamicRequest(
      messageState: MessageStateEnum.connecting,
      createMessage: CreateMessageRequest(message: Message(senderId: id)));
  while (true) {
    // var utf8;
    final lines = stdin.transform(utf8.decoder).transform(const LineSplitter());
    await for (final line in lines) {
      var reqMsg = DynamicRequest(
          createMessage: CreateMessageRequest(
            message: Message(
                localMessgaeId: 72,
                content: line,
                chatId: 1,
                senderId: id,
                messageId: 88,
                dateCreate: DateTime.now().toIso8601String()),
          ),
          messageState: MessageStateEnum.isCreateMessage);
      yield reqMsg;
    }
    // var str = Stream<ReadMessageRequest>.value(reqMsg);
    // var resp = stub.readMessage(str);
    // print('stub read');
    // await for (var res in resp) {
    //   print('RES: ${res.message}');
    // }
  }
}


// Future read() async {
//   StreamController<List<Message>> messageController =
//       StreamController.broadcast();
//   var stub = GrpcMessagesClient(channel);
//   var message = Message()
//     ..chatId = 1
//     ..senderId = 1
//     ..content = ''
//     ..dateCreate = DateTime.now().toIso8601String();

//   //
//   stub.readMessage(message: message);
// }

//   stub = GrpcMessagesClient(channel);
//   print("before try");
//   try {
//     print("try");
//     await connectChat(id);
//   } catch (e) {
//     print(e);
//     print("ошибка");
//   }
//   print("before true");
//   while (true) {
//     final lines = stdin.readLineSync();
//     try {
//       await createMes(CreateMessageRequest(
//           chatIdMain: 1, senderMainId: id, content: lines));
//     } catch (e) {
//       print(e);
//     }
//     if (lines == 'bue') {
//       print("bue");
//       channel.shutdown();
//       break;
//     }
//   }
// }

// Future<void> createMes(CreateMessageRequest message) async {
//   var response = CreateMessageResponse();
//   try {
//     response = await stub.createMessage(message);
//   } catch (e) {
//     print(e);
//   } finally {
//     if (response.mainMessagesId != 0) {
//       print('Записали сообщение на сервер');
//     } else {
//       print('Произошла ошибка с записью, попробуй еще раз');
//     }
//   }
// }

// Future<void> connectChat(int id) async {
//   StreamController<MessageFromBase> connect = StreamController.broadcast();

//   Stream<ConnectRequest> enter(int id_1) async* {
//     yield ConnectRequest(id: id_1);
//   }

//   final call = stub.connectings(enter(id));
//   call.listen((value) {
//     Future.delayed(Duration(milliseconds: 100), () => connect.add(value));
//     print('CALL LISTEN: $value');
//   });
//   // await for (final res in call) {
//   //   connect.add(res);
//   //   print('[${res.chatIdMain}] ${res.content}');
//   // }
//   // await for (var res in connect.stream) {
//   //   print(res);
//   // }
// }
