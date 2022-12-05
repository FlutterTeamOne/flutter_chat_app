import '../../../library.dart';

abstract class SendingMessageEvent {}

class NewMessageEvent extends SendingMessageEvent {
  final Message message;
  NewMessageEvent({
    required this.message,
});
}

