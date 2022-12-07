import 'dart:io';
import 'package:window_size/window_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/presentation/main_layout/main_layout.dart';
import 'sender_manager/conncetion_bloc/connection_bloc.dart';
import 'signal_service/message_id_in_main_bloc/message_id_in_main_bloc.dart';

import 'client/grpc_client.dart';
import 'signal_service/chat_bloc/chat_bloc.dart';
import 'signal_service/message_bloc/message_bloc.dart';
import 'signal_service/user_bloc/user_bloc.dart';
import 'storage_manager/db_helper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    setWindowMinSize(const Size(960, 480));
  }
  await DBHelper.instanse.initDB();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final GrpcClient grpcClient = GrpcClient();
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ConnectionBloc>(
          create: (context) => ConnectionBloc(),
        ),
        BlocProvider<UserBloc>(
          create: (context) => UserBloc()..add(ReadUsersEvent()),
        ),
        BlocProvider<ChatBloc>(
          create: (context) =>
              ChatBloc(userBloc: UserBloc())..add(ReadChatEvent()),
        ),
        BlocProvider<MessageBloc>(
          create: (context) =>
              MessageBloc(grpcClient: grpcClient)..add(ReadMessageEvent()),
        ),
        BlocProvider<MessageIdInMainBloc>(
          create: (context) => MessageIdInMainBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter chat app',
        theme: ThemeData(useMaterial3: true),
        debugShowCheckedModeBanner: false,
        initialRoute: MainLayout.routeName,
        routes: {
          MainLayout.routeName: (context) => const MainLayout(),
          '/mainLayout': (context) => const MainLayout(),
        },
      ),
    );
  }
}
