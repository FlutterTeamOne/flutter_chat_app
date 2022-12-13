part of 'message_id_in_main_bloc.dart';

abstract class MessageIdInMainEvent extends Equatable {}

class CreateMessageIdInMainEvent extends MessageIdInMainEvent {
  final MessageIdInMainDto messageIdInMain;

  CreateMessageIdInMainEvent({
    required this.messageIdInMain,
  });

  @override
  List<Object?> get props => [messageIdInMain];
}
