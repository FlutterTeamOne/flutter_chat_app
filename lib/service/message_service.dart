import 'dart:async';

import 'package:flutter_chat_app/library.dart';
import 'package:grpc/service_api.dart';

class MessageService {
  ClientChannel channel;
  MessageService({
    required this.channel,
  });

  Future onCreateMessage({
    userMainId1,
    userMainId12,
    senderMainId,
    required String content,
    required String date,
  }) async {
    final stub = GrpcChatClient(channel);
    var resp = await stub.createMessage(Message(
      chatIdMaint: 1,
      senderMainId: 1,
      content: content,
      date: date,
    ));
    return resp;
  }
}
