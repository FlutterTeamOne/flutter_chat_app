part of 'message_bloc.dart';

abstract class MessageEvent {}

class CreateMessageEvent extends MessageEvent {
  final MessageModel message;
  final int idChat;
  CreateMessageEvent({
    required this.message,
    required this.idChat,
  });
}

class ReadMessageEvent extends MessageEvent {
  final List<MessageModel>? messages;

  ReadMessageEvent({this.messages});
}

class MessageStreamEvent extends MessageEvent {}
