import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat_app/features/presentation/main_layout/main_layout.dart';
import 'package:flutter_chat_app/sender_manager/conncetion_bloc/connection_bloc.dart';

import 'client/grpc_client.dart';
import 'signal_service/message_bloc/message_bloc.dart';
import 'signal_service/user_bloc/user_bloc.dart';
import 'storage_manager/db_helper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
        BlocProvider<MessageBloc>(
          create: (context) =>
              MessageBloc(grpcClient: grpcClient)..add(ReadMessageEvent()),
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
