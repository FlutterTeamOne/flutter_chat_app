import 'package:chat_app/modules/storage_manager/last_unread_message.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  group('LastUnreadMessage', () {
    test('setUnreadMessage', () async {
      final unreadMessage = UnreadMessage();

      await unreadMessage.setUnreadMessage(232, 353, true);
      final lastUnreadMessage = await unreadMessage.getUnreadMessage();

      expect(lastUnreadMessage.lastUnreadMessageId, 232);
      expect(lastUnreadMessage.friendsChatId, 353);
      expect(lastUnreadMessage.isRead, true);
    });
  });
}
