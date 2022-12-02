import 'package:flutter_chat_app/domain/model/chats.dart';
import 'package:flutter_chat_app/domain/model/message_id_in_main.dart';
import 'package:flutter_chat_app/domain/model/messages.dart';
import 'package:flutter_chat_app/domain/model/user.dart';
import 'package:flutter_chat_app/storage_manager/database_const.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:sqflite/sqflite.dart';

Future main() async {
  setUpAll(() {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  });
  group("Тест таблицы", () {
    test('User', () async {
      var db = await openDatabase(inMemoryDatabasePath, version: 1,
          onCreate: (db, version) async {
        await db.transaction((txn) async {
          await txn.execute('''
CREATE TABLE ${User.table} (
  ${DatabaseConst.columnId} ${DatabaseConst.integer} ${DatabaseConst.primaryKey} ${DatabaseConst.autoincrement},
  ${DatabaseConst.columnName} ${DatabaseConst.char50} ${DatabaseConst.notNull},
  ${DatabaseConst.columnEmail} ${DatabaseConst.char50} ${DatabaseConst.notNull},
  ${DatabaseConst.columnRegistrationDate} ${DatabaseConst.date} ${DatabaseConst.notNull},
  ${DatabaseConst.columnProfilePicLink} ${DatabaseConst.char50} ${DatabaseConst.notNull},
  ${DatabaseConst.columnMainUsersId} ${DatabaseConst.integer} ${DatabaseConst.notNull} ${DatabaseConst.unique}
  )
''');
        });

        var user = {
          'name': 'Bod',
          'email': 'foo@email.com',
          'registration_date': '2022-12-02T21:36:32.653712',
          'profile_pic_link': 'some pic link',
          'main_users_id': 1,
        };
        var user2 = {
          'name': 'Bod',
          'email': 'foo@email.com',
          'registration_date': '2022-12-02T21:36:32.653712',
          'profile_pic_link': 'some pic link',
          'main_users_id': 2,
        };
        var user3 = {
          'name': 'Bod',
          'email': 'foo@email.com',
          'registration_date': '2022-12-02T21:36:32.653712',
          'profile_pic_link': 'some pic link',
          'main_users_id': 3,
        };
        await db.insert('User', user);
        await db.insert('User', user2);
        await db.insert('User', user3);
        expect(await db.query('User'), [
          {
            'id': 1,
            'name': 'Bod',
            'email': 'foo@email.com',
            'registration_date': '2022-12-02T21:36:32.653712',
            'profile_pic_link': 'some pic link',
            'main_users_id': 1,
          },
          {
            'id': 2,
            'name': 'Bod',
            'email': 'foo@email.com',
            'registration_date': '2022-12-02T21:36:32.653712',
            'profile_pic_link': 'some pic link',
            'main_users_id': 2,
          },
          {
            'id': 3,
            'name': 'Bod',
            'email': 'foo@email.com',
            'registration_date': '2022-12-02T21:36:32.653712',
            'profile_pic_link': 'some pic link',
            'main_users_id': 3,
          }
        ]);
        await db.close();
      });
    });
    test('Messages', () async {
      var db = await openDatabase(
        inMemoryDatabasePath,
        version: 1,
        onCreate: (db, version) async {
          await db.transaction((txn) async {
            await txn.execute('''
CREATE TABLE ${Messages.table} (
 ${DatabaseConst.columnId} ${DatabaseConst.integer} ${DatabaseConst.primaryKey} ${DatabaseConst.autoincrement},
 ${DatabaseConst.columnLocalChatId} ${DatabaseConst.integer} ${DatabaseConst.notNull},
 ${DatabaseConst.columnDate} ${DatabaseConst.integer} ${DatabaseConst.notNull},
 ${DatabaseConst.columnSenderLocalId} ${DatabaseConst.integer} ${DatabaseConst.notNull},
 ${DatabaseConst.columnIsWrittenToDb} ${DatabaseConst.integer} ${DatabaseConst.notNull},
 ${DatabaseConst.columnContent} ${DatabaseConst.char50} ${DatabaseConst.notNull},
 ${DatabaseConst.constraint} MESSAGES_FK_79 ${DatabaseConst.foreignKey} ( ${DatabaseConst.columnLocalChatId} ) ${DatabaseConst.references} ${Chats.table} ( local_chats_id ),
 ${DatabaseConst.constraint} MESSAGES_FK_80 ${DatabaseConst.foreignKey} ( ${DatabaseConst.columnSenderLocalId} ) ${DatabaseConst.references} ${User.table} ( local_users_id ),
 CHECK ((is_written_to_db = 0}) OR (is_written_to_db = 1))
 CHECK ((sender_is_user = 0) OR (sender_is_user = 1))
)
''');
            var message = {
              'local_chat_id': 2,
              'date': '2022-12-02T21:36:32.653712',
              'sender_local_id': 2,
              'is_writtern_to_db': 1,
              'content': 'some chat message'
            };
            await db.insert('messages', message);
            expect(await db.query('messages'), [
              {
                'local_chat_id': 2,
                'date': '2022-12-02T21:36:32.653712',
                'sender_local_id': 2,
                'is_writtern_to_db': 1,
                'content': 'some chat message'
              }
            ]);
            await db.close();
          });
        },
      );
    });
    test('Message ID in Main', () async {
      var db = await openDatabase(
        inMemoryDatabasePath,
        version: 1,
        onCreate: (db, version) async {
          await db.transaction((txn) async {
            await txn.execute('''
CREATE TABLE ${MessageIdInMain.table}
(
 ${DatabaseConst.columnId} ${DatabaseConst.integer} ${DatabaseConst.primaryKey} ${DatabaseConst.autoincrement},
 ${DatabaseConst.columnLocalMessagesId} ${DatabaseConst.integer} ${DatabaseConst.notNull} ${DatabaseConst.unique},
 ${DatabaseConst.constraint} MESSAGE_ID_IN_MAIN_FK_86 ${DatabaseConst.foreignKey} ( ${DatabaseConst.columnLocalMessagesId} ) ${DatabaseConst.references} ( ${DatabaseConst.columnLocalMessagesId} )
);
''');
            var message = {
              'local_messages_id': 2,
            };
            await db.insert('message_id_in_main', message);
            expect(await db.query('message_id_in_main'), [
              {'id': 1, 'local_chat_id': 2}
            ]);
            await db.close();
          });
        },
      );
    });
    test('Chats', () async {
      var db = await openDatabase(
        inMemoryDatabasePath,
        version: 1,
        onCreate: (db, version) async {
          await db.transaction((txn) async {
            await txn.execute('''
CREATE TABLE ${Chats.table}(
 ${DatabaseConst.columnId} ${DatabaseConst.integer} ${DatabaseConst.primaryKey} ${DatabaseConst.autoincrement},
 ${DatabaseConst.columnChatIdMain} ${DatabaseConst.integer} ${DatabaseConst.notNull} ${DatabaseConst.unique},
 ${DatabaseConst.columnFriendId} ${DatabaseConst.integer} ${DatabaseConst.notNull},
 ${DatabaseConst.constraint} CHATS_FK_84 ${DatabaseConst.foreignKey} ( ${DatabaseConst.columnFriendId} ) ${DatabaseConst.references} ${User.table} ( local_users_id )
)
''');
            var chats = {
              'chat_id_main': 2,
              'friend_id': 3,
            };
            await db.insert('message_id_in_main', chats);
            expect(await db.query('message_id_in_main'), [
              {'id': 1, 'chat_id_main': 2, 'friend_id': 3}
            ]);
            await db.close();
          });
        },
      );
    });
  });
}
