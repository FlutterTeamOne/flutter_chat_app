import 'package:chat_app/domain/data/dto/user_dto/user_dto.dart';
import 'package:chat_app/modules/signal_service/river/user_ref/user_state_ref.dart';
import 'package:chat_app/modules/storage_manager/db_helper/user_path.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  SharedPreferences.setMockInitialValues({'userDb': false});

  List<UserDto> users = [];

  setUpAll(() async {
    await UserPref.init();
    print("test start");
  });
  tearDownAll(() {
    print("test end");
  });
  group("UserStateRef copyWith tests", () {
    test('CopyWith test All null', () async {
      var userStateRefNullAll =
          const UserStateRef(users: null, userDb: null, isDeleted: null);

      var copyWith =  userStateRefNullAll.copyWith();

      expect(copyWith, userStateRefNullAll);
    });
    test('CopyWith test request Del Null', () async {
      var userStateRefNullDel =
          UserStateRef(users: users, userDb: false, isDeleted: null);

      var copyWith =
           userStateRefNullDel.copyWith(users: users, userDb: false);

      expect(copyWith, userStateRefNullDel);
    });

    test('CopyWith test request Users Null', () async {
      var userStateRefNullUsers =
          const UserStateRef(users: null, userDb: false, isDeleted: false);

      var copyWith =
          userStateRefNullUsers.copyWith(isDeleted: false, userDb: false);

      expect(copyWith, userStateRefNullUsers);
    });

    test('CopyWith test request', () async {
      var userStateRef =
          const UserStateRef(users: [], userDb: null, isDeleted: false);

      var copyWith =
           userStateRef.copyWith(users: users, isDeleted: false);

      expect(copyWith, userStateRef);
    });
  });

  group("UserStateRef userDbThis getter", () {
    test('userDbThis test', () async {
      var userStateRef =
          const UserStateRef(users: [], userDb: null, isDeleted: false);
      var response = userStateRef.userDbthis;
      print(response);

      expect(response, false);
    });
  });
}
