import 'package:alfred/alfred.dart';
import 'package:server/src/library/library_server.dart';
import '../../lib/src/db_server/database_helper/chats/chats_int.dart';

class RestServer {

  final app = Alfred();

  Future getChat() async {
    app.get('localhost' , (req, res) async {
      var chat = await ChatsServices().getChatById(id: 1);
      return chat;
    });
  }

  Future createChat({required ChatModel chat}) async {
    app.get('localhost' , (req, res) async {
      var chat = await ChatsServices().createChat(friend1_id: req., friend2_id: friend2_id)
      return chat;
    });
  }
}

class ChatModel {
  final chatId;
  final friend1;
  final friend2;

  ChatModel({
    this.chatId,
    required this.friend1,
    required this.friend2,
  });
}