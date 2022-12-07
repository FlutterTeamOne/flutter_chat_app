import 'dart:io';
import 'package:window_size/window_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_app/features/presentation/main_layout/main_layout.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    setWindowMinSize(const Size(960, 480));
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter chat app',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const MainLayout(),
        '/mainLayout': (context) => const MainLayout(),
      },
    );
  }
}
