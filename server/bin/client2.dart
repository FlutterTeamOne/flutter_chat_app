import 'dart:convert';
import 'dart:io';
import 'package:grpc/grpc.dart';
import 'package:server/src/generated/grpc_manager.pbgrpc.dart';

late GrpcChatClient stub;

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
  stub = GrpcChatClient(channel);
  print("before try");
  try {
    print("try");
    await connectChat(id);
  } catch (e) {
    print(e);
    print("ошибка");
  }
  print("before true");
  // while (true) {
  //   final lines = stdin.readLineSync();
  //   print("a");
  //   try {
  //     print("b");
  //     await createMes(CreateMessageRequest(
  //         chatIdMain: 1, senderMainId: id, content: lines));
  //   } catch (e) {
  //     print(e);
  //   }
  // }
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
  Stream<ConnectRequest> enter(int id_1) async* {
    yield ConnectRequest(id: id_1);
  }

  final call = stub.connectings(enter(id));
  await for (final res in call) {
    print('[${res.chatIdMain}] ${res.content}');
  }
}
