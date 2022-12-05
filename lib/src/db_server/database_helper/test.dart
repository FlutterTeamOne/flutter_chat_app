import 'package:flutter_chat_app/src/db_server/database_helper/library_db.dart';

Future<void> main() async {
  ///
  ///Создание базы у вас на пк (в проекте
  ///.dart_tool\sqflite_common_ffi\databases\main_db.db)
  ///
  // var db = DbServerServices();
  // db.createDatabase();

  //Обращаемся к методам работы с таблицей чатов через:
  var chatsHelper = ChatsServices();

  //Обращаемся к методам работы с таблицей сообщений через:
  var messagesService = MessagesServices();

  //Обращаемся к методам работы с таблицей юзеров через:
  var usersService = UsersServices();

  ///
  ///Вывод таблицы сообщений
  ///
  // var massages = await messagesService.getAllMessages();
  // print(massages);

  ///
  ///Вывод чата по 2 id
  ///
  // var friendId1 = 1;
  // var friendId2 = 2;
  // var index = await chatsHelper.getChatByTwoIds(
  //     friend1_id: friendId1, friend2_id: friendId2);
  // print(index);

  // var index = await chatsHelper.createChat(friend1_id: 1, friend2_id: 2);

  // print(index);

  // var updatedUser = await chatsHelper.updateChat(
  //     newValues: 'friend1_id = 3', condition: 'main_friends_chat_id = 1');

  // print(updatedUser);

  // var id = await chatsHelper.getChatById(id: 1);

  // print(index);
}
