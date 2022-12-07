// import 'dart:io';

// import 'package:flutter_chat_app/library.dart';
// import 'package:flutter_chat_app/signal_service/bloc/message/message_bloc.dart';
// import 'package:grpc/grpc.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../../../client/grpc_client.dart';
// import '../../../src/db_server/database_helper/library_db.dart';
// import '../../../storage_manager/db_helper.dart';
// import '../msg_bloc.dart';

// class Client {
//   ClientChannel? channel;
//   //Класс заглушка, определяет все функции которые есть на сервере
//   GrpcChatClient? stub;
//   var response;
//   bool executionInProgress = true;

//   Future<void> SendMessage(Message message) async {
//     channel = ClientChannel('localhost',
//         port: 5000,
//         options:
//             const ChannelOptions(credentials: ChannelCredentials.insecure()));

//     stub = GrpcChatClient(channel!,
//         options: CallOptions(timeout: const Duration(seconds: 30)));

//     while (executionInProgress) {
//       try {
//         print('---- Welcome to the dart store API ---');
//         print('   ---- what do you want to do? ---');
//         print('👉 0: Connecting');
//         print('👉 1: Send Message to server');

//         var option = int.parse(stdin.readLineSync()!);
//         switch (option) {
//           case 1:
//             response = await stub!.createMessage(message);
//             if (response.ok) {
//               print('Записали сообщение на сервер');
//             } else {
//               print('Произошла ошибка с записью, попробуй еще раз');
//             }
//             break;
//         }
//       } catch (e) {
//         print(e);
//       }

//       print('Do you wish to exit the store? (Y/n)');
//       //Пользовательский ввод в консоль
//       var result = stdin.readLineSync() ?? 'y';
//       executionInProgress = result.toLowerCase() != 'y';
//     }

//     await channel!.shutdown();
//   }

//   // Future<Category> _findCategoryByName(String name) async {
//   //   var category = Category()..name = name;
//   //   category = await stub!.getCategory(category);
//   //   return category;
//   // }

//   // Future<Item> _findItemByName(String name) async {
//   //   var item = Item()..name = name;
//   //   item = await stub!.getItem(item);
//   //   return item;
//   // }
// }

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await DBHelper.instanse.initDB();
//   runApp(App());
// }

// class App extends StatelessWidget {
//   App({Key? key}) : super(key: key);
//   // final IMessagesServices iMessagesServices = IMessagesServices();
//   final GrpcClient grpcClient = GrpcClient();
//   @override
//   Widget build(BuildContext context) {
//     return MultiBlocProvider(
//       providers: [
//         BlocProvider<MsgBloc>(
//           create: (context) =>
//               MsgBloc(grpcClient: grpcClient)..add(ReadMessageEvent()),
//         ),
//       ],
//       child: MaterialApp(
//           theme: ThemeData(
//             primarySwatch: Colors.blue,
//           ),
//           home: const Home()),
//     );
//   }
// }

// class Home extends StatefulWidget {
//   const Home({Key? key}) : super(key: key);

//   @override
//   State<Home> createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   final textController = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: BlocConsumer<MsgBloc, MsgState>(
//         listener: (context, state) {
//           // context.read<MsgBloc>().stream.listen((event) {});
//         },
//         builder: (context, state) {
//           return CustomScrollView(
//             slivers: [
//               SliverToBoxAdapter(
//                 child: Column(
//                   children: [
//                     TextField(
//                       controller: textController,
//                       onSubmitted: (value) {
//                         context.read<MsgBloc>().add(
//                               CreateMessageEvent(
//                                 message: Message(
//                                     userMainId1: 1,
//                                     userMainId2: 2,
//                                     senderMainId: 1,
//                                     content: value,
//                                     date: DateTime.now().toIso8601String()),
//                               ),
//                             );
//                         textController.clear();
//                       },
//                     ),
//                     const SizedBox(
//                       height: 50,
//                     ),
//                   ],
//                 ),
//               ),
//               SliverToBoxAdapter(
//                   child: state.messages != null
//                       ? ListView.builder(
//                           shrinkWrap: true,
//                           reverse: true,
//                           itemCount: state.messages?.length,
//                           itemBuilder: (context, index) {
//                             var message = state.messages?[index];
//                             return ListTile(
//                               title: Text(message!.content),
//                             );
//                           })
//                       : Center(
//                           child: Text('no message'),
//                         ))
//             ],
//           );
//         },
//       ),
//     );
//   }
// }
