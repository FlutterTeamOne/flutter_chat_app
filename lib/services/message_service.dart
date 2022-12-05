import 'dart:async';

import 'package:flutter_chat_app/library.dart';
import 'package:flutter_chat_app/src/db_server/database_helper/library_db.dart';
import 'package:grpc/service_api.dart';

class MessageService {
  ClientChannel channel;
  MessageService({
    required this.channel,
  });

  Future onCreateMessage(
      {required String content, required String date}) async {
    final stub = GrpcChatClient(channel);
    var resp = await stub.createMessage(Message(
      content: content,
      date: date,
    ));
    return resp;
  }
}
