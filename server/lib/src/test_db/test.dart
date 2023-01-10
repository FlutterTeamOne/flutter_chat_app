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
  var messagesService = MessagesDBServices();

  //Обращаемся к методам работы с таблицей юзеров через:
  var usersService = UsersServices();

  // var result = await chatsHelper.getAllChatsSortedByUpdatedDate();
  // for (var i in result) {
  //   print(i);
  // }
  // print(result);

  var result = await messagesService.getMessageByUserIdMoreMessageId(
      messageId: 7, userId: 1);
  print(result);

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
  // var mainIdUser = 1;
  // var users;
  // var chats;
  // var messages;

  // users = await usersService.getAllUsersByIDfriend(userId: mainIdUser);
  // print("Users");
  // for (var user in users) {
  //   print(user);
  // }

  // print("Chats");
  // chats = await chatsServices.getChatsByUserId(userId: mainIdUser);
  // for (var chat in chats) {
  //   print(chat);
  // }

  // print("Messages");
  // //await messagesService.addNewMessage(chatId: 1, senderId: 2, content: '222');
  // messages = await messagesService.getMessageByUserId(userId: mainIdUser);
  // for (var message in messages) {
  //   print(message);
  // }

  // print("Users");
  // users = await usersService.getAllUsersByIDfriendMoreChatId(
  //     id: mainIdUser, chatId: 1);
  // for (var user in users) {
  //   print(user);
  // }

  // print("Chats");
  // chats = await chatsServices.getChatsByUserIdMoreChatId(
  //     userId: mainIdUser, chatId: 1);
  // for (var chat in chats) {
  //   print(chat);
  // }
  // print("Messages");
  // messages = await messagesService.getMessageByUserIdMoreMessageId(
  //     userId: mainIdUser, messageId: 100);
  // for (var message in messages) {
  //   print(message);
  // }

  // print(await usersService.getAllUsers());
  // await usersService.updateUser(
  //     newValues:
  //         'deleted_date = "", updated_date = "${DateTime.now().toIso8601String()}"',
  //     condition: 'user_id = 1');
  // print(await usersService.getAllUsers());
  // print(await usersService.getAllUsers());
  // List<UserRequest> users = [];
  // users.add(UserRequest(userId: 1, updatedDate: '2022-12-02T21:36:32.653712'));
  // users.add(UserRequest(userId: 2, updatedDate: '2022-12-02T21:36:32.653712'));
  // print(await usersService.getUpdatedUsers(users: users));
  // List<UserRequest> usersUpdated = [];
  // usersUpdated.add(
  //     UserRequest(userId: 1, updatedDate: DateTime.now().toIso8601String()));
  // usersUpdated
  //     .add(UserRequest(userId: 2, updatedDate: '2022-12-02T21:36:32.653712'));
  // print(await usersService.getUpdatedUsers(users: usersUpdated));

  // print(await chatsServices.createChat(
  //     friend1Id: 2, friend2Id: 3, date: DateTime.now().toIso8601String()));
}
