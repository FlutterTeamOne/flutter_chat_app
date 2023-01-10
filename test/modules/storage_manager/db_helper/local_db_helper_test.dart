import 'dart:developer';
import 'dart:io';

import 'package:chat_app/modules/signal_service/service_locator/locator.dart';
import 'package:chat_app/modules/storage_manager/db_helper/db_helper.dart';
import 'package:chat_app/modules/storage_manager/db_helper/db_helper_start.dart';
import 'package:chat_app/modules/storage_manager/db_helper/user_path.dart';
import 'package:chat_app/src/constants/db_constants.dart';
import 'package:chat_app/src/libraries/library_all.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:path/path.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:sqflite/sqflite.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  group("Local db: creating tables:", () {   
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
    // test('"user_last_time_online" table created', () async {
    //   await DBHelper.instanse.initDB();
    //   var db = await DBHelper.instanse.database;
    //   var r = await db.rawQuery('''SELECT name FROM sqlite_master WHERE type='table' AND name='user_last_time_online';''');
      
    //   expect(r, [{'name': 'user_last_time_online'}]);
    // });
  });

  group('Local db: "CREATE TABLE" queries:', () {
    setUp(() {
      sqfliteFfiInit();
      databaseFactory = databaseFactoryFfi;
    });

    test('CREATE TABLE users', () async {
      databaseFactory.deleteDatabase('test');
      var db = await databaseFactory.openDatabase('test');
      await db.transaction((txn) async {
        await txn.execute('''
        CREATE TABLE ${DatabaseConst.userTable} (
          ${DatabaseConst.usersColumnUserId} ${DatabaseConst.integer} ${DatabaseConst.primaryKey} ${DatabaseConst.autoincrement},
          ${DatabaseConst.usersColumnName} ${DatabaseConst.char50} ${DatabaseConst.notNull},
          ${DatabaseConst.usersColumnEmail} ${DatabaseConst.char50} ${DatabaseConst.notNull},
          ${DatabaseConst.usersColumnProfilePicLink} ${DatabaseConst.char50} ${DatabaseConst.notNull},
          ${DatabaseConst.usersColumnCreatedDate} ${DatabaseConst.char26} ${DatabaseConst.notNull},
          ${DatabaseConst.usersColumnUpdatedDate} ${DatabaseConst.char26} ${DatabaseConst.notNull},
          ${DatabaseConst.usersColumnDeletedDate} ${DatabaseConst.char26}
          )
      ''');
      });

      var r = await db.rawQuery('''PRAGMA table_info(users)''');
      var matcher = [
            {
              'cid': 0,
              'name': 'user_id',
              'type': 'INTEGER',
              'notnull': 0,
              'dflt_value': null,
              'pk': 1
            },
            {
              'cid': 1,
              'name': 'name',
              'type': 'char(50)',
              'notnull': 1,
              'dflt_value': null,
              'pk': 0
            },
            {
              'cid': 2,
              'name': 'email',
              'type': 'char(50)',
              'notnull': 1,
              'dflt_value': null,
              'pk': 0
            },
            {
              'cid': 3,
              'name': 'profile_pic_link',
              'type': 'char(50)',
              'notnull': 1,
              'dflt_value': null,
              'pk': 0
            },
            {
              'cid': 4,
              'name': 'created_date',
              'type': 'char(26)',
              'notnull': 1,
              'dflt_value': null,
              'pk': 0
            },
            {
              'cid': 5,
              'name': 'updated_date',
              'type': 'char(26)',
              'notnull': 1,
              'dflt_value': null,
              'pk': 0
            },
            {
              'cid': 6,
              'name': 'deleted_date',
              'type': 'char(26)',
              'notnull': 0,
              'dflt_value': null,
              'pk': 0
            }
          ];
      expect(r, matcher);
      db.close();
    });

    test('CREATE TABLE chats', () async {
      databaseFactory.deleteDatabase('test');
      var db = await databaseFactory.openDatabase('test');
      await db.transaction((txn) async {
      await txn.execute('''
        CREATE TABLE ${DatabaseConst.chatsTable}(
          ${DatabaseConst.chatsColumnChatId} ${DatabaseConst.integer} ${DatabaseConst.primaryKey} ${DatabaseConst.autoincrement},
          ${DatabaseConst.chatsColumnUserId} ${DatabaseConst.integer} ${DatabaseConst.notNull} ${DatabaseConst.unique},
          ${DatabaseConst.chatsColumnCreatedDate} ${DatabaseConst.char26} ${DatabaseConst.notNull},
          ${DatabaseConst.chatsColumnUpdatedDate} ${DatabaseConst.char26},
          ${DatabaseConst.chatsColumnDeletedDate} ${DatabaseConst.char26},
          ${DatabaseConst.constraint} CHATS_FK_84 ${DatabaseConst.foreignKey} ( ${DatabaseConst.chatsColumnUserId} ) ${DatabaseConst.references} ${DatabaseConst.userTable} ( ${DatabaseConst.usersColumnUserId} )
        )
        ''');
      });

      var r = await db.rawQuery('''PRAGMA table_info(chats)''');
      var matcher = [
            {
              'cid': 0,
              'name': 'chat_id',
              'type': 'INTEGER',
              'notnull': 0,
              'dflt_value': null,
              'pk': 1
            },
            {
              'cid': 1,
              'name': 'user_id',
              'type': 'INTEGER',
              'notnull': 1,
              'dflt_value': null,
              'pk': 0
            },
            {
              'cid': 2,
              'name': 'created_date',
              'type': 'char(26)',
              'notnull': 1,
              'dflt_value': null,
              'pk': 0
            },
            {
              'cid': 3,
              'name': 'update_date',
              'type': 'char(26)',
              'notnull': 0,
              'dflt_value': null,
              'pk': 0
            },
            {
              'cid': 4,
              'name': 'deleted_date',
              'type': 'char(26)',
              'notnull': 0,
              'dflt_value': null,
              'pk': 0
            }
          ];
      expect(r, matcher);
      db.close();
    });

    test('CREATE TABLE messages', () async {
      databaseFactory.deleteDatabase('test');
      var db = await databaseFactory.openDatabase('test');
      await db.transaction((txn) async {
      await txn.execute('''
        CREATE TABLE ${DatabaseConst.messageTable} (
          ${DatabaseConst.messagesColumnLocalMessagesId} ${DatabaseConst.integer} ${DatabaseConst.primaryKey} ${DatabaseConst.autoincrement},
          ${DatabaseConst.messagesColumnChatId} ${DatabaseConst.integer} ${DatabaseConst.notNull},
          ${DatabaseConst.messagesColumnCreatedDate} ${DatabaseConst.char26} ${DatabaseConst.notNull},
          ${DatabaseConst.messagesColumnSenderId} ${DatabaseConst.integer} ${DatabaseConst.notNull},
          ${DatabaseConst.messagesColumnMessageId} ${DatabaseConst.integer},
          ${DatabaseConst.messagesColumnIsRead} ${DatabaseConst.integer} ${DatabaseConst.notNull} DEFAULT 0,
          ${DatabaseConst.messagesColumnContent} ${DatabaseConst.char50} ${DatabaseConst.notNull},
          ${DatabaseConst.messagesColumnUpdatedDate} ${DatabaseConst.char26} ${DatabaseConst.notNull},
          ${DatabaseConst.messagesColumnDeletedDate} ${DatabaseConst.char26}, 
          ${DatabaseConst.messagesColumnAttachmentId} ${DatabaseConst.integer},
          ${DatabaseConst.messagesColumnContentType} ${DatabaseConst.text},
          ${DatabaseConst.constraint} MESSAGES_FK_79 ${DatabaseConst.foreignKey} ( ${DatabaseConst.messagesColumnChatId} ) ${DatabaseConst.references} ${DatabaseConst.chatsTable} ( ${DatabaseConst.chatsColumnChatId} ),

          ${DatabaseConst.constraint} MESSAGES_FK_80 ${DatabaseConst.foreignKey} ( ${DatabaseConst.messagesColumnSenderId} ) ${DatabaseConst.references} ${DatabaseConst.userTable} ( ${DatabaseConst.usersColumnUserId} ),

          ${DatabaseConst.constraint} MESSAGES_FK_81 ${DatabaseConst.foreignKey} ( ${DatabaseConst.messagesColumnAttachmentId} ) ${DatabaseConst.references} ${DatabaseConst.attachmentsTable} ( ${DatabaseConst.attachmentsColumnAttachmentId} ),

          CHECK ((is_read = 0) OR (is_read = 1)),
          CHECK (LENGTH(${DatabaseConst.messagesColumnCreatedDate}) = 26)
        )
        ''');
      });

      var r = await db.rawQuery('''PRAGMA table_info(messages)''');
      var matcher = [
            {
              'cid': 0,
              'name': 'local_messages_id',
              'type': 'INTEGER',
              'notnull': 0,
              'dflt_value': null,
              'pk': 1
            },
            {
              'cid': 1,
              'name': 'chat_id',
              'type': 'INTEGER',
              'notnull': 1,
              'dflt_value': null,
              'pk': 0
            },
            {
              'cid': 2,
              'name': 'created_date',
              'type': 'char(26)',
              'notnull': 1,
              'dflt_value': null,
              'pk': 0
            },
            {
              'cid': 3,
              'name': 'sender_id',
              'type': 'INTEGER',
              'notnull': 1,
              'dflt_value': null,
              'pk': 0
            },
            {
              'cid': 4,
              'name': 'message_id',
              'type': 'INTEGER',
              'notnull': 0,
              'dflt_value': null,
              'pk': 0
            },
            {
              'cid': 5,
              'name': 'is_read',
              'type': 'INTEGER',
              'notnull': 1,
              'dflt_value': '0',
              'pk': 0
            },
            {
              'cid': 6,
              'name': 'content',
              'type': 'char(50)',
              'notnull': 1,
              'dflt_value': null,
              'pk': 0
            },
            {
              'cid': 7,
              'name': 'updated_date',
              'type': 'char(26)',
              'notnull': 1,
              'dflt_value': null,
              'pk': 0
            },
            {
              'cid': 8,
              'name': 'deleted_date',
              'type': 'char(26)',
              'notnull': 0,
              'dflt_value': null,
              'pk': 0
            },
            {
              'cid': 9,
              'name': 'attachment_id',
              'type': 'INTEGER',
              'notnull': 0,
              'dflt_value': null,
              'pk': 0
            },
            {
              'cid': 10,
              'name': 'content_type',
              'type': 'TEXT',
              'notnull': 0,
              'dflt_value': null,
              'pk': 0
            }
          ];
      expect(r, matcher);
      db.close();
    });

    test('CREATE TABLE main_user', () async {
      databaseFactory.deleteDatabase('test');
      var db = await databaseFactory.openDatabase('test');
      await db.transaction((txn) async {
      await txn.execute('''
        CREATE TABLE ${DatabaseConst.mainUserTable}(
          ${DatabaseConst.mainUserColumnUserId} ${DatabaseConst.integer},
          ${DatabaseConst.mainUserColumnKey} ${DatabaseConst.char50},
          ${DatabaseConst.mainUserColumnDataSync} ${DatabaseConst.char26}
        )
        ''');
      });

      var r = await db.rawQuery('''PRAGMA table_info(main_user)''');
      var matcher = [
            {
              'cid': 0,
              'name': 'user_id',
              'type': 'INTEGER',
              'notnull': 0,
              'dflt_value': null,
              'pk': 0
            },
            {
              'cid': 1,
              'name': 'user_key',
              'type': 'char(50)',
              'notnull': 0,
              'dflt_value': null,
              'pk': 0
            },
            {
              'cid': 2,
              'name': 'date_sync',
              'type': 'char(26)',
              'notnull': 0,
              'dflt_value': null,
              'pk': 0
            }
          ];
      expect(r, matcher);
      db.close();
    });

    test('CREATE TABLE attachments', () async {
      databaseFactory.deleteDatabase('test');
      var db = await databaseFactory.openDatabase('test');
      await db.transaction((txn) async {
      await txn.execute('''
        CREATE TABLE ${DatabaseConst.attachmentsTable} 
        (
        ${DatabaseConst.attachmentsColumnAttachmentId} ${DatabaseConst.integer} ${DatabaseConst.primaryKey} ${DatabaseConst.autoincrement},
        ${DatabaseConst.attachmentsColumnAttachmentMeta} ${DatabaseConst.char4096} ${DatabaseConst.notNull}
      )
      ''');
      });

      var r = await db.rawQuery('''PRAGMA table_info(attachments)''');
      var matcher = [
            {
              'cid': 0,
              'name': 'attachment_id',
              'type': 'INTEGER',
              'notnull': 0,
              'dflt_value': null,
              'pk': 1
            },
            {
              'cid': 1,
              'name': 'attachment_meta',
              'type': 'char(4096)',
              'notnull': 1,
              'dflt_value': null,
              'pk': 0
            }
          ];
      expect(r, matcher);
      db.close();
    });
  });

  group('Local db: "CREATE INDEX" queries', () {
    setUp(() {
      sqfliteFfiInit();
      databaseFactory = databaseFactoryFfi;
    });
    test('CHATS_FK_3 ON chats id', () async {
      await databaseFactory.deleteDatabase('test');
      var db = await databaseFactory.openDatabase('test');
      await db.transaction((txn) async {
        await txn.execute('''
          CREATE TABLE ${DatabaseConst.chatsTable}(
            ${DatabaseConst.chatsColumnChatId} ${DatabaseConst.integer} ${DatabaseConst.primaryKey} ${DatabaseConst.autoincrement},
            ${DatabaseConst.chatsColumnUserId} ${DatabaseConst.integer} ${DatabaseConst.notNull} ${DatabaseConst.unique},
            ${DatabaseConst.chatsColumnCreatedDate} ${DatabaseConst.char26} ${DatabaseConst.notNull},
            ${DatabaseConst.chatsColumnUpdatedDate} ${DatabaseConst.char26},
            ${DatabaseConst.chatsColumnDeletedDate} ${DatabaseConst.char26},
            ${DatabaseConst.constraint} CHATS_FK_84 ${DatabaseConst.foreignKey} ( ${DatabaseConst.chatsColumnUserId} ) ${DatabaseConst.references} ${DatabaseConst.userTable} ( ${DatabaseConst.usersColumnUserId} )
          )
        ''');
        await txn.execute('''
          CREATE INDEX CHATS_FK_3 ON ${DatabaseConst.chatsTable}
          (
            ${DatabaseConst.chatsColumnUserId}
          )
        ''');
      });
      var r = await db.rawQuery('''
        SELECT * FROM sqlite_master WHERE (type = "index") and (name = "CHATS_FK_3")''');
      var matcher = [
            {
              'type': 'index',
              'name': 'CHATS_FK_3',
              'tbl_name': 'chats',
              'rootpage': 5,
              'sql': 'CREATE INDEX CHATS_FK_3 ON chats\n'
                '          (\n'
                '            user_id\n'
                '          )\n'
                '        '
            }
          ];
      expect(r, matcher);
      db.close();
    });

    test('MESSAGES_FK_2 ON messages id', () async {
      databaseFactory.deleteDatabase('test');
      var db = await databaseFactory.openDatabase('test');
      await db.transaction((txn) async {
        await txn.execute('''
          CREATE TABLE ${DatabaseConst.messageTable} (
            ${DatabaseConst.messagesColumnLocalMessagesId} ${DatabaseConst.integer} ${DatabaseConst.primaryKey} ${DatabaseConst.autoincrement},
            ${DatabaseConst.messagesColumnChatId} ${DatabaseConst.integer} ${DatabaseConst.notNull},
            ${DatabaseConst.messagesColumnCreatedDate} ${DatabaseConst.char26} ${DatabaseConst.notNull},
            ${DatabaseConst.messagesColumnSenderId} ${DatabaseConst.integer} ${DatabaseConst.notNull},
            ${DatabaseConst.messagesColumnMessageId} ${DatabaseConst.integer},
            ${DatabaseConst.messagesColumnIsRead} ${DatabaseConst.integer} ${DatabaseConst.notNull} DEFAULT 0,
            ${DatabaseConst.messagesColumnContent} ${DatabaseConst.char50} ${DatabaseConst.notNull},
            ${DatabaseConst.messagesColumnUpdatedDate} ${DatabaseConst.char26} ${DatabaseConst.notNull},
            ${DatabaseConst.messagesColumnDeletedDate} ${DatabaseConst.char26}, 
            ${DatabaseConst.messagesColumnAttachmentId} ${DatabaseConst.integer},
            ${DatabaseConst.messagesColumnContentType} ${DatabaseConst.text},
            ${DatabaseConst.constraint} MESSAGES_FK_79 ${DatabaseConst.foreignKey} ( ${DatabaseConst.messagesColumnChatId} ) ${DatabaseConst.references} ${DatabaseConst.chatsTable} ( ${DatabaseConst.chatsColumnChatId} ),

            ${DatabaseConst.constraint} MESSAGES_FK_80 ${DatabaseConst.foreignKey} ( ${DatabaseConst.messagesColumnSenderId} ) ${DatabaseConst.references} ${DatabaseConst.userTable} ( ${DatabaseConst.usersColumnUserId} ),

            ${DatabaseConst.constraint} MESSAGES_FK_81 ${DatabaseConst.foreignKey} ( ${DatabaseConst.messagesColumnAttachmentId} ) ${DatabaseConst.references} ${DatabaseConst.attachmentsTable} ( ${DatabaseConst.attachmentsColumnAttachmentId} ),

            CHECK ((is_read = 0) OR (is_read = 1)),
            CHECK (LENGTH(${DatabaseConst.messagesColumnCreatedDate}) = 26)
          )
          ''');
        await txn.execute('''
          CREATE INDEX MESSAGES_FK_2 ON ${DatabaseConst.messageTable}
          (
            ${DatabaseConst.chatsColumnChatId}  
          );
          ''');
      });
      var r = await db.rawQuery('''
        SELECT * FROM sqlite_master WHERE (type = "index") and (name = "MESSAGES_FK_2")''');
      var matcher = [
            {
              'type': 'index',
              'name': 'MESSAGES_FK_2',
              'tbl_name': 'messages',
              'rootpage': 4,
              'sql': 'CREATE INDEX MESSAGES_FK_2 ON messages\n'
                '          (\n'
                '            chat_id  \n'
                '          )'
            }
          ];
      expect(r, matcher);
      db.close();
    });

    test('MAIN_USER_FK_1 ON main_user id', () async {
      databaseFactory.deleteDatabase('test');
      var db = await databaseFactory.openDatabase('test');
      await db.transaction((txn) async {
        await txn.execute('''
          CREATE TABLE ${DatabaseConst.mainUserTable}(
            ${DatabaseConst.mainUserColumnUserId} ${DatabaseConst.integer},
            ${DatabaseConst.mainUserColumnKey} ${DatabaseConst.char50},
            ${DatabaseConst.mainUserColumnDataSync} ${DatabaseConst.char26}
          )
          ''');
        await txn.execute('''
          CREATE INDEX MAIN_USER_FK_1 ON ${DatabaseConst.mainUserTable}
          (
            ${DatabaseConst.usersColumnUserId}
          )
          ''');
      });
      var r = await db.rawQuery('''
        SELECT * FROM sqlite_master WHERE (type = "index") and (name = "MAIN_USER_FK_1")''');
      var matcher = [
            {
              'type': 'index',
              'name': 'MAIN_USER_FK_1',
              'tbl_name': 'main_user',
              'rootpage': 3,
              'sql': 'CREATE INDEX MAIN_USER_FK_1 ON main_user\n'
                '          (\n'
                '            user_id\n'
                '          )\n'
                '          '
            }
          ];
      expect(r, matcher);
      db.close();
    });

  });
}