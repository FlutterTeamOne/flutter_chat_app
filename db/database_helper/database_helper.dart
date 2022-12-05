import 'package:sqflite_common/sqlite_api.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

Future main() async {
  // Init ffi loader if needed.
  sqfliteFfiInit();

  var databaseFactory = databaseFactoryFfi;
  var db = await databaseFactory.openDatabase(inMemoryDatabasePath);
  await db.execute('''
CREATE TABLE users
(
 id integer PRIMARY KEY AUTOINCREMENT,
 name char(50) NOT NULL
);
''');

  await db.execute('''
CREATE TABLE friends_chat
(
 id integer PRIMARY KEY AUTOINCREMENT,
 friend1_id integer NOT NULL,
 friend2_id integer NOT NULL,
 CONSTRAINT FRIENDS_CHAT_FK_77 FOREIGN KEY ( friend1_id ) REFERENCES users ( "id" ),
 CONSTRAINT FRIENDS_CHAT_FK_78 FOREIGN KEY ( friend2_id ) REFERENCES users ( "id" )
);
''');

    await db.execute('''
CREATE TABLE messages
(
 id              integer PRIMARY KEY AUTOINCREMENT,
 friends_chat_id integer NOT NULL,
 reciever_id     integer NOT NULL,
 sender_id       integer NOT NULL,
 content         char(50) NOT NULL,
 CONSTRAINT MESSAGES_FK_79 FOREIGN KEY ( friends_chat_id ) REFERENCES friends_chat ( "id" ),
 CONSTRAINT MESSAGES_FK_80 FOREIGN KEY ( sender_id ) REFERENCES users ( "id" ),
 CONSTRAINT MESSAGES_FK_82 FOREIGN KEY ( reciever_id ) REFERENCES users ( "id" )
);
''');
  await db.execute('''
INSERT INTO users (name) VALUES ("John Doe");
''');
  await db.execute('''
INSERT INTO users (name) VALUES ("Jane Doe");
''');
  await db.execute('''
INSERT INTO users (name) VALUES ("James Doe");
''');

  await db.execute('''
INSERT INTO friends_chat (friend1_id, friend2_id) VALUES(
	(SELECT id FROM users WHERE (name = "John Doe")),
  	(SELECT id FROM users WHERE (name = "Jane Doe"))
);
''');
  await db.execute('''
INSERT INTO friends_chat (friend1_id, friend2_id) VALUES(
	(SELECT id FROM users WHERE (name = "John Doe")),
  	(SELECT id FROM users WHERE (name = "James Doe"))
);
''');

  var friendsChat1 = await db.rawQuery('SELECT id From friends_chat WHERE ((friend1_id = 1) AND (friend2_id = 2))');
  var friendsChat2 = await db.rawQuery('SELECT id From friends_chat WHERE ((friend1_id = 1) AND (friend2_id = 3))');
  var friendsChatMap1 = friendsChat1[0];
  var friendsChatMap2 = friendsChat2[0];

  await db.execute('''
INSERT INTO messages (friends_chat_id, reciever_id, sender_id, content) VALUES(
	  ${friendsChatMap1['id']},
  	2,
  	3,
  	"hi"
);
''');
  await db.execute('''
INSERT INTO messages (friends_chat_id, reciever_id, sender_id, content) VALUES(
    ${friendsChatMap1['id']},
  	2,
  	3,
  	"how are you?"
);
''');

  await db.execute('''
INSERT INTO messages (friends_chat_id, reciever_id, sender_id, content) VALUES(
    ${friendsChatMap1['id']},
  	3,
  	2,
  	"fine"
);
''');
  await db.execute('''
INSERT INTO messages (friends_chat_id, reciever_id, sender_id, content) VALUES(
	  ${friendsChatMap2['id']},
  	3,
  	2,
  	"hi there!"
);
''');

  var users = await db.query('users');
  var friend_chats = await db.query('friends_chat');
  var messages = await db.query('messages');

  print('users: $users');
  print('friend_chats: $friend_chats');
  print('messages: $messages');

  await db.close();
}