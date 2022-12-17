import '../library/library_server.dart';

Future<void> main() async {
  ///
  ///Создание базы у вас на пк (в проекте
  ///.dart_tool\sqflite_common_ffi\databases\main_db.db)
  ///

  //открыть базу
  var db = await DbServerServices.instanse.database;
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

  // var request = UpdateMessageRequest();
  // request.idMessageMain = 4;
  // request.content = "Zdarova PAPASHA";
  // print(await messagesService.getMessageById(id: 4));
  // var timeUpdate = DateTime.now().toIso8601String();
  // var src = await messagesServices.updateMessage(
  //     newValues: "content = '${request.content}', updated_date = '$timeUpdate'",
  //     condition: "message_id = ${request.idMessageMain}");
  // print("src: $src");
  // print(await messagesService.getMessageById(id: 4));

  ///
  ///Вывод таблицы сообщений
  ///
  // var massages = await messagesService.getAllMessages();
  // print(massages);
  // var chatsServices = await ChatsServices();
  // print(await chatsServices.getAllChats());

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

  ///
  ///Проверка запроса с синхронизацией
  ///
  var main_messages_id = 70;
  var mainIdUser = 1;
  var messages = await messagesService.getRecentMessages(
      message:
          LastMessage(mainIdMessage: main_messages_id, mainIdUser: mainIdUser));
  for (var mes in messages) {
    print(mes);
  }
}
