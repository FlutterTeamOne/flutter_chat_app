import 'dart:async';
import 'package:flutter_chat_app/library.dart';
import 'package:flutter_chat_app/sending_manager/client.dart';

// Get signal of new massage in DB
// Get signal of connection
// Read new message from DB
class NewMessageListen {
  StreamController controller = StreamController();
  late StreamSubscription newMessageSubscription =
      controller.stream.listen((event) {
    //  Send new message to grpc
    var client = Client();
    var message = Message();
    message.userMainId1 = 1;
    message.userMainId2 = 2;
    message.senderMainId = 2;
    message.content = "Hello";
    client.SendMessage(message);
  });
}
