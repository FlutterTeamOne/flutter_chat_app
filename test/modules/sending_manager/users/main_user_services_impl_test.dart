import 'package:chat_app/domain/data/dto/user_dto/user_dto.dart';
import 'package:chat_app/modules/storage_manager/db_helper/db_helper.dart';
import 'package:chat_app/modules/storage_manager/db_helper/user_path.dart';
import 'package:chat_app/src/libraries/library_all.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  group('Local db: MainUserServices CRUD', (){
      sqfliteFfiInit();
      databaseFactory = databaseFactoryFfi;
      var user = UserDto(name: 'LocalUsersServices', email: 'LocalUsersServices@test', createdDate: 'createdDate', profilePicLink: 'profilePicLink', updatedDate: 'updatedDate');
      UserPath.user = user;

    test('getDateSync', () async {
      await DBHelper.instanse.initDB();
      var db = await DBHelper.instanse.database;
      await db.delete('main_user');

      await db.rawInsert('''INSERT INTO main_user (user_id, user_key, date_sync) 
        VALUES (1, 'key', 'date_sync')''');

      var r = await MainUserServices().getDateSync();

      var matcher = 'date_sync';

      expect(r, matcher);
    });

    test('getUserId', () async {
      await DBHelper.instanse.initDB();
      var db = await DBHelper.instanse.database;
      await db.delete('main_user');

      await db.rawInsert('''INSERT INTO main_user (user_id, user_key, date_sync) 
        VALUES (1, 'key', 'date_sync')''');

      var r = await MainUserServices().getUserID();

      var matcher = 1;

      expect(r, matcher);
    });

    test('createMainUser - inserts new row to the main_user table', () async {
      await DBHelper.instanse.initDB();
      var db = await DBHelper.instanse.database;
      await db.delete('main_user');

      await MainUserServices().createMainUser(1);

      var r = await db.rawQuery('''SELECT user_id, user_key FROM main_user
        WHERE user_id = 1''');

      var matcher = [{'user_id': 1, 'user_key': ''}];

      expect(r, matcher);
    });

    test('createMainUser - returns number of inserted rows', () async {
      await DBHelper.instanse.initDB();
      var db = await DBHelper.instanse.database;
      await db.delete('main_user');

      var r = await MainUserServices().createMainUser(1);

      var matcher = 1;

      expect(r, matcher);
    });

    test('updateMainUser - updates a field condition is true', () async {
      await DBHelper.instanse.initDB();
      var db = await DBHelper.instanse.database;
      await db.delete('main_user');
      
      await db.rawInsert('''INSERT INTO main_user (user_id, user_key, date_sync) 
      VALUES (1, 'key', 'date_sync')''');

      await MainUserServices().updateMainUser(newValues: 'user_key = "key"', condition: 'user_id = 1');

      var r = await db.rawQuery('''SELECT user_key FROM main_user
        WHERE user_id = 1''');

      var matcher = 'key';

      expect(r[0]['user_key'], matcher);
    });

    test('updateMainUser - returns number of updated rows', () async {
      await DBHelper.instanse.initDB();
      var db = await DBHelper.instanse.database;
      await db.delete('main_user');

      await db.rawInsert('''INSERT INTO main_user (user_id, user_key, date_sync) 
      VALUES (1, 'key', 'date_sync')''');

      var r = await MainUserServices().updateMainUser(newValues: 'user_key = "key"', condition: 'user_id = 1');

      var matcher = 1;

      expect(r, matcher);
    });
  });
}