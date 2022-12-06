import 'package:flutter/material.dart';
import 'library_db.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<String> fromBase() async {
    var db = await dbServerServices.openDatabase();
    // db.createDatabase();

    //Обращаемся к методам работы с таблицей чатов через:
    var chatsHelper = ChatsServices();

    //Обращаемся к методам работы с таблицей сообщений через:
    var messagesService = MessagesServices();

    //Обращаемся к методам работы с таблицей юзеров через:
    var usersService = UsersServices();

    // db.rawUpdate(''' UPDATE messages
    //         SET content = 'Zdarova papasha'
    //         WHERE main_message_id = '22';
    //               ''');

    ///
    ///Вывод таблицы сообщений
    ///
    var massages = await messagesService.getAllMessages();
    return (massages as String);
  }

  @override
  Widget build(BuildContext context) {
    String val = '';
    fromBase().then((value) {
      setState(() {
        val = value;
      });
    });
    return MaterialApp(
      title: 'Flutter chat app',
      debugShowCheckedModeBanner: false,
      home: Text(val),
    );
  }
}
