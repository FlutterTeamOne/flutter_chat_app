import 'package:chat_app/domain/data/dto/user_dto/user_dto.dart';
import 'package:chat_app/modules/storage_manager/db_helper/user_path.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  group('UserPath', () {
    test('get user', () {
      var testUser = UserDto(
          name: 'name',
          email: 'email',
          createdDate: 'createdDate',
          profilePicLink: 'profilePicLink',
          updatedDate: 'updatedDate');
      var user = UserPath.user = testUser;
      expect(user, UserPath.getUser);
    });
   
  });
  group('UserPref', () {
    setUp(() async {
      SharedPreferences.setMockInitialValues(
          {'userDb': true, 'userId': 1, 'theme_key': 1});
      await UserPref.init();
    });
    test('getUserDbPref', () {
      expect(UserPref.getUserDbPref, true);
    });
    test('setUserDbPref', () {
      UserPref.setUserDbPref = false;
      expect(UserPref.getUserDbPref, false);
    });
    test('getUserId', () {
      expect(UserPref.getUserId, 1);
    });
    test('setUserId', () {
      UserPref.setUserId = 2;
      expect(UserPref.getUserId, 2);
    });
    test('getThemeIndex', () {
      expect(UserPref.getThemeIndex, 1);
    });
    test('setThemeIndex', () {
      UserPref.setThemeIndex = 2;
      expect(UserPref.getThemeIndex, 2);
    });
  });
}
