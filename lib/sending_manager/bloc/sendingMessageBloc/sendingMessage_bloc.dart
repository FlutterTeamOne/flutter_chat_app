import 'dart:async';

import '../../../library.dart';
import '../../client.dart';
import '../../connection_bloc/connection_bloc.dart';

enum MessageEvent { newMessage }


class MessageBloc {
  late int userMainId1;
  late int userMainId2;
  late int senderMainId;
  late String content;

  late Message _message;

  final _inputEventController = StreamController<MessageEvent>();
  StreamSink<MessageEvent> get inputEventSink => _inputEventController.sink;

  final _outputStateController = StreamController<Message>();
  Stream<Message> get outputStateStream => _outputStateController.stream;

  void _mapEventToState(MessageEvent newMessageEvent,
      ActiveConnectionState activeConnectionState) {
    if (newMessageEvent == MessageEvent.newMessage &&
        activeConnectionState == ActiveConnectionState)
      _message = Message(
          userMainId1: userMainId1,
          userMainId2: userMainId2,
          senderMainId: senderMainId,
          content: content);
    else
      throw Exception("Нет подключения к интернету");
    _outputStateController.sink.add(_message);

    var client = Client();

    client.SendMessage(_message);
  }

  MessageBloc() {
    _inputEventController.stream.listen((state){_mapEventToState(MessageEvent.newMessage, ActiveConnectionState(message: 'connect Active')
    );
    });
  }

  void dispose() {
    _inputEventController.close();
    _outputStateController.close();
  }
}

class NewMessage {
  int? userMainId1;
  int? userMainId2;
  int? senderMainId;
  String? content;
  NewMessage({
    required this.userMainId1,
    required this.userMainId2,
    required this.senderMainId,
    required this.content,
  });
}
