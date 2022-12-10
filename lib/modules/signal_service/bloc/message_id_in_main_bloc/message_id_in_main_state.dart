part of 'message_id_in_main_bloc.dart';

class MessageIdInMainState extends Equatable {
  final List<MessageIdInMainDto>? messageIdInMain;
  const MessageIdInMainState({
    this.messageIdInMain,
  });

  MessageIdInMainState copyWith({
    List<MessageIdInMainDto>? messageIdInMain,
  }) {
    return MessageIdInMainState(
      messageIdInMain: messageIdInMain ?? this.messageIdInMain,
    );
  }

  @override
  List<Object?> get props => [messageIdInMain];
}
