part of 'message_bloc.dart';

class MessageState {
  final List<Message>? messages;
  MessageState({
    this.messages,
  });

  MessageState copyWith({
    List<Message>? messages,
  }) {
    return MessageState(
      messages: messages ?? this.messages,
    );
  }
}
