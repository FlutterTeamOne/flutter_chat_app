import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:grpc/grpc.dart';

import 'package:server/src/library/library_server.dart';

late GrpcMessagesClient stub;

Future<void> main(List<String> args) async {
  if (args.isEmpty) {
    print('Specify your name please.');
    return;
  }

  var id = int.tryParse(args[0]) as int;

  final channel = ClientChannel(
    'localhost',
    port: 50000,
    options: const ChannelOptions(
      credentials: ChannelCredentials.insecure(),
    ),
  );
  stub = GrpcMessagesClient(channel);
  print("before try");
  try {
    print("try");
    await connectChat(id);
  } catch (e) {
    print(e);
    print("ошибка");
  }
  print("before true");
  while (true) {
    final lines = stdin.readLineSync();
    try {
      await createMes(CreateMessageRequest(
          chatIdMain: 1, senderMainId: id, content: lines));
    } catch (e) {
      print(e);
    }
    if (lines == 'bue') {
      print("bue");
      channel.shutdown();
      break;
    }
  }
}

Future<void> createMes(CreateMessageRequest message) async {
  var response = CreateMessageResponse();
  try {
    response = await stub.createMessage(message);
  } catch (e) {
    print(e);
  } finally {
    if (response.mainMessagesId != 0) {
      print('Записали сообщение на сервер');
    } else {
      print('Произошла ошибка с записью, попробуй еще раз');
    }
  }
}

Future<void> connectChat(int id) async {
  StreamController<MessageFromBase> connect = StreamController.broadcast();

  Stream<ConnectRequest> enter(int id_1) async* {
    yield ConnectRequest(id: id_1);
  }

  final call = stub.connectings(enter(id));
  call.listen((value) {
    Future.delayed(Duration(milliseconds: 100), () => connect.add(value));
    print(value);
  });
  // await for (final res in call) {
  //   connect.add(res);
  //   print('[${res.chatIdMain}] ${res.content}');
  // }
  // await for (var res in connect.stream) {
  //   print(res);
  // }
}
