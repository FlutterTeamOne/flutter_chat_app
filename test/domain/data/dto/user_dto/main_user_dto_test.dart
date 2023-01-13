// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:chat_app/domain/data/dto/user_dto/main_user_dto.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUpAll(() async {
    /// TODO: refactor print
    print("test start");
  });
  tearDownAll(() {
    /// TODO: refactor print
    print("test end");
  });
  group("MainUserDto tests", () {
    test('CopyWith response', () async {
      MainUserDto mainUserDto = MainUserDto(userId: 1, key: '', dateSync: '');

      var actual = mainUserDto.copyWith();
      expect(actual, mainUserDto);

      actual = mainUserDto.copyWith(userId: 5, key: '', dateSync: '');
      expect(actual, MainUserDto(userId: 5, key: '', dateSync: ''));
    });

    test('Test operator == ', () async {
      MainUserDto mainUserDto1 = MainUserDto(userId: 1, key: '', dateSync: '');
      MainUserDto mainUserDto2 = MainUserDto(userId: 2, key: '', dateSync: '');
      MainUserDto mainUserDto3 = MainUserDto(userId: 1, key: '', dateSync: '');
      var actual = mainUserDto1 == mainUserDto3;
      expect(actual, true);
      actual = mainUserDto1 == mainUserDto2;
      expect(actual, false);
    });

    test('Test for getter hashCode', () async {
      MainUserDto mainUserDto = MainUserDto(userId: 1, key: '', dateSync: '');

      var actual = mainUserDto.hashCode;

      expect(actual,
          mainUserDto.hashCode ^ mainUserDto.hashCode ^ mainUserDto.hashCode);
    });

    test('ToString', () async {
      MainUserDto mainUserDto = MainUserDto(userId: 1, key: '', dateSync: '');

      var actual = mainUserDto.toString();

      expect(actual, 'MainUserDto(userId: 1, key: , dateSync: )');
    });

    test('ToMap', () async {
      MainUserDto mainUserDto = MainUserDto(userId: 1, key: '', dateSync: '');

      var actual = mainUserDto.toMap();

      expect(actual, {'user_id': 1, 'user_key': '', 'date_sync': ''});
    });

    test('FromMap', () async {
      MainUserDto mainUserDto = MainUserDto(userId: 1, key: '', dateSync: '');

      var map = mainUserDto.toMap();
      var actual = MainUserDto.fromMap(map);

      expect(actual, mainUserDto);
    });

    test('toJson', () async {
      MainUserDto mainUserDto = MainUserDto(userId: 1, key: '', dateSync: '');

      var actual = mainUserDto.toJson();

      expect(
          actual, json.encode({"user_id": 1, "user_key": "", "date_sync": ""}));
    });

    test('fromJson', () async {
      MainUserDto mainUserDto = MainUserDto(userId: 1, key: '', dateSync: '');

      var toJson = mainUserDto.toJson();
      var actual = MainUserDto.fromJson(toJson);

      expect(actual, mainUserDto);
    });
  });
}
