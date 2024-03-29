import 'package:chat_app/modules/storage_manager/preferences/user_preferences.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  group('UserPrefernces', () {
    test('setIsReadTrue', () async {
      final myPreferences = UserPreferences();

      await myPreferences.setIsRead(true);
      final testField = await myPreferences.getIsRead();
      expect(testField, true);
    });

    test('setIsReadFalse', () async {
      final myPreferences = UserPreferences();

      await myPreferences.setIsRead(false);
      final testField = await myPreferences.getIsRead();
      expect(testField, false);
    });

    test('setFriendsChatId', () async {
      final myPreferences = UserPreferences();

      await myPreferences.setFriendsChatId(1);
      final testField = await myPreferences.getFriendsChatId();
      expect(testField, 1);
    });

    test('setMessageId', () async {
      final myPreferences = UserPreferences();

      await myPreferences.setMessageId(55);
      final testField = await myPreferences.getMessageId();
      expect(testField, 55);
    });
  });
}
