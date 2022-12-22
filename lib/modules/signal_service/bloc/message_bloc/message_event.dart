part of 'message_bloc.dart';

abstract class MessageEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class CreateMessageEvent extends MessageEvent {
  final MessageDto message;
  final String? mediaPath;

  CreateMessageEvent( {
    required this.message,
    this.mediaPath,
  });

  @override
  List<Object?> get props => [message,mediaPath];
}

class ReadMessageEvent extends MessageEvent {
  final List<MessageDto>? messages;

  ReadMessageEvent({this.messages});
  @override
  List<Object?> get props => [messages];
}

class UpdateMessageEvent extends MessageEvent {
  final MessageDto? message;
  final int? messageId;
  final EditState? isEditing;

  UpdateMessageEvent({this.message, this.messageId, this.isEditing});
  @override
  List<Object?> get props => [message, messageId, isEditing];
}

class DeleteMessageEvent extends MessageEvent {
  final int messageId;

  DeleteMessageEvent({required this.messageId});
  @override
  List<Object?> get props => [messageId];
}

class DeleteHistoryMessageEvent extends MessageEvent {
  final int chatID;

  DeleteHistoryMessageEvent(this.chatID);
  @override
  List<Object?> get props => [chatID];
}

class MessageStreamEvent extends MessageEvent {
  @override
  List<Object> get props => [];
}
