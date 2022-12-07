part of 'message_id_in_main_bloc.dart';

class MessageIdInMainState {
  final List<MessageIdInMainModel>? messageIdInMain;
  MessageIdInMainState({
    this.messageIdInMain,
  });

  MessageIdInMainState copyWith({
    List<MessageIdInMainModel>? messageIdInMain,
  }) {
    return MessageIdInMainState(
      messageIdInMain: messageIdInMain ?? this.messageIdInMain,
    );
  }
}
