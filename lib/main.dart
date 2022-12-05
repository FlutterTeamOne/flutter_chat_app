import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat_app/features/presentation/main_layout/main_layout.dart';
import 'package:flutter_chat_app/sender_manager/conncetion_bloc/connection_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ConnectionBloc>(
          create: (context) => ConnectionBloc(),
        )
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
