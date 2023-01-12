import 'package:server/src/db_server/services/database_impl.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common/sqlite_api.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:test/test.dart';

Future main() async {
  group("Main db: creating tables:", () {
    test('"users" table created', () async {
      Database db = await DbServerServices.instanse.database;
      var r = await db.rawQuery(
          '''SELECT name FROM sqlite_master WHERE type='table' AND name='users';''');

      expect(r, [
        {'name': 'users'}
      ]);
    });

    test('"messages" table created', () async {
      Database db = await DbServerServices.instanse.database;

      var r = await db.rawQuery(
          '''SELECT name FROM sqlite_master WHERE type='table' AND name='messages';''');

      expect(r, [
        {'name': 'messages'}
      ]);
    });

    test('"chats" table created', () async {
      Database db = await DbServerServices.instanse.database;

      var r = await db.rawQuery(
          '''SELECT name FROM sqlite_master WHERE type='table' AND name='chats';''');

      expect(r, [
        {'name': 'chats'}
      ]);
    });
    test('"attachments" table created', () async {
      Database db = await DbServerServices.instanse.database;

      var r = await db.rawQuery(
          '''SELECT name FROM sqlite_master WHERE type='table' AND name='attachments';''');

      expect(r, [
        {'name': 'attachments'}
      ]);
    });

    group('Main db: "CREATE TABLE" queries:', () {
      setUp(() {
        sqfliteFfiInit();
        databaseFactory = databaseFactoryFfi;
      });
      test('CREATE TABLE users', () async {
        databaseFactory.deleteDatabase('test');
        var db = await databaseFactory.openDatabase('test');
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
        });

        var r = await db.rawQuery('''PRAGMA table_info(users)''');
        var matcher = [
          {
            'cid': 0,
            'name': 'user_id',
            'type': 'integer',
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
            'name': 'created_date',
            'type': 'char(26)',
            'notnull': 1,
            'dflt_value': null,
            'pk': 0
          },
          {
            'cid': 4,
            'name': 'profile_pic_url',
            'type': 'char(50)',
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
          },
          {
            'cid': 7,
            'name': 'hash_connect',
            'type': 'integer',
            'notnull': 0,
            'dflt_value': null,
            'pk': 0
          },
          {
            'cid': 8,
            'name': 'password',
            'type': 'char(4)',
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
        });

        var r = await db.rawQuery('''PRAGMA table_info(chats)''');
        var matcher = [
          {
            'cid': 0,
            'name': 'chat_id',
            'type': 'integer',
            'notnull': 0,
            'dflt_value': null,
            'pk': 1
          },
          {
            'cid': 1,
            'name': 'friend1_id',
            'type': 'integer',
            'notnull': 1,
            'dflt_value': null,
            'pk': 0
          },
          {
            'cid': 2,
            'name': 'friend2_id',
            'type': 'integer',
            'notnull': 1,
            'dflt_value': null,
            'pk': 0
          },
          {
            'cid': 3,
            'name': 'created_date',
            'type': 'char(26)',
            'notnull': 1,
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
          },
          {
            'cid': 5,
            'name': 'updated_date',
            'type': 'char(26)',
            'notnull': 1,
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
          content_type TEXT,     
          CONSTRAINT MESSAGES_FK_79 FOREIGN KEY ( chat_id ) REFERENCES chats ( chat_id ),
          CONSTRAINT MESSAGES_FK_80 FOREIGN KEY ( sender_id ) REFERENCES users ( user_id ),
          CONSTRAINT MESSAGES_FK_81 FOREIGN KEY ( attachment_id ) REFERENCES attachments ( attachment_id ),
          CHECK (LENGTH(created_date) >= 26)
          )
        ''');
        });

        var r = await db.rawQuery('''PRAGMA table_info(messages)''');
        var matcher = [
          {
            'cid': 0,
            'name': 'message_id',
            'type': 'integer',
            'notnull': 0,
            'dflt_value': null,
            'pk': 1
          },
          {
            'cid': 1,
            'name': 'chat_id',
            'type': 'integer',
            'notnull': 1,
            'dflt_value': null,
            'pk': 0
          },
          {
            'cid': 2,
            'name': 'sender_id',
            'type': 'integer',
            'notnull': 1,
            'dflt_value': null,
            'pk': 0
          },
          {
            'cid': 3,
            'name': 'content',
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
          },
          {
            'cid': 7,
            'name': 'attachment_id',
            'type': 'integer',
            'notnull': 0,
            'dflt_value': null,
            'pk': 0
          },
          {
            'cid': 8,
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

      test('CREATE TABLE attachments', () async {
        databaseFactory.deleteDatabase('test');
        var db = await databaseFactory.openDatabase('test');
        await db.transaction((txn) async {
          await txn.execute('''
          CREATE TABLE attachments 
          (
          attachment_id     integer PRIMARY KEY AUTOINCREMENT,
          attachment_meta   char(4096) NOT NULL
          )
      ''');
        });

        var r = await db.rawQuery('''PRAGMA table_info(attachments)''');
        var matcher = [
          {
            'cid': 0,
            'name': 'attachment_id',
            'type': 'integer',
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
      test('FRIENDS_CHAT_FK_2 ON chats friend1_id', () async {
        await databaseFactory.deleteDatabase('test');
        var db = await databaseFactory.openDatabase('test');
        await db.transaction((txn) async {
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
          CREATE INDEX FRIENDS_CHAT_FK_2 ON chats
          (
          friend1_id
          )
        ''');
        });
        var r = await db.rawQuery('''
          SELECT * FROM sqlite_master WHERE (type = "index") and (name = "FRIENDS_CHAT_FK_2")''');
        var matcher = [
          {
            'type': 'index',
            'name': 'FRIENDS_CHAT_FK_2',
            'tbl_name': 'chats',
            'rootpage': 4,
            'sql': 'CREATE INDEX FRIENDS_CHAT_FK_2 ON chats\n'
                '          (\n'
                '          friend1_id\n'
                '          )\n'
                '        '
          }
        ];
        expect(r, matcher);
        db.close();
      });

      test('FRIENDS_CHAT_FK_3 ON chats friend2_id', () async {
        await databaseFactory.deleteDatabase('test');
        var db = await databaseFactory.openDatabase('test');
        await db.transaction((txn) async {
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
          CREATE INDEX FRIENDS_CHAT_FK_3 ON chats
          (
          friend2_id
          )
        ''');
        });
        var r = await db.rawQuery('''
          SELECT * FROM sqlite_master WHERE (type = "index") and (name = "FRIENDS_CHAT_FK_3")''');
        var matcher = [
          {
            'type': 'index',
            'name': 'FRIENDS_CHAT_FK_3',
            'tbl_name': 'chats',
            'rootpage': 4,
            'sql': 'CREATE INDEX FRIENDS_CHAT_FK_3 ON chats\n'
                '          (\n'
                '          friend2_id\n'
                '          )\n'
                '        '
          }
        ];
        expect(r, matcher);
        db.close();
      });

      test('MESSAGES_FK_2 ON messages chat_id', () async {
        databaseFactory.deleteDatabase('test');
        var db = await databaseFactory.openDatabase('test');
        await db.transaction((txn) async {
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
          content_type TEXT,     
          CONSTRAINT MESSAGES_FK_79 FOREIGN KEY ( chat_id ) REFERENCES chats ( chat_id ),
          CONSTRAINT MESSAGES_FK_80 FOREIGN KEY ( sender_id ) REFERENCES users ( user_id ),
          CONSTRAINT MESSAGES_FK_81 FOREIGN KEY ( attachment_id ) REFERENCES attachments ( attachment_id ),
          CHECK (LENGTH(created_date) >= 26)
          )
        ''');
          await txn.execute('''
          CREATE INDEX MESSAGES_FK_2 ON messages
          (
          chat_id
          )
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
                '          chat_id\n'
                '          )\n'
                '      '
          }
        ];
        expect(r, matcher);
        db.close();
      });

      test('MESSAGES_FK_3 ON messages sender_id', () async {
        databaseFactory.deleteDatabase('test');
        var db = await databaseFactory.openDatabase('test');
        await db.transaction((txn) async {
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
            content_type TEXT,     
            CONSTRAINT MESSAGES_FK_79 FOREIGN KEY ( chat_id ) REFERENCES chats ( chat_id ),
            CONSTRAINT MESSAGES_FK_80 FOREIGN KEY ( sender_id ) REFERENCES users ( user_id ),
            CONSTRAINT MESSAGES_FK_81 FOREIGN KEY ( attachment_id ) REFERENCES attachments ( attachment_id ),
            CHECK (LENGTH(created_date) >= 26)
            )
          ''');
          await txn.execute('''
            CREATE INDEX MESSAGES_FK_3 ON messages
            (
            sender_id
            )
        ''');
        });
        var r = await db.rawQuery('''
        SELECT * FROM sqlite_master WHERE (type = "index") and (name = "MESSAGES_FK_3")''');
        var matcher = [
          {
            'type': 'index',
            'name': 'MESSAGES_FK_3',
            'tbl_name': 'messages',
            'rootpage': 4,
            'sql': 'CREATE INDEX MESSAGES_FK_3 ON messages\n'
                '            (\n'
                '            sender_id\n'
                '            )\n'
                '        '
          }
        ];
        expect(r, matcher);
        db.close();
      });
    });
  });
}
