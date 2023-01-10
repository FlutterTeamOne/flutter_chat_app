import 'package:chat_app/domain/data/dto/user_dto/user_dto.dart';
import 'package:chat_app/src/constants/db_constants.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  var user = UserDto(
      name: '',
      email: '',
      createdDate: '',
      profilePicLink: '',
      updatedDate: '');
  group('UserDto CopyWith', () {
    test('name', () {
      var copyWith = user.copyWith(name: 'newName');

      expect(
          copyWith,
          UserDto(
              name: 'newName',
              email: '',
              createdDate: '',
              profilePicLink: '',
              updatedDate: ''));
    });
    test('email', () {
      var copyWith = user.copyWith(email: 'newEmail');

      expect(
          copyWith,
          UserDto(
              name: '',
              email: 'newEmail',
              createdDate: '',
              profilePicLink: '',
              updatedDate: ''));
    });
    test('createdDate', () {
      var copyWith = user.copyWith(registrationDate: 'newDate');

      expect(
          copyWith,
          UserDto(
              name: '',
              email: '',
              createdDate: 'newDate',
              profilePicLink: '',
              updatedDate: ''));
    });
    test('profilePicLink', () {
      var copyWith = user.copyWith(profilePicLink: 'newProfilePic');

      expect(
          copyWith,
          UserDto(
              name: '',
              email: '',
              createdDate: '',
              profilePicLink: 'newProfilePic',
              updatedDate: ''));
    });
    test('updatedDate', () {
      var copyWith = user.copyWith(updatedDate: 'newUpdatedDate');

      expect(
          copyWith,
          UserDto(
              name: '',
              email: '',
              createdDate: '',
              profilePicLink: '',
              updatedDate: 'newUpdatedDate'));
    });
  });

  group('UserDto decode/endcode', () {
    test('ToMap', () {
      var userToMap = UserDto(
          name: 'name',
          email: 'email',
          createdDate: 'data',
          profilePicLink: 'pic',
          updatedDate: 'date');
      var toMap = userToMap.toMap();
      expect(toMap, {
        DatabaseConst.usersColumnProfilePicLink: userToMap.profilePicLink,
        DatabaseConst.usersColumnUserId: userToMap.userId,
        DatabaseConst.usersColumnName: userToMap.name,
        DatabaseConst.usersColumnEmail: userToMap.email,
        DatabaseConst.usersColumnCreatedDate: userToMap.createdDate,
        DatabaseConst.usersColumnUpdatedDate: userToMap.updatedDate,
        DatabaseConst.usersColumnDeletedDate: userToMap.deletedDate,
      });
    });
    test('fromMap', () {
      var userMap = {
        DatabaseConst.usersColumnProfilePicLink: 'pic',
        DatabaseConst.usersColumnUserId: 1,
        DatabaseConst.usersColumnName: 'name',
        DatabaseConst.usersColumnEmail: 'email',
        DatabaseConst.usersColumnCreatedDate: 'createdDate',
        DatabaseConst.usersColumnUpdatedDate: 'date',
        DatabaseConst.usersColumnDeletedDate: null
      };
      var fromUser = UserDto.fromMap(userMap);
      expect(
          fromUser,
          UserDto(
              userId: 1,
              name: 'name',
              email: 'email',
              createdDate: 'createdDate',
              profilePicLink: 'pic',
              updatedDate: 'date',
              deletedDate: ''));
    });

    test('toJson', () {
      var userModel = UserDto(
          name: 'name',
          email: 'email',
          createdDate: 'data',
          profilePicLink: 'pic',
          updatedDate: 'date');
      var userToJson = userModel.toJson();
      expect(userToJson,
          '{"profile_pic_link":"pic","user_id":null,"name":"name","email":"email","created_date":"data","updated_date":"date","deleted_date":null}');
    });
    test('Test operator == ', () async {
      UserDto user1 = UserDto(
          name: 'name',
          email: 'email',
          createdDate: 'data',
          profilePicLink: 'pic',
          updatedDate: 'date');
      UserDto user2 = UserDto(
          name: 'name2',
          email: 'email',
          createdDate: 'data',
          profilePicLink: 'pic',
          updatedDate: 'date');
      UserDto user3 = UserDto(
          name: 'name',
          email: 'email',
          createdDate: 'data',
          profilePicLink: 'pic',
          updatedDate: 'date');
      var actual = user1 == user3;
      expect(actual, true);
      actual = user1 == user2;
      expect(actual, false);
    });
    test('Test for getter hashCode', () async {
      var actual = user.hashCode;

      expect(
          actual,
          user.userId.hashCode ^
              user.name.hashCode ^
              user.email.hashCode ^
              user.createdDate.hashCode ^
              user.profilePicLink.hashCode ^
              user.updatedDate.hashCode ^
              user.deletedDate.hashCode);
    });
    test('ToString', () async {
      var actual = user.toString();
      expect(actual,
          'UserDto(userId: null, name: , email: , createdDate: , profilePicLink: , updatedDate: , deletedDate: null)');
    });
  });
}
