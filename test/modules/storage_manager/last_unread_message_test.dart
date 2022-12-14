import 'package:chat_app/modules/storage_manager/last_unread_message.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:chat_app/modules/storage_manager/preferences/user_preferences.dart';

void main() async {
  group('LastUnreadMessageTrue', () {
    test('setUnreadMessage', () async {
      final unreadMessage = UnreadMessage();

      await unreadMessage.setUnreadMessage(232, 353, true);
      final lastUnreadMessage = await unreadMessage.getUnreadMessage();

      expect(lastUnreadMessage.lastUnreadMessageId, 232);
      expect(lastUnreadMessage.friendsChatId, 353);
      expect(lastUnreadMessage.isRead, true);
    });

    test('set unread false', () async {
      await UnreadMessage().setUnreadMessage(34522542, 54, false);
      final unreadStatus = await UserPreferences().getIsRead();
      final messageId = await UserPreferences().getMessageId();
      final friendsChatId = await UserPreferences().getFriendsChatId();

      expect(unreadStatus, false);
      expect(messageId, 34522542);
      expect(friendsChatId, 54);
    });
  });
}
