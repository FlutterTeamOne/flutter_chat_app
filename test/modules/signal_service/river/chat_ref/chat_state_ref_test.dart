import 'package:chat_app/domain/data/dto/chat_dto/chat_dto.dart';
import 'package:chat_app/modules/signal_service/river/chat_ref/chat_state_ref.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  var chatRef = const ChatStateRef();
  group('ChatStateRef', () {});
  test('CopyWith', () {
    var chat = chatRef.copyWith(chats: [
      ChatDto(userIdChat: 1, createdDate: 'date', updatedDate: 'date')
    ]);
    expect(
        chat,
        ChatStateRef(
          chats: [
            ChatDto(userIdChat: 1, createdDate: 'date', updatedDate: 'date')
          ],
        ));
  });
}
