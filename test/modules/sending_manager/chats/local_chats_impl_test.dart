// ignore_for_file: unused_local_variable

import 'package:chat_app/modules/storage_manager/db_helper/user_path.dart';
import 'package:chat_app/src/libraries/library_all.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  group('Local db: LocalChatsServices CRUD', () {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
    var user = UserDto(
        name: 'LocalChatsServices',
        email: 'LocalChatsServices@test',
        createdDate: 'createdDate',
        profilePicLink: 'profilePicLink',
        updatedDate: 'updatedDate');
    UserPath.user = user;

    test('createChat - takes ChatDto, returns List<UserDto>', () async {
      await DBHelper.instanse.initDB();
      var db = await DBHelper.instanse.database;
      await db.delete('chats');

      var date = '2023-01-08T00:41:21.267124';

      var r = await LocalChatServices()
          .createChat(createDate: date, userId: 1, chatId: 1);

      var id = (await db.rawQuery('''SELECT last_insert_rowid()'''))[0]
          ['last_insert_rowid()'] as int;

      var matcher = [
        ChatDto(
            chatId: id,
            userIdChat: 1,
            createdDate: date,
            updatedDate: date,
            deletedDate: '')
      ];

      expect(r, matcher);
      await DBHelper.instanse.deleteDB(db.path);
    });

    test('deleteChat - returns number of deleted rows', () async {
      await DBHelper.instanse.initDB();
      var db = await DBHelper.instanse.database;
      await db.delete('chats');

      var insert = await db.rawQuery('''
        INSERT INTO chats 
          (user_id, created_date, update_date)
        VALUES
      (1, '2023-01-08T00:41:21.267124', '2023-01-08T00:41:21.267124')''');

      var id = (await db.rawQuery('''SELECT last_insert_rowid()'''))[0]
          ['last_insert_rowid()'] as int;

      var r = await LocalChatServices().deleteChat(id: id);
      var matcher = 1;

      expect(r, matcher);
      await DBHelper.instanse.deleteDB(db.path);
    });

    test('deleteChat - deletes a row', () async {
      await DBHelper.instanse.initDB();
      var db = await DBHelper.instanse.database;
      await db.delete('chats');

      var insert = await db.rawQuery('''
        INSERT INTO chats 
          (user_id, created_date, update_date)
        VALUES
      (1, '2023-01-08T00:41:21.267124', '2023-01-08T00:41:21.267124')''');

      var id = (await db.rawQuery('''SELECT last_insert_rowid()'''))[0]
          ['last_insert_rowid()'] as int;

      await LocalChatServices().deleteChat(id: id);

      var r = await db.rawQuery('''SELECT * FROM chats WHERE chat_id = $id''');
      var matcher = [];

      expect(r, matcher);
      await DBHelper.instanse.deleteDB(db.path);
    });

    test('getAllChats', () async {
      await DBHelper.instanse.initDB();
      var db = await DBHelper.instanse.database;
      await db.delete('chats');

      var insert = await db.rawQuery('''
        INSERT INTO chats 
          (user_id, created_date, update_date)
        VALUES
      (1, '2023-01-08T00:41:21.267124', '2023-01-08T00:41:21.267124')''');

      var id = (await db.rawQuery('''SELECT last_insert_rowid()'''))[0]
          ['last_insert_rowid()'] as int;

      var date = '2023-01-08T00:41:21.267124';
      var chat = ChatDto(
          chatId: id,
          userIdChat: 1,
          createdDate: date,
          updatedDate: date,
          deletedDate: '');

      var r = await LocalChatServices().getAllChats();
      var matcher = [chat];

      expect(r, matcher);
      await DBHelper.instanse.deleteDB(db.path);
    });

    test('getAllChatsSortedByUpdatedDate', () async {
      await DBHelper.instanse.initDB();
      var db = await DBHelper.instanse.database;
      await db.delete('chats');

      await db.rawQuery('''
        INSERT INTO chats 
          (user_id, created_date, update_date)
        VALUES
      (1, '2023-01-08T00:41:21.267124', '2023-01-08T00:41:21.267124')''');
      await db.rawQuery('''
        INSERT INTO chats 
          (user_id, created_date, update_date)
        VALUES
      (2, '2023-01-08T00:41:21.267124', '2024-01-08T00:41:21.267124')''');

      var id = (await db.rawQuery('''SELECT last_insert_rowid()'''))[0]
          ['last_insert_rowid()'] as int;

      var r = await LocalChatServices().getAllChatsSortedByUpdatedDate();

      var matcher = [
        ChatDto(
            chatId: id,
            userIdChat: 2,
            createdDate: '2023-01-08T00:41:21.267124',
            updatedDate: '2024-01-08T00:41:21.267124',
            deletedDate: ''),
        ChatDto(
            chatId: id - 1,
            userIdChat: 1,
            createdDate: '2023-01-08T00:41:21.267124',
            updatedDate: '2023-01-08T00:41:21.267124',
            deletedDate: '')
      ];

      expect(r, matcher);
      await DBHelper.instanse.deleteDB(db.path);
    });

    test('getChatById', () async {
      await DBHelper.instanse.initDB();
      var db = await DBHelper.instanse.database;
      await db.delete('chats');

      var insert = await db.rawQuery('''
        INSERT INTO chats 
          (user_id, created_date, update_date)
        VALUES
      (1, '2023-01-08T00:41:21.267124', '2023-01-08T00:41:21.267124')''');

      var id = (await db.rawQuery('''SELECT last_insert_rowid()'''))[0]
          ['last_insert_rowid()'] as int;

      var date = '2023-01-08T00:41:21.267124';

      var r = await LocalChatServices().getChatById(id: id);
      var matcher = {
        'chat_id': id,
        'user_id': 1,
        'created_date': date,
        'update_date': date,
        'deleted_date': null
      };

      expect(r, matcher);
      await DBHelper.instanse.deleteDB(db.path);
    });

    test('getMainIdChatByMessage', () async {
      await DBHelper.instanse.initDB();
      var db = await DBHelper.instanse.database;
      await db.delete('chats');

      var insert = await db.rawQuery('''
        INSERT INTO chats 
          (user_id, created_date, update_date)
        VALUES
      (1, '2023-01-08T00:41:21.267124', '2023-01-08T00:41:21.267124')''');

      var id = (await db.rawQuery('''SELECT last_insert_rowid()'''))[0]
          ['last_insert_rowid()'] as int;

      var date = '2023-01-08T00:41:21.267124';

      var r = await LocalChatServices().getMainIdChatByMessage(localId: id);
      var matcher = id;

      expect(r, matcher);
      await DBHelper.instanse.deleteDB(db.path);
    });

    test('updateChatDateUpdated"', () async {
      await DBHelper.instanse.initDB();
      var db = await DBHelper.instanse.database;
      await db.delete('chats');

      var insert = await db.rawQuery('''
        INSERT INTO chats 
          (user_id, created_date, update_date)
        VALUES
      (1, '2023-01-08T00:41:21.267124', '2023-01-08T00:41:21.267124')''');

      var id = (await db.rawQuery('''SELECT last_insert_rowid()'''))[0]
          ['last_insert_rowid()'] as int;

      await LocalChatServices().updateChatDateUpdated(
          chatId: id, dateUpdated: '2023-01-010T00:41:21.267124');

      var r = (await db.rawQuery(
              '''SELECT update_date FROM chats WHERE chat_id = $id'''))[0]
          ['update_date'];
      var matcher = '2023-01-010T00:41:21.267124';

      expect(r, matcher);
      await DBHelper.instanse.deleteDB(db.path);
    });

    test('getMaxId', () async {
      await DBHelper.instanse.initDB();
      var db = await DBHelper.instanse.database;
      await db.delete('chats');

      var insert = await db.rawQuery('''
        INSERT INTO chats 
          (user_id, created_date, update_date)
        VALUES
      (1, '2023-01-08T00:41:21.267124', '2023-01-08T00:41:21.267124')''');

      var id = (await db.rawQuery('''SELECT last_insert_rowid()'''))[0]
          ['last_insert_rowid()'] as int;

      var r = await LocalChatServices().getMaxId();
      var matcher = id;

      expect(r, matcher);
      await DBHelper.instanse.deleteDB(db.path);
    });
  });
}
