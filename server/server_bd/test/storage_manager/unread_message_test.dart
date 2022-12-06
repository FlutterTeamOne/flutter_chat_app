import 'package:flutter_chat_app/storage_manager/last_unread_message.dart';
import 'package:flutter_chat_app/storage_manager/user_preferences.dart';
import 'package:test/test.dart';

main() async {
  group('unread message test', () {
    test('set unread', () async {
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
