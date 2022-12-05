import 'dart:io';

import 'package:flutter_chat_app/library.dart';
import 'package:flutter_chat_app/signal_service/bloc/message/message_bloc.dart';
import 'package:grpc/grpc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_chat_app/signal_service/bloc/message/message_bloc.dart';
import 'package:flutter_chat_app/signal_service/bloc/message/message_bloc.dart';

import '../../../src/db_server/database_helper/library_db.dart';

class Client {
  ClientChannel? channel;
  //Класс заглушка, определяет все функции которые есть на сервере
  GrpcChatClient? stub;
  var response;
  bool executionInProgress = true;

  Future<void> SendMessage(Message message) async {
    channel = ClientChannel('localhost',
        port: 5000,
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

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);
  final IMessagesServices iMessagesServices = IMessagesServices();
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MessageBloc>(
          create: (context) => MessageBloc(messagesServices: iMessagesServices),
        ),
      ],
      child: MaterialApp(
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const Home()),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<MessageBloc, MessageState>(
          builder: (context, state) {
            return Column(
              children: [
                TextField(
                  controller: textController,
                  onSubmitted: (value) {
                    context.read<MessageBloc>().add(
                          MessageEvent.sent(
                            message: Message(content: value),
                          ),
                        );
                  },
                ),
                SizedBox(
                  height: 50,
                ),
                Text('')
              ],
            );
          },
        ),
      ),
    );
  }
}
