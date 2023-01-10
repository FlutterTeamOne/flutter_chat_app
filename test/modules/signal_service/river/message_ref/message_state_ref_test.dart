import 'package:chat_app/domain/data/dto/message_dto/message_dto.dart';
import 'package:chat_app/modules/signal_service/river/message_ref/message_state_ref.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  var messageRef = const MessageStateRef();

  group('MessageStateRef', () {
    test('CopyWith', () {
      var message = messageRef.copyWith(
          messages: [MessageDto(chatId: 1, senderId: 1, content: 'content')]);
      expect(
          message,
          MessageStateRef(messages: [
            MessageDto(chatId: 1, senderId: 1, content: 'content')
          ]));
    });
  });
}
