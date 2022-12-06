part of 'msg_bloc.dart';

class MsgState {
  final List<Message>? messages;
  MsgState({
    this.messages,
  });

  MsgState copyWith({
    List<Message>? messages,
  }) {
    return MsgState(
      messages: messages ?? this.messages,
    );
  }
}
