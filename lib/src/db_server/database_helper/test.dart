import 'package:flutter_chat_app/src/db_server/database_helper/library_db.dart';

Future<void> main() async {
  var chatsHelper = ChatsServices();
  var index = await chatsHelper.createChat(friend1_id: 1, friend2_id: 2);

  print(index);

  var updatedUser = await chatsHelper.updateChat(
      newValues: 'friend1_id = 3', condition: 'main_friends_chat_id = 1');

  print(updatedUser);

  var id = await chatsHelper.getChatById(id: 1);

  print(index);
}
