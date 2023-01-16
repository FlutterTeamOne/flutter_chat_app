import 'package:chat_app/domain/data/dto/user_dto/user_dto.dart';
import 'package:chat_app/modules/sending_manager/services/users/local_users_service_impl.dart';
import 'package:chat_app/modules/storage_manager/db_helper/db_helper_start.dart';
import 'package:chat_app/modules/storage_manager/db_helper/user_path.dart';
import 'package:chat_app/modules/storage_manager/library/library_storage_manager.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  group('Local db: LocalUsersServices CRUD', () {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
    var user = UserDto(
        name: 'LocalUsersServices',
        email: 'LocalUsersServices@test',
        createdDate: 'createdDate',
        profilePicLink: 'profilePicLink',
        updatedDate: 'updatedDate');
    UserPath.user = user;

    test(
        'createUser - takes user\'s parameters, returns the id of the inserted row',
        () async {
      await DBHelper.instanse.initDB();
      var db = await DBHelper.instanse.database;
      await db.delete('users');
      var r = await LocalUsersServices().createUser(
          userId: 1,
          name: 'name',
          email: 'email',
          createdDate: '2022-13-45T34:11:11.123456',
          updatedDate: '2022-13-45T34:11:11.123456',
          profilePicUrl: 'profilePicUrl');

      var lastID = await db.rawQuery('''SELECT last_insert_rowid()''');
      var matcher = 1;
      expect(r, matcher);
      await DBHelper.instanse.deleteDB(db.path);
    });

    test(
        'createUserStart - takes user\'s parameters, inserts the user into startDB and returns the number of inserted rows',
        () async {
      await DBHelperStart.instanse.initDB();
      var db = await DBHelperStart.instanse.database;
      var deleted = await db.delete('users');
      var r = await LocalUsersServices().createUserStart(
          userId: 1,
          name: 'name',
          email: 'email',
          createdDate: '2022-13-45T34:11:11.123456',
          updatedDate: '2022-13-45T34:11:11.123456',
          profilePicUrl: 'profilePicUrl');

      var lastID = await db.rawQuery('''SELECT last_insert_rowid()''');
      var matcher = 1;
      expect(r, matcher);
      await DBHelperStart.instanse.deleteDB(db.path);
    });

    test('deleteUser - returns the number of deleted rows', () async {
      await DBHelper.instanse.initDB();
      var db = await DBHelper.instanse.database;
      await db.delete('users');

      await db.rawInsert('''
        INSERT INTO users (name, email, profile_pic_link, created_date, updated_date) 
          VALUES ('1', '1', 'link', '2022-13-45T34:11:11.123456', '2022-13-45T34:11:11.123456')
      ''');
      var r = await LocalUsersServices().deleteUser(id: 1);
      var matcher = 1;
      expect(r, matcher);
      await DBHelper.instanse.deleteDB(db.path);
    });

    test('getAllUsers - returns list of UserDtos ', () async {
      await DBHelper.instanse.initDB();
      var db = await DBHelper.instanse.database;
      var deleted = await db.delete('users');

      await db.rawInsert('''
        INSERT INTO users (name, email, profile_pic_link, created_date, updated_date) 
          VALUES ('LocalUsersServices', 'LocalUsersServices@test', 'profilePicLink', '2022-13-45T34:11:11.123456', '2022-13-45T34:11:11.123456')
      ''');
      var r = await LocalUsersServices().getAllUsers();
      var query = await db.rawQuery('''SELECT * FROM users;''');

      var addedUserId = await db.rawQuery('''SELECT last_insert_rowid()''');
      var matcher = UserDto(
          userId: addedUserId[0]['last_insert_rowid()'] as int,
          name: query[0]['name'] as String,
          email: query[0]['email'] as String,
          createdDate: query[0]['created_date'] as String,
          profilePicLink: query[0]['profile_pic_link'] as String,
          updatedDate: query[0]['updated_date'] as String,
          deletedDate: '');
      expect(r[0], matcher);
      await DBHelper.instanse.deleteDB(db.path);
    });

    test('getAllUsers - returns list of UserDtos ', () async {
      await DBHelper.instanse.initDB();
      var db = await DBHelper.instanse.database;
      var deleted = await db.delete('users');

      await db.rawInsert('''
        INSERT INTO users (name, email, profile_pic_link, created_date, updated_date) 
          VALUES ('LocalUsersServices', 'LocalUsersServices@test', 'profilePicLink', '2022-13-45T34:11:11.123456', '2022-13-45T34:11:11.123456')
      ''');
      var r = await LocalUsersServices().getAllUsers();
      var query = await db.rawQuery('''SELECT * FROM users;''');

      var addedUserId = await db.rawQuery('''SELECT last_insert_rowid()''');
      var matcher = UserDto(
          userId: addedUserId[0]['last_insert_rowid()'] as int,
          name: query[0]['name'] as String,
          email: query[0]['email'] as String,
          createdDate: query[0]['created_date'] as String,
          profilePicLink: query[0]['profile_pic_link'] as String,
          updatedDate: query[0]['updated_date'] as String,
          deletedDate: '');
      expect(r[0], matcher);
      await DBHelper.instanse.deleteDB(db.path);
    });

    test('getAllUsersStart - returns list of Users in the startDB', () async {
      await DBHelperStart.instanse.initDB();
      var db = await DBHelperStart.instanse.database;
      var deleted = await db.delete('users');

      var insert = await db.rawInsert('''
        INSERT INTO users (user_id, name, email, profile_pic_link, created_date, updated_date, deleted_date) 
          VALUES (100000, 'LocalUsersServices', 'LocalUsersServices@test', 'profilePicLink', '2022-13-45T34:11:11.123456', '2022-13-45T34:11:11.123456', '');
      ''');
      var r = await LocalUsersServices().getAllUsersStart();
      var query = await db.rawQuery('''SELECT * FROM users;''');

      var addedUserId = await db.rawQuery('''SELECT last_insert_rowid()''');

      var matcher = UserDto(
          userId: addedUserId[0]['last_insert_rowid()'] as int,
          name: query[0]['name'] as String,
          email: query[0]['email'] as String,
          createdDate: query[0]['created_date'] as String,
          profilePicLink: query[0]['profile_pic_link'] as String,
          updatedDate: query[0]['updated_date'] as String,
          deletedDate: '');
      expect(r[0], matcher);
      await DBHelperStart.instanse.deleteDB(db.path);
    });

    test(
        'getUserByField - returns list of Users in where one of the fields id equal to the passed value',
        () async {
      await DBHelper.instanse.initDB();
      var db = await DBHelper.instanse.database;
      var deleted = await db.delete('users');

      var insert = await db.rawInsert('''
        INSERT INTO users (user_id, name, email, profile_pic_link, created_date, updated_date, deleted_date) 
          VALUES (100000, 'LocalUsersServices', 'LocalUsersServices@test', 'profilePicLink', '2022-13-45T34:11:11.123456', '2022-13-45T34:11:11.123456', '');
      ''');
      var r = await LocalUsersServices()
          .getUserByField(field: 'name', fieldValue: 'LocalUsersServices');

      var query = await db.rawQuery(
          '''SELECT * FROM users WHERE (name = "LocalUsersServices");''');

      var addedUserId = await db.rawQuery('''SELECT last_insert_rowid()''');

      var matcher = UserDto(
              userId: addedUserId[0]['last_insert_rowid()'] as int,
              name: query[0]['name'] as String,
              email: query[0]['email'] as String,
              createdDate: query[0]['created_date'] as String,
              profilePicLink: query[0]['profile_pic_link'] as String,
              updatedDate: query[0]['updated_date'] as String,
              deletedDate: '')
          .toMap();

      expect(r[0], matcher);

      await DBHelper.instanse.deleteDB(db.path);
    });

    test(
        'getMainIdUserByLocalId - gets a row id, returns the main_id of the user from the main_user table',
        () async {
      await DBHelper.instanse.initDB();
      var db = await DBHelper.instanse.database;
      var deleted = await db.delete('main_user');

      var insert = await db.rawInsert('''
        INSERT INTO main_user (user_id, user_key, date_sync) VALUES (1, 1, 'date_sync');
      ''');

      var insertedRowId =
          (await db.rawQuery('''SELECT last_insert_rowid()'''))[0]
              ['last_insert_rowid()'] as int;

      var r = await LocalUsersServices().getMainIdUserByLocalId(localId: 1);

      var matcher = (await db.rawQuery(
              '''SELECT user_id FROM main_user WHERE (user_id = $insertedRowId);'''))[
          0]['user_id'] as int;

      expect(r, matcher);

      await DBHelper.instanse.deleteDB(db.path);
    });

    test('getUserByLocalId - returns a UserDto by rowid', () async {
      await DBHelper.instanse.initDB();
      var db = await DBHelper.instanse.database;
      var deleted = await db.delete('users');

      var insert = await db.rawInsert('''
        INSERT INTO users (user_id, name, email, profile_pic_link, created_date, updated_date, deleted_date) 
          VALUES (100000, 'LocalUsersServices', 'LocalUsersServices@test', 'profilePicLink', '2022-13-45T34:11:11.123456', '2022-13-45T34:11:11.123456', '');
      ''');

      var insertedRowId =
          (await db.rawQuery('''SELECT last_insert_rowid()'''))[0]
              ['last_insert_rowid()'] as int;

      var r = await LocalUsersServices().getUserById(id: insertedRowId);

      var matcher = (await db.rawQuery(
          '''SELECT * FROM users WHERE (user_id = $insertedRowId);'''))[0];

      expect(r, matcher);

      await DBHelper.instanse.deleteDB(db.path);
    });

    test('getUserByLocalId - returns a UserDto by rowid', () async {
      await DBHelper.instanse.initDB();
      var db = await DBHelper.instanse.database;
      var deleted = await db.delete('users');

      var insert = await db.rawInsert('''
        INSERT INTO users (user_id, name, email, profile_pic_link, created_date, updated_date, deleted_date) 
          VALUES (100000, 'LocalUsersServices', 'LocalUsersServices@test', 'profilePicLink', '2022-13-45T34:11:11.123456', '2022-13-45T34:11:11.123456', '');
      ''');

      var insertedRowId =
          (await db.rawQuery('''SELECT last_insert_rowid()'''))[0]
              ['last_insert_rowid()'] as int;

      var r = await LocalUsersServices().getUserById(id: insertedRowId);

      var matcher = (await db.rawQuery(
          '''SELECT * FROM users WHERE (user_id = $insertedRowId);'''))[0];

      expect(r, matcher);

      await DBHelper.instanse.deleteDB(db.path);
    });

    test('updateUser - returns the number of updated fields', () async {
      await DBHelper.instanse.initDB();
      var db = await DBHelper.instanse.database;
      var deleted = await db.delete('users');

      var insert = await db.rawInsert('''
        INSERT INTO users (user_id, name, email, profile_pic_link, created_date, updated_date, deleted_date) 
          VALUES (100000, 'LocalUsersServices', 'LocalUsersServices@test', 'profilePicLink', '2022-13-45T34:11:11.123456', '2022-13-45T34:11:11.123456', '');
      ''');

      var r = await LocalUsersServices().updateUser(
          newValues: "name = 'LocalUsersServices2'",
          condition: "user_id = 100000");

      var matcher = 1;

      expect(r, matcher);

      await DBHelper.instanse.deleteDB(db.path);
    });

    test('updateUser - updates user data', () async {
      await DBHelper.instanse.initDB();
      var db = await DBHelper.instanse.database;
      var deleted = await db.delete('users');

      var insert = await db.rawInsert('''
        INSERT INTO users (user_id, name, email, profile_pic_link, created_date, updated_date, deleted_date) 
          VALUES (100000, 'LocalUsersServices', 'LocalUsersServices@test', 'profilePicLink', '2022-13-45T34:11:11.123456', '2022-13-45T34:11:11.123456', '');
      ''');

      await LocalUsersServices().updateUser(
          newValues: "name = 'LocalUsersServices2'",
          condition: "user_id = 100000");

      var r = await db
          .rawQuery('''SELECT name FROM users WHERE user_id = 100000''');

      var matcher = 'LocalUsersServices2';

      expect(r[0]['name'], matcher);

      await DBHelper.instanse.deleteDB(db.path);
    });

    test('updateUserStart - returns the number of updated fields', () async {
      await DBHelperStart.instanse.initDB();
      var db = await DBHelperStart.instanse.database;
      var deleted = await db.delete('users');

      var insert = await db.rawInsert('''
        INSERT INTO users (user_id, name, email, profile_pic_link, created_date, updated_date, deleted_date) 
          VALUES (100000, 'LocalUsersServices', 'LocalUsersServices@test', 'profilePicLink', '2022-13-45T34:11:11.123456', '2022-13-45T34:11:11.123456', '');
      ''');

      var insertedRowId =
          (await db.rawQuery('''SELECT last_insert_rowid()'''))[0]
              ['last_insert_rowid()'] as int;

      var r = await LocalUsersServices().updateUserStart(
          newValues: "name = 'LocalUsersServices2'",
          condition: "user_id = 100000");

      var matcher = 1;

      expect(r, matcher);

      await DBHelperStart.instanse.deleteDB(db.path);
    });

    test('updateUserStart - updates user data', () async {
      await DBHelperStart.instanse.initDB();
      var db = await DBHelperStart.instanse.database;
      var deleted = await db.delete('users');

      var insert = await db.rawInsert('''
        INSERT INTO users (user_id, name, email, profile_pic_link, created_date, updated_date, deleted_date) 
          VALUES (100000, 'LocalUsersServices', 'LocalUsersServices@test', 'profilePicLink', '2022-13-45T34:11:11.123456', '2022-13-45T34:11:11.123456', '');
      ''');

      await LocalUsersServices().updateUserStart(
          newValues: "name = 'LocalUsersServices2'",
          condition: "user_id = 100000");

      var r = await db
          .rawQuery('''SELECT name FROM users WHERE user_id = 100000''');

      var matcher = 'LocalUsersServices2';

      expect(r[0]['name'], matcher);

      await DBHelperStart.instanse.deleteDB(db.path);
    });

    test(
        'getAllUserIdAndUpdatedStarted - gets user_id and updated_date for all users in the table',
        () async {
      await DBHelperStart.instanse.initDB();
      var db = await DBHelperStart.instanse.database;
      var deleted = await db.delete('users');

      var insert = await db.rawInsert('''
        INSERT INTO users (user_id, name, email, profile_pic_link, created_date, updated_date, deleted_date) 
          VALUES (100000, 'LocalUsersServices', 'LocalUsersServices@test', 'profilePicLink', '2022-13-45T34:11:11.123456', '2022-13-45T34:11:11.123456', '');
      ''');

      var r = await LocalUsersServices().getAllUserIdAndUpdatedStart();

      // var r = await db.rawQuery('''SELECT name FROM users WHERE user_id = 100000''');

      var matcher = [
        {'user_id': 100000, 'updated_date': '2022-13-45T34:11:11.123456'}
      ];

      expect(r, matcher);

      await DBHelperStart.instanse.deleteDB(db.path);
    });

    test(
        'getAllUserIdAndUpdated - gets user_id and updated_date for all users in the table',
        () async {
      await DBHelper.instanse.initDB();
      var db = await DBHelper.instanse.database;
      var deleted = await db.delete('users');

      var insert = await db.rawInsert('''
        INSERT INTO users (user_id, name, email, profile_pic_link, created_date, updated_date, deleted_date) 
          VALUES (100000, 'LocalUsersServices', 'LocalUsersServices@test', 'profilePicLink', '2022-13-45T34:11:11.123456', '2022-13-45T34:11:11.123456', '');
      ''');

      var r = await LocalUsersServices().getAllUserIdAndUpdated();

      var matcher = [
        {'user_id': 100000, 'updated_date': '2022-13-45T34:11:11.123456'}
      ];

      expect(r, matcher);

      await DBHelper.instanse.deleteDB(db.path);
    });

    test('getLastUserId - gets the biggest user_id', () async {
      await DBHelperStart.instanse.initDB();
      var db = await DBHelperStart.instanse.database;
      var deleted = await db.delete('users');

      await db.rawInsert('''
        INSERT INTO users (user_id, name, email, profile_pic_link, created_date, updated_date, deleted_date) 
          VALUES (100000, 'LocalUsersServices', 'LocalUsersServices@test', 'profilePicLink', '2022-13-45T34:11:11.123456', '2022-13-45T34:11:11.123456', '');
      ''');

      await db.rawInsert('''
        INSERT INTO users (user_id, name, email, profile_pic_link, created_date, updated_date, deleted_date) 
          VALUES (100001, 'LocalUsersServices', 'LocalUsersServices@test', 'profilePicLink', '2022-13-45T34:11:11.123456', '2022-13-45T34:11:11.123456', '');
      ''');

      var r = await LocalUsersServices().getLastUserIdStart();

      var matcher = 100001;

      expect(r, matcher);

      await DBHelperStart.instanse.deleteDB(db.path);
    });

    test('getLastUserId - gets the biggest user_id', () async {
      await DBHelperStart.instanse.initDB();
      var db = await DBHelperStart.instanse.database;
      var deleted = await db.delete('users');

      await db.rawInsert('''
        INSERT INTO users (user_id, name, email, profile_pic_link, created_date, updated_date, deleted_date) 
          VALUES (100000, 'LocalUsersServices', 'LocalUsersServices@test', 'profilePicLink', '2022-13-45T34:11:11.123456', '2022-13-45T34:11:11.123456', '');
      ''');

      await db.rawInsert('''
        INSERT INTO users (user_id, name, email, profile_pic_link, created_date, updated_date, deleted_date) 
          VALUES (100001, 'LocalUsersServices', 'LocalUsersServices@test', 'profilePicLink', '2022-13-45T34:11:11.123456', '2022-13-45T34:11:11.123456', '');
      ''');

      var r = await LocalUsersServices().getLastUserIdStart();

      var matcher = 100001;

      expect(r, matcher);

      await DBHelperStart.instanse.deleteDB(db.path);
    });

    test('getMaxUserId - gets the biggest user_id', () async {
      await DBHelper.instanse.initDB();
      var db = await DBHelper.instanse.database;
      var deleted = await db.delete('users');

      await db.rawInsert('''
        INSERT INTO users (user_id, name, email, profile_pic_link, created_date, updated_date, deleted_date) 
          VALUES (100000, 'LocalUsersServices', 'LocalUsersServices@test', 'profilePicLink', '2022-13-45T34:11:11.123456', '2022-13-45T34:11:11.123456', '');
      ''');

      await db.rawInsert('''
        INSERT INTO users (user_id, name, email, profile_pic_link, created_date, updated_date, deleted_date) 
          VALUES (100001, 'LocalUsersServices', 'LocalUsersServices@test', 'profilePicLink', '2022-13-45T34:11:11.123456', '2022-13-45T34:11:11.123456', '');
      ''');

      var r = await LocalUsersServices().getMaxUserId();

      var matcher = 100001;

      expect(r, matcher);

      await DBHelper.instanse.deleteDB(db.path);
    });
  });
}
