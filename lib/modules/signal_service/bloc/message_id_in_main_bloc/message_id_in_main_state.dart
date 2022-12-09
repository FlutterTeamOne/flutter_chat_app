part of 'message_id_in_main_bloc.dart';

class MessageIdInMainState {
  final List<MessageIdInMainDto>? messageIdInMain;
  MessageIdInMainState({
    this.messageIdInMain,
  });

  MessageIdInMainState copyWith({
    List<MessageIdInMainDto>? messageIdInMain,
  }) {
    return MessageIdInMainState(
      messageIdInMain: messageIdInMain ?? this.messageIdInMain,
    );
  }
}
