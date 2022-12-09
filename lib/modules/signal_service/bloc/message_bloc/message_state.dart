part of 'message_bloc.dart';

class MessageState {
  final List<MessageDto>? messages;
  MessageState({
    this.messages,
  });

  MessageState copyWith({
    required List<MessageDto>? messages,
  }) {
    return MessageState(
      messages: messages ?? this.messages,
    );
  }
}
