part of 'message_bloc.dart';

abstract class MessageEvent {}

class CreateMessageEvent extends MessageEvent {
  final Message message;
  final int idChat;
  CreateMessageEvent({
    required this.message,
    required this.idChat,
  });
}

class ReadMessageEvent extends MessageEvent {
  final List<Message>? messages;

  ReadMessageEvent({this.messages});
}

class MessageStreamEvent extends MessageEvent {}
