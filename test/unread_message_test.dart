import 'package:flutter_chat_app/domain/model/message_model.dart';
import 'package:flutter_chat_app/storage_manager/last_unread_message.dart';
import 'package:flutter_chat_app/storage_manager/user_preferences.dart';
import 'package:test/test.dart';
import 'package:flutter_test/flutter_test.dart' as flutter_test;
import 'package:shared_preferences/shared_preferences.dart';

main() async {
  flutter_test.TestWidgetsFlutterBinding.ensureInitialized();

  group('unread message test', () {
    test('set unread', () async {
      await UnreadMessage().setUnreadMessage(98, 34522542, false);
      final unreadStatus = await UserPreferences().getIsRead();

      expect(unreadStatus, false);
    });
  });
}
