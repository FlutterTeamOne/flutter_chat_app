import 'package:flutter_chat_app/domain/model/friends_chat.dart';
import 'package:flutter_chat_app/domain/model/messages.dart';
import 'package:flutter_chat_app/storage_manager/database_const.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:sqflite/sqflite.dart';

Future main() async {
  setUpAll(() {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  });

  test('Unit test init and read sql', () async {
    var db = await openDatabase(inMemoryDatabasePath, version: 1,
        onCreate: (db, version) async {
      await db.transaction((txn) async {
        await txn.execute(
            'CREATE TABLE User (id INTEGER PRIMARY KEY AUTOINCREMENT, name char(50) NOT NULL)');

        await txn.execute('''
CREATE TABLE ${Messages.table} (
 ${DatabaseConst.columnId} INTEGER PRIMARY KEY AUTOINCREMENT,
 ${DatabaseConst.columnFriendsChatId} INTEGER NOT NULL,
 ${DatabaseConst.columnRecieverId} INTEGER NOT NULL,
 ${DatabaseConst.columnSenderId} INTEGER NOT NULL,
 ${DatabaseConst.columnContent} char(50) NOT NULL,
 CONSTRAINT MESSAGES_FK_79 FOREIGN KEY ( friends_chat_id ) REFERENCES friends_chat ( "id" ),
 CONSTRAINT MESSAGES_FK_80 FOREIGN KEY ( sender_id ) REFERENCES users ( "id" ),
 CONSTRAINT MESSAGES_FK_82 FOREIGN KEY ( reciever_id ) REFERENCES users ( "id" )
)
''');


        await txn.execute('''
CREATE TABLE ${FriendsChat.table}(
 ${DatabaseConst.columnId} INTEGER PRIMARY KEY AUTOINCREMENT,
 ${DatabaseConst.columnFirstFriendId} INTEGER NOT NULL,
 ${DatabaseConst.columnSecondFriendId} INTEGER NOT NULL,
 CONSTRAINT FRIENDS_CHAT_FK_77 FOREIGN KEY ( friend1_id ) REFERENCES users ( "id" ),
 CONSTRAINT FRIENDS_CHAT_FK_78 FOREIGN KEY ( friend2_id ) REFERENCES users ( "id" )
)
''');
      });
    });
    await db.insert('User', {'name': 'Bob'});
    await db.insert(Messages.table, {
      DatabaseConst.columnFriendsChatId: 1,
      DatabaseConst.columnRecieverId: 1,
      DatabaseConst.columnSenderId:1,
      DatabaseConst.columnContent:'some chat message'
    });
    await db.insert(FriendsChat.table, {
      DatabaseConst.columnFirstFriendId:1,
      DatabaseConst.columnSecondFriendId:2,
    });

    expect(await db.query('User'), [
      {'id': 1, 'name': 'Bob'}
    ]);
    expect(await db.query('messages'), [
      {'id': 1, 'friends_chat_id': 1,'reciever_id':1,'sender_id':1,'content':'some chat message'}
    ]);
    expect(await db.query('friends_chat'), [
      {'id': 1, 'friend1_id': 1,'friend2_id':2}
    ]);

    await db.close();
  });
}
