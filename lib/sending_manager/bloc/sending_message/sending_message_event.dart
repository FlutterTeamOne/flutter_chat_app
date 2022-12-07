import '../../../library.dart';

abstract class SendingMessageEvent {}

class NewMessageEvent extends SendingMessageEvent {
  final Message message;
  // final Message message = Message(userMainId1: 123, userMainId2: 321, senderMainId: 123, content: 'New message!');

  NewMessageEvent({
    required this.message,


});
}

