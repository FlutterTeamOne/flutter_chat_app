import 'chats/chats_helper.dart';
import 'db_helper.dart';
import 'messages/messages_helper.dart';
Future<void> main() async {

  var db_helper = await DBHelper();

  var db = await db_helper.openDatabase();

  var messageshelper = MessagesHelper();


  var newM = await messageshelper.addNewMessage(db: db, friendsChatId: 1, senderId: 1, content: "content", date: "asdfasdfasdfasdfasdfasdfas");

  print (newM);
  
}