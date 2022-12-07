part of 'message_bloc.dart';

abstract class MessageEvent {}

class CreateMessageEvent extends MessageEvent {
  final MessageModel message;

  CreateMessageEvent({
    required this.message,
  });
}

class ReadMessageEvent extends MessageEvent {
  final List<MessageModel>? messages;

  ReadMessageEvent({this.messages});
}

class MessageStreamEvent extends MessageEvent {}
