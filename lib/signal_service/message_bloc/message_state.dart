part of 'message_bloc.dart';

class MessageState {
  final List<Map<String, Object?>> messages;
  MessageState({
    required this.messages,
  });

  MessageState copyWith({
    required List<Map<String, Object?>> messages,
  }) {
    return MessageState(
      messages: messages ?? this.messages,
    );
  }
}
