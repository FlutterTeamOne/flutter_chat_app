import 'dart:developer';

import 'package:chat_app/modules/signal_service/service_locator/locator.dart';
import 'package:chat_app/modules/storage_manager/db_helper/db_helper.dart';
import 'package:chat_app/modules/storage_manager/db_helper/db_helper_start.dart';
import 'package:chat_app/modules/storage_manager/db_helper/user_path.dart';
import 'package:chat_app/src/constants/db_constants.dart';
import 'package:chat_app/src/libraries/library_all.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:sqflite/sqflite.dart';

Future main() async {


  group("Creating tables:", () {   
      var user = UserDto(name: 'name', email: 'email', createdDate: 'createdDate', profilePicLink: 'profilePicLink', updatedDate: 'updatedDate');
      UserPath.user = user;

    test('"users" table created', () async {
      await DBHelper.instanse.initDB();
      var db = await DBHelper.instanse.database;
      var r = await db.rawQuery('''SELECT name FROM sqlite_master WHERE type='table' AND name='users';''');
      
      expect(r, [{'name': 'users'}]);
    });

    test('"messages" table created', () async {
      await DBHelper.instanse.initDB();
      var db = await DBHelper.instanse.database;
      var r = await db.rawQuery('''SELECT name FROM sqlite_master WHERE type='table' AND name='messages';''');
      
      expect(r, [{'name': 'messages'}]);
    });

    test('"chats" table created', () async {
      await DBHelper.instanse.initDB();
      var db = await DBHelper.instanse.database;
      var r = await db.rawQuery('''SELECT name FROM sqlite_master WHERE type='table' AND name='chats';''');
      
      expect(r, [{'name': 'chats'}]);
    });
    test('"main_user" table created', () async {
      await DBHelper.instanse.initDB();
      var db = await DBHelper.instanse.database;
      var r = await db.rawQuery('''SELECT name FROM sqlite_master WHERE type='table' AND name='main_user';''');
      
      expect(r, [{'name': 'main_user'}]);
    });
    test('"attachments" table created', () async {
      await DBHelper.instanse.initDB();
      var db = await DBHelper.instanse.database;
      var r = await db.rawQuery('''SELECT name FROM sqlite_master WHERE type='table' AND name='attachments';''');
      
      expect(r, [{'name': 'attachments'}]);
    });
    test('"user_last_time_online" table created', () async {
      await DBHelper.instanse.initDB();
      var db = await DBHelper.instanse.database;
      var r = await db.rawQuery('''SELECT name FROM sqlite_master WHERE type='table' AND name='user_last_time_online';''');
      
      expect(r, [{'name': 'user_last_time_online'}]);
    });
  });
}
