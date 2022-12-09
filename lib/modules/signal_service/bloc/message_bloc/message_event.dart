part of 'message_bloc.dart';

abstract class MessageEvent {}

class CreateMessageEvent extends MessageEvent {
  final MessageDto message;

  CreateMessageEvent({
    required this.message,
  });
}

class ReadMessageEvent extends MessageEvent {
  final List<MessageDto>? messages;

  ReadMessageEvent({this.messages});
}

class UpdateMessageEvent extends MessageEvent {
  final MessageDto message;
  final int messageId;

  UpdateMessageEvent({required this.message, required this.messageId});
}

class DeleteMessageEvent extends MessageEvent {
  final int messageId;

  DeleteMessageEvent({required this.messageId});
}

class DeleteHistoryMessageEvent extends MessageEvent {
  final int chatID;

  DeleteHistoryMessageEvent(this.chatID);
}

class MessageStreamEvent extends MessageEvent {}
