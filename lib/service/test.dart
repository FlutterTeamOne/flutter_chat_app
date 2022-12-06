import 'package:flutter_chat_app/client/grpc_client.dart';
import "package:flutter_chat_app/service/lib_db.dart";

Future<void> main() async {
  ///
  ///Создание базы у вас на пк (в проекте
  ///.dart_tool\sqflite_common_ffi\databases\main_db.db)
  ///
  // db.createDatabase();

  ///
  ///Вывод таблицы сообщений
  ///
  // var massages = await messagesService.getAllMessages();
  // print(massages);

  var message = LocalMessagesServices(channel: GrpcClient().channel);
  print(message.getAllMessages());
  //print(message.getChatByMessage(local_id: 2));

  ///
  ///Проверка запроса с синхронизацией
  ///
  // var db = await dbServerServices.openDatabase();
  // var main_messages_id = 22;
  // var mainIdMessage = 1;
  // var messages = await db.rawQuery('''SELECT *
  //     FROM messages, friends_chat AS friend
  //     WHERE (main_messages_id > $main_messages_id AND
  //       (friend.friend1_id = $mainIdMessage OR
  //       friend.friend2_id = $mainIdMessage))''');
  // if (messages.length == 0) {
  //   MessageFromBase lastMessage = MessageFromBase();
  //   print(lastMessage);
  // } else {
  //   for (int i = 0; i < messages.length; i++) {
  //     MessageFromBase lastMessage = MessageFromBase();
  //     lastMessage.mainIdMessage = messages[i]['main_messages_id'];
  //     lastMessage.chatIdMain = messages[i]['friends_chat_id'];
  //     lastMessage.senderMainId = messages[i]['sender_id'];
  //     lastMessage.content = messages[i]['content'];
  //     lastMessage.date = messages[i]['date'];
  //     print(lastMessage);
  //   }
  // }
}
