import 'package:sqflite_common/sqlite_api.dart';

import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class DbServerServices {
  DbServerServices._();
  static final DbServerServices instanse = DbServerServices._();
  static Database? _database;

  ///Обращение к локальной БД извне
  Future<Database> get database async => _database ??= await openDatabase();

  Future<Database> openDatabase() async {
    sqfliteFfiInit();

    var databaseFactory = databaseFactoryFfi;
    var path = ".dart_tool/sqflite_common_ffi/databases/main_db.db";

    // var dbExists = await io.File(path).exists();

    return await databaseFactory.openDatabase(path,
        options: OpenDatabaseOptions(
          version: 1,
          onCreate: _createDatabase,
        ));
  }

  Future _createDatabase(Database db, int version) async {
    await db.transaction((txn) async {
      await txn.execute('''
          CREATE TABLE users
          (
          user_id     integer PRIMARY KEY AUTOINCREMENT,
          name              char(50) NOT NULL,
          email             char(50) NOT NULL,
          created_date      char(26) NOT NULL,
          profile_pic_url   char(50) NOT NULL,
          updated_date      char(26) NOT NULL,
          deleted_date      char(26),
          hash_connect      integer UNIQUE,
          password          char(4),
          CHECK (LENGTH(created_date) >= 26)
          )
        ''');

      await txn.execute('''
          CREATE TABLE chats
          (
          chat_id               integer PRIMARY KEY AUTOINCREMENT,
          friend1_id           integer NOT NULL,
          friend2_id           integer NOT NULL,
          created_date          char(26) NOT NULL,
          deleted_date           char(26),
          updated_date          char(26) NOT NULL,
          CONSTRAINT FRIENDS_CHAT_FK_77 FOREIGN KEY ( friend1_id ) REFERENCES users ( main_users_id ),
          CONSTRAINT FRIENDS_CHAT_FK_78 FOREIGN KEY ( friend2_id ) REFERENCES users ( main_users_id )
          )
        ''');

      await txn.execute('''
          CREATE TABLE messages
          (
          message_id       integer PRIMARY KEY AUTOINCREMENT,
          chat_id          integer NOT NULL,
          sender_id        integer NOT NULL,
          content          char(50) NOT NULL,
          created_date     char(26) NOT NULL,
          updated_date     char(26) NOT NULL,
          deleted_date     char(26), 
          attachment_id integer,      
          CONSTRAINT MESSAGES_FK_79 FOREIGN KEY ( chat_id ) REFERENCES chats ( chat_id ),
          CONSTRAINT MESSAGES_FK_80 FOREIGN KEY ( sender_id ) REFERENCES users ( user_id ),
          CONSTRAINT MESSAGES_FK_81 FOREIGN KEY ( attachment_id ) REFERENCES attachments ( attachment_id ),
          CHECK (LENGTH(created_date) >= 26)
          )
        ''');
      await txn.execute('''
          CREATE TABLE attachments 
          (
          attachment_id     integer PRIMARY KEY AUTOINCREMENT,
          attachment_meta   char(4096) NOT NULL
          )
      ''');

      await txn.execute('''
          CREATE INDEX FRIENDS_CHAT_FK_2 ON chats
          (
          friend1_id
          )
        ''');

      await txn.execute('''
          CREATE INDEX FRIENDS_CHAT_FK_3 ON chats
          (
          friend2_id
          )
        ''');

      await txn.execute('''
          CREATE INDEX MESSAGES_FK_2 ON messages
          (
          chat_id
          )
      ''');
      await txn.execute('''
          CREATE INDEX MESSAGES_FK_3 ON messages
          (
          sender_id
          )
      ''');
      await txn.execute('''
          INSERT INTO users (name, email, created_date, profile_pic_url, updated_date, deleted_date, password) VALUES ('test1', 't1@t1.t1', '2022-12-02T21:36:32.653712', 'https://music.mathwatha.com/wp-content/uploads/2017/08/tonyprofile-300x300.jpg', '2022-12-02T21:36:32.653712', '',  'pass')
      ''');
      await txn.execute('''
          INSERT INTO users (name, email, created_date, profile_pic_url, updated_date, deleted_date, password) VALUES ('test2', 't2@t2.t2', '2022-12-02T21:36:32.653712', 'https://faunistics.com/wp-content/uploads/2020/02/1-5-735x599.jpg', '2022-12-02T21:36:32.653712', '', 'pass')
      ''');
      await txn.execute('''
          INSERT INTO users (name, email, created_date, profile_pic_url, updated_date, deleted_date, password) VALUES ('test3', 't2@t2.t2', '2022-12-02T21:36:32.653712', 'https://faunistics.com/wp-content/uploads/2020/02/1-5-735x599.jpg', '2022-12-02T21:36:32.653712', '', 'pass')
      ''');
      await txn.execute('''
          INSERT INTO users (name, email, created_date, profile_pic_url, updated_date, deleted_date, password) VALUES ('test4', 't2@t2.t2', '2022-12-02T21:36:32.653712', 'https://faunistics.com/wp-content/uploads/2020/02/1-5-735x599.jpg', '2022-12-02T21:36:32.653712', '', 'pass')
      ''');
      await txn.execute('''
          INSERT INTO users (name, email, created_date, profile_pic_url, updated_date, deleted_date, password) VALUES ('test5', 't2@t2.t2', '2022-12-02T21:36:32.653712', 'https://faunistics.com/wp-content/uploads/2020/02/1-5-735x599.jpg', '2022-12-02T21:36:32.653712', '', 'pass')
      ''');
      await txn.execute('''
          INSERT INTO users (name, email, created_date, profile_pic_url, updated_date, deleted_date, password) VALUES ('test6', 't2@t2.t2', '2022-12-02T21:36:32.653712', 'https://faunistics.com/wp-content/uploads/2020/02/1-5-735x599.jpg', '2022-12-02T21:36:32.653712', '', 'pass')
      ''');
      await txn.execute('''
          INSERT INTO users (name, email, created_date, profile_pic_url, updated_date, deleted_date, password) VALUES ('test7', 't2@t2.t2', '2022-12-02T21:36:32.653712', 'https://faunistics.com/wp-content/uploads/2020/02/1-5-735x599.jpg', '2022-12-02T21:36:32.653712', '', 'pass')
      ''');
      await txn.execute('''
          INSERT INTO users (name, email, created_date, profile_pic_url, updated_date, deleted_date, password) VALUES ('test8', 't2@t2.t2', '2022-12-02T21:36:32.653712', 'https://faunistics.com/wp-content/uploads/2020/02/1-5-735x599.jpg', '2022-12-02T21:36:32.653712', '', 'pass')
      ''');
      await txn.execute('''
          INSERT INTO users (name, email, created_date, profile_pic_url, updated_date, deleted_date, password) VALUES ('test9', 't2@t2.t2', '2022-12-02T21:36:32.653712', 'https://faunistics.com/wp-content/uploads/2020/02/1-5-735x599.jpg', '2022-12-02T21:36:32.653712', '', 'pass')
      ''');
      await txn.execute('''
          INSERT INTO users (name, email, created_date, profile_pic_url, updated_date, deleted_date, password) VALUES ('test10', 't2@t2.t2', '2022-12-02T21:36:32.653712', 'https://faunistics.com/wp-content/uploads/2020/02/1-5-735x599.jpg', '2022-12-02T21:36:32.653712', '', 'pass')
      ''');
      await txn.execute('''
          INSERT INTO users (name, email, created_date, profile_pic_url, updated_date, deleted_date, password) VALUES ('test11', 't2@t2.t2', '2022-12-02T21:36:32.653712', 'https://faunistics.com/wp-content/uploads/2020/02/1-5-735x599.jpg', '2022-12-02T21:36:32.653712', '', 'pass')
      ''');
      await txn.execute('''
          INSERT INTO users (name, email, created_date, profile_pic_url, updated_date, deleted_date, password) VALUES ('test12', 't2@t2.t2', '2022-12-02T21:36:32.653712', 'https://faunistics.com/wp-content/uploads/2020/02/1-5-735x599.jpg', '2022-12-02T21:36:32.653712', '', 'pass')
      ''');

      await txn.insert('chats', {
        'friend1_id': 1,
        'friend2_id': 2,
        'created_date': '2022-12-02T21:36:32.653712',
        'deleted_date': '',
        'updated_date': '2022-11-02T21:36:32.653712'
      });
      //       await txn.insert('chats', {
      //   'friend1_id': 1,
      //   'friend2_id': 3,
      //   'created_date': '2022-12-02T21:36:32.653712',
      //   'deleted_date': '',
      //   'updated_date': '2022-12-04T21:36:32.653712'
      // });
      //       await txn.insert('chats', {
      //   'friend1_id': 1,
      //   'friend2_id': 4,
      //   'created_date': '2022-12-02T21:36:32.653712',
      //   'deleted_date': '',
      //   'updated_date': '2022-10-02T21:36:32.653712'
      // });
      //       await txn.insert('chats', {
      //   'friend1_id': 1,
      //   'friend2_id': 5,
      //   'created_date': '2022-12-02T21:36:32.653712',
      //   'deleted_date': '',
      //   'updated_date': '2022-12-05T21:36:32.653712'
      // });
      //       await txn.insert('chats', {
      //   'friend1_id': 1,
      //   'friend2_id': 6,
      //   'created_date': '2022-12-02T21:36:32.653712',
      //   'deleted_date': '',
      //   'updated_date': '2022-12-02T21:36:32.653712'
      // });
      //       await txn.insert('chats', {
      //   'friend1_id': 1,
      //   'friend2_id': 7,
      //   'created_date': '2022-12-02T21:36:32.653712',
      //   'deleted_date': '',
      //   'updated_date': '2022-12-02T21:36:32.653712'
      // });
      //       await txn.insert('chats', {
      //   'friend1_id': 1,
      //   'friend2_id': 8,
      //   'created_date': '2022-12-02T21:36:32.653712',
      //   'deleted_date': '',
      //   'updated_date': '2022-12-02T21:36:32.653712'
      // });
      //       await txn.insert('chats', {
      //   'friend1_id': 1,
      //   'friend2_id': 9,
      //   'created_date': '2022-12-02T21:36:32.653712',
      //   'deleted_date': '',
      //   'updated_date': '2022-12-02T21:36:32.653712'
      // });
      //       await txn.insert('chats', {
      //   'friend1_id': 1,
      //   'friend2_id': 10,
      //   'created_date': '2022-12-02T21:36:32.653712',
      //   'deleted_date': '',
      //   'updated_date': '2022-12-02T21:36:32.653712'
      // });
      // await txn.insert('chats', {
      //   'friend1_id': 1,
      //   'friend2_id': 11,
      //   'created_date': '2022-12-02T21:36:32.653712',
      //   'deleted_date': '',
      //   'updated_date': DateTime.now().toIso8601String(),
      // });
      // await txn.insert('chats', {
      //   'friend1_id': 1,
      //   'friend2_id': 12,
      //   'created_date': DateTime.now().toIso8601String(),
      //   'deleted_date': '',
      //   'updated_date': DateTime.now().toIso8601String(),
      // });

      await txn.insert('messages', {
        'chat_id': 1,
        'sender_id': 1,
        'content': 'Hello1',
        'created_date': DateTime.now().toIso8601String(),
        'updated_date': DateTime.now().toIso8601String(),
        'deleted_date': '',
      });
      //       await txn.insert('messages', {
      //   'chat_id': 2,
      //   'sender_id': 1,
      //   'content': 'Hello1',
      //   'created_date': DateTime.now().toIso8601String(),
      //   'updated_date': DateTime.now().toIso8601String(),
      //   'deleted_date': '',
      // });
      //       await txn.insert('messages', {
      //   'chat_id': 3,
      //   'sender_id': 1,
      //   'content': 'Hello1',
      //   'created_date': DateTime.now().toIso8601String(),
      //   'updated_date': DateTime.now().toIso8601String(),
      //   'deleted_date': '',
      // });
      //       await txn.insert('messages', {
      //   'chat_id': 4,
      //   'sender_id': 1,
      //   'content': 'Hello1',
      //   'created_date': DateTime.now().toIso8601String(),
      //   'updated_date': DateTime.now().toIso8601String(),
      //   'deleted_date': '',
      // });
      //       await txn.insert('messages', {
      //   'chat_id': 5,
      //   'sender_id': 1,
      //   'content': 'Hello1',
      //   'created_date': DateTime.now().toIso8601String(),
      //   'updated_date': DateTime.now().toIso8601String(),
      //   'deleted_date': '',
      // });
      //       await txn.insert('messages', {
      //   'chat_id': 6,
      //   'sender_id': 1,
      //   'content': 'Hello1',
      //   'created_date': DateTime.now().toIso8601String(),
      //   'updated_date': DateTime.now().toIso8601String(),
      //   'deleted_date': '',
      // });
      //       await txn.insert('messages', {
      //   'chat_id': 7,
      //   'sender_id': 1,
      //   'content': 'Hello1',
      //   'created_date': DateTime.now().toIso8601String(),
      //   'updated_date': DateTime.now().toIso8601String(),
      //   'deleted_date': '',
      // });
      //       await txn.insert('messages', {
      //   'chat_id': 8,
      //   'sender_id': 1,
      //   'content': 'Hello1',
      //   'created_date': DateTime.now().toIso8601String(),
      //   'updated_date': DateTime.now().toIso8601String(),
      //   'deleted_date': '',
      // });
      // await txn.insert('messages', {
      //   'chat_id': 8,
      //   'sender_id': 2,
      //   'content': 'Hello2',
      //   'created_date': DateTime.now().toIso8601String(),
      //   'updated_date': DateTime.now().toIso8601String(),
      //   'deleted_date': '',
      // });
    });
  }
}
