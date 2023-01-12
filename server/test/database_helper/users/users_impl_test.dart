// ignore_for_file: unused_local_variable

import 'package:server/src/generated/grpcsynh.pb.dart';
import 'package:sqflite_common/sqlite_api.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:sqflite/sqflite.dart';
import 'package:test/test.dart';
import 'package:server/src/db_server/services/database_impl.dart';

import 'package:server/src/db_server/database_helper/users/users_impl.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  group('Main db: LocalUsersServices CRUD', () {
    sqfliteFfiInit();

    test(
        'createUser - takes user\'s parameters, returns List<Map<String, Object?>>',
        () async {
      Database db = await DbServerServices.instanse.database;
      await db.delete('users');
      var date = '2022-13-45T34:11:11.123456';

      var r = await UsersServices().createUser(
          name: 'name',
          email: 'email',
          createdDate: date,
          profilePicUrl: 'profilePicUrl',
          password: 'password',
          updatedDate: date);

      var id = (await db.rawQuery('''SELECT last_insert_rowid()'''))[0]
          ['last_insert_rowid()'];

      var matcher = [
        {
          'user_id': id,
          'name': 'name',
          'email': 'email',
          'created_date': '2022-13-45T34:11:11.123456',
          'profile_pic_url': 'profilePicUrl',
          'updated_date': '2022-13-45T34:11:11.123456',
          'deleted_date': null,
          'hash_connect': null,
          'password': 'password'
        }
      ];

      expect(r, matcher);
    });

    test('deleteUser - returns number of deleted rows', () async {
      Database db = await DbServerServices.instanse.database;
      await db.delete('users');

      await db.rawInsert('''
        INSERT INTO users (name, email, profile_pic_url, created_date, updated_date) 
          VALUES ('1', '1', 'link', '2022-13-45T34:11:11.123456', '2022-13-45T34:11:11.123456')
      ''');

      var id = (await db.rawQuery('''SELECT last_insert_rowid()'''))[0]
          ['last_insert_rowid()'] as int;

      var r = await UsersServices().deleteUser(id: id);
      var matcher = 1;
      expect(r, matcher);
    });

    test('deleteUser - deletes a row', () async {
      Database db = await DbServerServices.instanse.database;
      await db.delete('users');

      await db.rawInsert('''
        INSERT INTO users (name, email, profile_pic_url, created_date, updated_date) 
          VALUES ('1', '1', 'link', '2022-13-45T34:11:11.123456', '2022-13-45T34:11:11.123456')
      ''');

      var id = (await db.rawQuery('''SELECT last_insert_rowid()'''))[0]
          ['last_insert_rowid()'] as int;

      await UsersServices().deleteUser(id: id);
      var r = await db.rawQuery('''SELECT * FROM users WHERE user_id = $id''');
      var matcher = [];

      expect(r, matcher);
    });

    test('getAllUsers', () async {
      Database db = await DbServerServices.instanse.database;
      await db.delete('users');

      await db.rawInsert('''
        INSERT INTO users (name, email, profile_pic_url, created_date, updated_date) 
          VALUES ('1', '1', 'link', '2022-13-45T34:11:11.123456', '2022-13-45T34:11:11.123456')
      ''');
      await db.rawInsert('''
        INSERT INTO users (name, email, profile_pic_url, created_date, updated_date) 
          VALUES ('1', '1', 'link', '2022-13-45T34:11:11.123456', '2022-13-45T34:11:11.123456')
      ''');

      var id = (await db.rawQuery('''SELECT last_insert_rowid()'''))[0]
          ['last_insert_rowid()'] as int;

      var r = await UsersServices().getAllUsers();
      var matcher = [
        {
          'user_id': id - 1,
          'name': '1',
          'email': '1',
          'created_date': '2022-13-45T34:11:11.123456',
          'profile_pic_url': 'link',
          'updated_date': '2022-13-45T34:11:11.123456',
          'deleted_date': null,
          'hash_connect': null,
          'password': null
        },
        {
          'user_id': id,
          'name': '1',
          'email': '1',
          'created_date': '2022-13-45T34:11:11.123456',
          'profile_pic_url': 'link',
          'updated_date': '2022-13-45T34:11:11.123456',
          'deleted_date': null,
          'hash_connect': null,
          'password': null
        }
      ];

      expect(r, matcher);
    });

    test('getAllUsersMoreId', () async {
      Database db = await DbServerServices.instanse.database;
      await db.delete('users');
      await db.rawInsert('''
        INSERT INTO users (name, email, profile_pic_url, created_date, updated_date) 
          VALUES ('1', '1', 'link', '2022-13-45T34:11:11.123456', '2022-13-45T34:11:11.123456')
      ''');
      await db.rawInsert('''
        INSERT INTO users (name, email, profile_pic_url, created_date, updated_date) 
          VALUES ('1', '1', 'link', '2022-13-45T34:11:11.123456', '2022-13-45T34:11:11.123456')
      ''');

      var id = (await db.rawQuery('''SELECT last_insert_rowid()'''))[0]
          ['last_insert_rowid()'] as int;

      var r = await UsersServices().getAllUsersMoreId(id: id - 1);
      var matcher = [
        {
          'user_id': id,
          'name': '1',
          'email': '1',
          'created_date': '2022-13-45T34:11:11.123456',
          'profile_pic_url': 'link',
          'updated_date': '2022-13-45T34:11:11.123456',
          'deleted_date': null,
          'hash_connect': null,
          'password': null
        }
      ];

      expect(r, matcher);
    });

    test(
        'getUser - takes an id, returns user_id, updated_date and deleted_date',
        () async {
      Database db = await DbServerServices.instanse.database;
      await db.delete('users');

      await db.rawInsert('''
        INSERT INTO users (name, email, profile_pic_url, created_date, updated_date) 
          VALUES ('1', '1', 'link', '2022-13-45T34:11:11.123456', '2022-13-45T34:11:11.123456')
      ''');

      var id = (await db.rawQuery('''SELECT last_insert_rowid()'''))[0]
          ['last_insert_rowid()'] as int;

      var r = await UsersServices().getUser(id: id);
      var matcher = [
        {
          'user_id': id,
          'updated_date': '2022-13-45T34:11:11.123456',
          'deleted_date': null,
        }
      ];

      expect(r, matcher);
    });

    test('getUserById - returns List<Map<String, Object?>>', () async {
      Database db = await DbServerServices.instanse.database;
      await db.delete('users');

      await db.rawInsert('''
        INSERT INTO users (name, email, profile_pic_url, created_date, updated_date) 
          VALUES ('1', '1', 'link', '2022-13-45T34:11:11.123456', '2022-13-45T34:11:11.123456')
      ''');

      var id = (await db.rawQuery('''SELECT last_insert_rowid()'''))[0]
          ['last_insert_rowid()'] as int;

      var r = await UsersServices().getUserById(userId: id);
      var matcher = {
        'user_id': id,
        'name': '1',
        'email': '1',
        'created_date': '2022-13-45T34:11:11.123456',
        'profile_pic_url': 'link',
        'updated_date': '2022-13-45T34:11:11.123456',
        'deleted_date': null,
        'hash_connect': null,
        'password': null
      };

      expect(r, matcher);
    });

    test('updateUser - returns number of updated rows', () async {
      Database db = await DbServerServices.instanse.database;
      await db.delete('users');

      await db.rawInsert('''
        INSERT INTO users (name, email, profile_pic_url, created_date, updated_date) 
          VALUES ('1', '1', 'link', '2022-13-45T34:11:11.123456', '2022-13-45T34:11:11.123456')
      ''');

      var id = (await db.rawQuery('''SELECT last_insert_rowid()'''))[0]
          ['last_insert_rowid()'] as int;

      var r = await UsersServices()
          .updateUser(newValues: 'name = "name1"', condition: 'user_id = $id');
      var matcher = 1;

      expect(r, matcher);
    });

    test('updateUser - sets newValues where condition is true', () async {
      Database db = await DbServerServices.instanse.database;
      await db.delete('users');

      await db.rawInsert('''
        INSERT INTO users (name, email, profile_pic_url, created_date, updated_date) 
          VALUES ('1', '1', 'link', '2022-13-45T34:11:11.123456', '2022-13-45T34:11:11.123456')
      ''');

      var id = (await db.rawQuery('''SELECT last_insert_rowid()'''))[0]
          ['last_insert_rowid()'] as int;

      await UsersServices()
          .updateUser(newValues: 'name = "name1"', condition: 'user_id = $id');
      var r = (await db
              .rawQuery('''SELECT name FROM users WHERE user_id = $id'''))[0]
          ['name'];
      var matcher = 'name1';

      expect(r, matcher);
    });
    test('getUserIdByChat', () async {
      Database db = await DbServerServices.instanse.database;
      await db.delete('users');

      await db.rawInsert('''
        INSERT INTO users (name, email, profile_pic_url, created_date, updated_date) 
          VALUES ('1', '1', 'link', '2022-13-45T34:11:11.123456', '2022-13-45T34:11:11.123456')
      ''');

      var userId = (await db.rawQuery('''SELECT last_insert_rowid()'''))[0]
          ['last_insert_rowid()'] as int;

      await db.rawInsert('''
        INSERT INTO chats (friend1_id, friend2_id, created_date, updated_date) 
          VALUES (1, $userId, '2022-13-45T34:11:11.123456', '2022-13-45T34:11:11.123456')
      ''');

      var chatId = (await db.rawQuery('''SELECT last_insert_rowid()'''))[0]
          ['last_insert_rowid()'] as int;

      // var id = (await db.rawQuery('''SELECT last_insert_rowid()'''))[0]['last_insert_rowid()'] as int;

      var r =
          await UsersServices().getUserIdByChat(senderId: 1, chatId: chatId);
      var matcher = userId;

      expect(r, matcher);
    });

    test('getHashCodeById', () async {
      Database db = await DbServerServices.instanse.database;
      await db.delete('users');

      await db.rawInsert('''
        INSERT INTO users (name, email, profile_pic_url, created_date, updated_date, hash_connect) 
          VALUES ('1', '1', 'link', '2022-13-45T34:11:11.123456', '2022-13-45T34:11:11.123456', 1234567890)
      ''');

      var id = (await db.rawQuery('''SELECT last_insert_rowid()'''))[0]
          ['last_insert_rowid()'] as int;

      var r = await UsersServices().getHashCodeById(id: id);
      var matcher = 1234567890;

      expect(r, matcher);
    });

    test('getAllUsersByIDfriend', () async {
      Database db = await DbServerServices.instanse.database;
      await db.delete('users');

      await db.rawInsert('''
        INSERT INTO users (name, email, profile_pic_url, created_date, updated_date) 
          VALUES ('1', '1', 'link', '2022-13-45T34:11:11.123456', '2022-13-45T34:11:11.123456')
      ''');

      var userId = (await db.rawQuery('''SELECT last_insert_rowid()'''))[0]
          ['last_insert_rowid()'] as int;

      await db.rawInsert('''
        INSERT INTO chats (friend1_id, friend2_id, created_date, updated_date) 
          VALUES ($userId, 1, '2022-13-45T34:11:11.123456', '2022-13-45T34:11:11.123456')
      ''');

      var chatId = (await db.rawQuery('''SELECT last_insert_rowid()'''))[0]
          ['last_insert_rowid()'] as int;

      var r = await UsersServices().getAllUsersByIDfriend(userId: 1);
      var matcher = [
        {
          'user_id': userId,
          'name': '1',
          'email': '1',
          'created_date': '2022-13-45T34:11:11.123456',
          'profile_pic_url': 'link',
          'updated_date': '2022-13-45T34:11:11.123456',
          'deleted_date': null,
          'hash_connect': null,
          'password': null
        }
      ];

      expect(r, matcher);
    });

    test('getAllUsersByIDfriendMoreChatId', () async {
      Database db = await DbServerServices.instanse.database;
      await db.delete('users');

      await db.rawInsert('''
        INSERT INTO users (name, email, profile_pic_url, created_date, updated_date) 
          VALUES ('1', '1', 'link', '2022-13-45T34:11:11.123456', '2022-13-45T34:11:11.123456')
      ''');

      var userId = (await db.rawQuery('''SELECT last_insert_rowid()'''))[0]
          ['last_insert_rowid()'] as int;

      await db.rawInsert('''
        INSERT INTO chats (friend1_id, friend2_id, created_date, updated_date) 
          VALUES ($userId, 1, '2022-13-45T34:11:11.123456', '2022-13-45T34:11:11.123456')
      ''');

      var chatId = (await db.rawQuery('''SELECT last_insert_rowid()'''))[0]
          ['last_insert_rowid()'] as int;

      var r = await UsersServices()
          .getAllUsersByIDfriendMoreChatId(id: 1, chatId: chatId - 1);
      var matcher = [
        {
          'user_id': userId,
          'name': '1',
          'email': '1',
          'created_date': '2022-13-45T34:11:11.123456',
          'profile_pic_url': 'link',
          'updated_date': '2022-13-45T34:11:11.123456',
          'deleted_date': null,
          'hash_connect': null,
          'password': null
        }
      ];

      expect(r, matcher);
    });

    test('getUpdatedUsers', () async {
      Database db = await DbServerServices.instanse.database;
      await db.delete('users');

      await db.rawInsert('''
        INSERT INTO users (name, email, profile_pic_url, created_date, updated_date) 
          VALUES ('1', '1', 'link', '2022-13-45T34:11:11.123456', '2022-13-45T34:11:11.123456')
      ''');
      await db.rawInsert('''
        INSERT INTO users (name, email, profile_pic_url, created_date, updated_date) 
          VALUES ('1', '1', 'link', '2022-13-45T34:11:11.123456', '2022-13-45T34:11:11.123456')
      ''');

      var id = (await db.rawQuery('''SELECT last_insert_rowid()'''))[0]
          ['last_insert_rowid()'] as int;

      List<UserRequest> usersUpdated = [];
      usersUpdated.add(UserRequest(
          userId: id - 1, updatedDate: '2023-13-45T34:11:11.123456'));
      usersUpdated.add(
          UserRequest(userId: id, updatedDate: '2023-12-02T21:36:32.653712'));

      var r = await UsersServices().getUpdatedUsers(users: usersUpdated);
      var matcher = [
        {
          'user_id': id - 1,
          'name': '1',
          'email': '1',
          'created_date': '2022-13-45T34:11:11.123456',
          'profile_pic_url': 'link',
          'updated_date': '2022-13-45T34:11:11.123456',
          'deleted_date': null,
          'hash_connect': null,
          'password': null
        },
        {
          'user_id': id,
          'name': '1',
          'email': '1',
          'created_date': '2022-13-45T34:11:11.123456',
          'profile_pic_url': 'link',
          'updated_date': '2022-13-45T34:11:11.123456',
          'deleted_date': null,
          'hash_connect': null,
          'password': null
        }
      ];

      expect(r, matcher);
    });
  });
}
