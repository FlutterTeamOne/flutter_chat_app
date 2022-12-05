part of 'msg_bloc.dart';

abstract class MsgEvent {}

class CreateMessageEvent extends MsgEvent {
  final Message message;
  CreateMessageEvent({
    required this.message,
  });
}

class ReadMessageEvent extends MsgEvent {
  final List<Message>? messages;

  ReadMessageEvent({this.messages});
}

class MessageStreamEvent extends MsgEvent {}