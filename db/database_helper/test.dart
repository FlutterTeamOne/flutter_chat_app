import 'chats/chats_helper.dart';
import 'db_helper.dart';
Future<void> main() async {

  var db_helper = DBHelper();
  db_helper.createDatabase();

  var chatsHelper = ChatsHelper();
  var index = await chatsHelper.createChat(friend1_id: 1, friend2_id: 2);

  print (index);

  var updatedUser = await chatsHelper.updateChat(newValues: 'friend1_id = 3', condition: 'main_friends_chat_id = 1');

  print (updatedUser);

  var id = await chatsHelper.getChatById(id: 1);

  print (index);
  
}