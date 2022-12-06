part of 'message_bloc.dart';

class MessageState {
  final List<MessageModel>? messages;
  MessageState({
    this.messages,
  });

  MessageState copyWith({
    required List<MessageModel>? messages,
  }) {
    return MessageState(
      messages: messages ?? this.messages,
    );
  }
}
