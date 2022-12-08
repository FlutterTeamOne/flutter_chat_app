import 'package:server_bd/src/db_server/database_helper/library_db.dart';
import "dart:io" as io;

class DbServerServices implements IDbServerServices {
  @override
  Future<Database> openDatabase() async {
    sqfliteFfiInit();

    var databaseFactory = databaseFactoryFfi;
    var path = ".dart_tool/sqflite_common_ffi/databases/main_db.db";

    var dbExists = await io.File(path).exists();

    if(!dbExists) {
      createDatabase();
      return await databaseFactory.openDatabase('main_db.db');
    }
    return await databaseFactory.openDatabase('main_db.db');
  }

  Future createDatabase() async {
    sqfliteFfiInit();

    var databaseFactory = databaseFactoryFfi;

    var db = await databaseFactory.openDatabase('main_db.db');
    await db.transaction((txn) async {
      await txn.execute('''
          CREATE TABLE users
          (
          main_users_id     integer PRIMARY KEY AUTOINCREMENT,
          name              char(50) NOT NULL,
          email             char(50) NOT NULL,
          registration_date char(26) NOT NULL,
          profile_pic_url   char(50) NOT NULL,
          CHECK (LENGTH(registration_date) >= 26)
          );
        ''');

      await txn.execute('''
          CREATE TABLE friends_chat
          (
          main_friends_chat_id integer PRIMARY KEY AUTOINCREMENT,
          friend1_id           integer NOT NULL,
          friend2_id           integer NOT NULL,
          CONSTRAINT FRIENDS_CHAT_FK_77 FOREIGN KEY ( friend1_id ) REFERENCES users ( main_users_id ),
          CONSTRAINT FRIENDS_CHAT_FK_78 FOREIGN KEY ( friend2_id ) REFERENCES users ( main_users_id )
          );
        ''');

      await txn.execute('''
          CREATE TABLE messages
          (
          main_messages_id integer PRIMARY KEY AUTOINCREMENT,
          friends_chat_id  integer NOT NULL,
          sender_id        integer NOT NULL,
          content          char(50) NOT NULL,
          date            char(26) NOT NULL,
          CONSTRAINT MESSAGES_FK_79 FOREIGN KEY ( friends_chat_id ) REFERENCES friends_chat ( main_friends_chat_id ),
          CONSTRAINT MESSAGES_FK_80 FOREIGN KEY ( sender_id ) REFERENCES users ( main_users_id ),
          CHECK (LENGTH(date) >= 26)
          );
        ''');

      await txn.execute('''
          CREATE INDEX FRIENDS_CHAT_FK_2 ON friends_chat
          (
          friend1_id
          );
        ''');

      await txn.execute('''
          CREATE INDEX FRIENDS_CHAT_FK_3 ON friends_chat
          (
          friend2_id
          )
        ''');

      await txn.execute('''
          CREATE INDEX MESSAGES_FK_2 ON messages
          (
          friends_chat_id
          );
      ''');
      await txn.execute('''
          CREATE INDEX MESSAGES_FK_3 ON messages
          (
          sender_id
          );
      ''');
      await txn.execute('''
          INSERT INTO users (name, email, registration_date, profile_pic_url) VALUES ('test1', 't1@t1.t1', 'https://music.mathwatha.com/wp-content/uploads/2017/08/tonyprofile-300x300.jpg', '2022-12-02T21:36:32.653712')
      ''');
      await txn.execute('''
          INSERT INTO users (name, email, registration_date, profile_pic_url) VALUES ('test2', 't2@t2.t2', 'https://music.mathwatha.com/wp-content/uploads/2017/08/tonyprofile-300x300.jpg', '2022-12-02T21:36:32.653712')
      ''');
      await txn.execute('''
          INSERT INTO friends_chat (friend1_id, friend2_id) VALUES (1, 2)
      ''');  
    });
  }
}
