import 'dart:developer';

import 'package:chat_app/modules/storage_manager/db_helper/db_helper.dart';
import 'package:chat_app/src/constants/db_constants.dart';
import 'package:chat_app/src/libraries/library_all.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:sqflite/sqflite.dart';

Future main() async {
  setUpAll(() {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  });
  group("Тест создания таблицы", () {
    test('Test dbhelper', () async {
      final dbHelper = DBHelper.instanse;
      final db = await dbHelper.database;
      final usersCont = ((await db.rawQuery('''
              SELECT *
              FROM ${DatabaseConst.userTable}
              ''')).last['local_users_id'] as int) + 1;

      final user = {
        'name': 'test1',
        'email': 't1@t1.t1',
        DatabaseConst.usersColumnProfilePicLink:
            'https://music.mathwatha.com/wp-content/uploads/2017/08/tonyprofile-300x300.jpg',
        //DatabaseConst.usersColumnRegistrationDate: '2022-12-02T21:36:32.653712',
        DatabaseConst.usersColumnMainUsersId: usersCont,
        'local_users_id': usersCont,
      };

      await dbHelper.onAdd(tableName: DatabaseConst.userTable, model: user);

      var users = await db.rawQuery('''
              SELECT *
              FROM ${DatabaseConst.userTable}
              WHERE ${DatabaseConst.usersColumnMainUsersId} = $usersCont
              ''');
      expect(users.last, user);

      final user2 = {
        'name': 'test2',
        'email': 't2@t2.t2',
        DatabaseConst.usersColumnProfilePicLink:
            'https://static.more.tv/actor/avatar/5feab82564aa7.jpeg',
        //DatabaseConst.usersColumnRegistrationDate: '2022-12-02T21:37:32.653712',
        DatabaseConst.usersColumnMainUsersId: usersCont + 1,
        'local_users_id': usersCont + 1,
      };

      await dbHelper.onAdd(tableName: DatabaseConst.userTable, model: user2);
      await dbHelper.onDelete(
          tableName: DatabaseConst.userTable,
          column: DatabaseConst.usersColumnId,
          model: user2);
      users = await db.rawQuery('''
              SELECT *
              FROM ${DatabaseConst.userTable}
              WHERE ${DatabaseConst.usersColumnMainUsersId} = $usersCont
              ''');
      expect(users.last, user);

      // await dbHelper.onUpdate(
      //     tableName: DatabaseConst.userTable,
      //     column: DatabaseConst.usersColumnId,
      //     model: user);

      expect(users.last, user);
    });

    test('Тест создания таблицы User', () async {
      var db = await openDatabase(inMemoryDatabasePath, version: 1,
          onCreate: (db, version) async {
        await db.transaction((txn) async {
          //Таблица User
//           await txn.execute('''
// CREATE TABLE ${DatabaseConst.userTable} (
//   ${DatabaseConst.usersColumnId} ${DatabaseConst.integer} ${DatabaseConst.primaryKey} ${DatabaseConst.autoincrement},
//   ${DatabaseConst.usersColumnName} ${DatabaseConst.char350} ${DatabaseConst.notNull},
//   ${DatabaseConst.usersColumnEmail} ${DatabaseConst.char350} ${DatabaseConst.notNull},
//   ${DatabaseConst.usersColumnRegistrationDate} ${DatabaseConst.date} ${DatabaseConst.notNull},
//   ${DatabaseConst.usersColumnProfilePicLink} ${DatabaseConst.char350} ${DatabaseConst.notNull},
//   ${DatabaseConst.usersColumnMainUsersId} ${DatabaseConst.integer} ${DatabaseConst.notNull} ${DatabaseConst.unique}
//   )
// ''');
        });
      });
    });
    test('Тест создания таблицы Messages', () async {
      var db = await openDatabase(inMemoryDatabasePath, version: 1,
          onCreate: (db, version) async {
        await db.transaction((txn) async {
// //Таблица Messages
//           await txn.execute('''
// CREATE TABLE ${DatabaseConst.messageTable} (
//  ${DatabaseConst.messagesColumnLocalMessagesId} ${DatabaseConst.integer} ${DatabaseConst.primaryKey} ${DatabaseConst.autoincrement},
//  ${DatabaseConst.messagesColumnLocalChatId} ${DatabaseConst.integer} ${DatabaseConst.notNull},
//  ${DatabaseConst.messagesColumnDate} ${DatabaseConst.integer} ${DatabaseConst.notNull},
//  ${DatabaseConst.messagesColumnSenderLocalId} ${DatabaseConst.integer} ${DatabaseConst.notNull},
//  ${DatabaseConst.messagesColumnIsWrittenToDb} ${DatabaseConst.integer} ${DatabaseConst.notNull} DEFAULT 0,
//  ${DatabaseConst.messagesColumnContent} ${DatabaseConst.char350} ${DatabaseConst.notNull},
//  ${DatabaseConst.constraint} MESSAGES_FK_79 ${DatabaseConst.foreignKey} ( ${DatabaseConst.messagesColumnLocalChatId} ) ${DatabaseConst.references} ${DatabaseConst.chatsTable} ( local_chats_id ),
//  ${DatabaseConst.constraint} MESSAGES_FK_80 ${DatabaseConst.foreignKey} ( ${DatabaseConst.messagesColumnSenderLocalId} ) ${DatabaseConst.references} ${DatabaseConst.userTable} ( local_users_id ),
//  CHECK ((is_written_to_db = 0) OR (is_written_to_db = 1))
//  CHECK ((sender_is_user = 0) OR (sender_is_user = 1))
//  CHECK (LENGTH(date) = 26)
// )
// ''');
        });
      });
    });

    // test('Создание табилцы тест и добавление туда Боба', () async {
    //   var db = await openDatabase(
    //     inMemoryDatabasePath,
    //     version: 1,
    //     onCreate: (db, version) async {
    //       await db
    //           .execute('CREATE TABLE Test (id INTEGER PRIMARY KEY, name TEXT)');
    //     },
    //   );
    //   var values = {'id': 1, 'name': 'TestBob'};
    //   await db.insert('Test', values);
    //   expect(await db.query('Test'), [values]);
    // });
  });
}
