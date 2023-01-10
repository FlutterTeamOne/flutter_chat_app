import 'package:chat_app/domain/data/dto/attach_dto/attach_dto.dart';
import 'package:chat_app/domain/data/dto/user_dto/user_dto.dart';
import 'package:chat_app/modules/storage_manager/db_helper/db_helper.dart';
import 'package:chat_app/modules/storage_manager/db_helper/db_helper_start.dart';
import 'package:chat_app/modules/storage_manager/db_helper/user_path.dart';
import 'package:chat_app/src/libraries/library_all.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
    group('Local db: LocalMessagesServices CRUD', () {
      sqfliteFfiInit();
      databaseFactory = databaseFactoryFfi;
      var user = UserDto(name: 'LocalMessagesServices', email: 'LocalMessagesServices@test', createdDate: 'createdDate', profilePicLink: 'profilePicLink', updatedDate: 'updatedDate');
      UserPath.user = user;

    test('addNewMessage - returns the id of the new message', () async {
      await DBHelper.instanse.initDB();
      var db = await DBHelper.instanse.database;
      await db.delete('messages');

      var r = await LocalMessagesServices().addNewMessage(chatId: 1, senderId: 1, content: 'content', date: DateTime.now().toIso8601String());
      var matcher = 1;
      
      expect(r, matcher);
      await DBHelper.instanse.deleteDB(db.path);
    });

    test('addNewMessage - adds the new message to the "messages" table', () async {
      await DBHelper.instanse.initDB();
      var db = await DBHelper.instanse.database;
      await db.delete('messages');

      var date = '2023-01-08T00:41:21.267124';

      await LocalMessagesServices().addNewMessage(chatId: 1, senderId: 1, content: 'content', date: date);

      var id = (await db.rawQuery('''SELECT last_insert_rowid()'''))[0]['last_insert_rowid()'] as int;

      var r = await db.rawQuery('''
        SELECT * fROM messages
          WHERE local_messages_id = $id''');
      var matcher = [
            {
              'local_messages_id': id,
              'chat_id': 1,
              'created_date': '2023-01-08T00:41:21.267124',
              'sender_id': 1,
              'message_id': null,
              'is_read': 0,
              'content': 'content',
              'updated_date': '2023-01-08T00:41:21.267124',
              'deleted_date': null,
              'attachment_id': null,
              'content_type': 'isText'
            }
          ];
      
      expect(r, matcher);
      await DBHelper.instanse.deleteDB(db.path);
    });

    test('deleteMessage - returns the number of deleted messages', () async {
      await DBHelper.instanse.initDB();
      var db = await DBHelper.instanse.database;
      await db.delete('messages');

      var insert = await db.rawInsert('''
        INSERT INTO messages
          (chat_id, created_date, sender_id, content, updated_date)
          VALUES
          (1, '2023-01-08T00:41:21.267124', 1, 'content', '2023-01-08T00:41:21.267124')''');

      var id = (await db.rawQuery('''SELECT last_insert_rowid()'''))[0]['last_insert_rowid()'] as int;

      var r = await LocalMessagesServices().deleteMessage(id: id);
      var matcher = 1;
      
      expect(r, matcher);
      await DBHelper.instanse.deleteDB(db.path);
    });

    test('deleteMessage - deletes a message from the table "messages"', () async {
      await DBHelper.instanse.initDB();
      var db = await DBHelper.instanse.database;
      await db.delete('messages');

      var insert = await db.rawInsert('''
        INSERT INTO messages
          (chat_id, created_date, sender_id, content, updated_date)
          VALUES
          (1, '2023-01-08T00:41:21.267124', 1, 'content', '2023-01-08T00:41:21.267124')''');

      var id = (await db.rawQuery('''SELECT last_insert_rowid()'''))[0]['last_insert_rowid()'] as int;

      await LocalMessagesServices().deleteMessage(id: id);

      var r = await db.rawQuery('''SELECT * FROM messages WHERE local_messages_id = $id''');
      var matcher = [];
      
      expect(r, matcher);
      await DBHelper.instanse.deleteDB(db.path);
    });

    test('deleteMessageFromBase - returns the number of deleted messages', () async {
      await DBHelper.instanse.initDB();
      var db = await DBHelper.instanse.database;
      await db.delete('messages');

      var insert = await db.rawInsert('''
        INSERT INTO messages
          (chat_id, created_date, message_id, sender_id, content, updated_date)
          VALUES
          (1, '2023-01-08T00:41:21.267124', 1, 1, 'content', '2023-01-08T00:41:21.267124')''');

      var r = await LocalMessagesServices().deleteMessageFromBase(id: 1, dateDelete: '2023-01-09T00:41:21.267124');

      var matcher = 1;
      
      expect(r, matcher);
      await DBHelper.instanse.deleteDB(db.path);
    });

    test('deleteMessageFromBase - deletes a message from the table "messages"', () async {
      await DBHelper.instanse.initDB();
      var db = await DBHelper.instanse.database;
      await db.delete('messages');

      var insert = await db.rawInsert('''
        INSERT INTO messages
          (chat_id, created_date, message_id, sender_id, content, updated_date)
          VALUES
          (1, '2023-01-08T00:41:21.267124', 1, 1, 'content', '2023-01-08T00:41:21.267124')''');

      await LocalMessagesServices().deleteMessageFromBase(id: 1, dateDelete: '2023-01-09T00:41:21.267124');

      var r = await db.rawQuery('''SELECT * FROM messages WHERE message_id = 1''');
      var matcher = [];
      
      expect(r, matcher);
      await DBHelper.instanse.deleteDB(db.path);
    });

    test('getAllMessages - returns List<MessageDto>', () async {
      await DBHelper.instanse.initDB();
      var db = await DBHelper.instanse.database;
      await db.delete('messages');

      var insert = await db.rawInsert('''
        INSERT INTO messages
          (chat_id, created_date, sender_id, content, updated_date)
          VALUES
          (1, '2023-01-08T00:41:21.267124', 1, 'content', '2023-01-08T00:41:21.267124')''');

      var id = (await db.rawQuery('''SELECT last_insert_rowid()'''))[0]['last_insert_rowid()'] as int;

      var r = (await LocalMessagesServices().getAllMessages())[0];

      var matcher = MessageDto(localMessageId: id, chatId: 1, senderId: 1, messageId: null, content: 'content', createdDate: '2023-01-08T00:41:21.267124', updatedDate: '2023-01-08T00:41:21.267124', deletedDate: '', isRead: 0);

      expect(r, matcher);
      await DBHelper.instanse.deleteDB(db.path);
    });
    
    test('getAllMessagesNotNull', () async {
      await DBHelper.instanse.initDB();
      var db = await DBHelper.instanse.database;
      await db.delete('messages');

      var insert = await db.rawInsert('''
        INSERT INTO messages
          (chat_id, created_date, sender_id, message_id, content, updated_date)
          VALUES
          (1, '2023-01-08T00:41:21.267124', 1, 1, 'content', '2023-01-08T00:41:21.267124')''');

      await db.rawInsert('''
        INSERT INTO messages
          (chat_id, created_date, sender_id, content, updated_date)
          VALUES
          (1, '2023-01-08T00:41:21.267124', 1, 'content', '2023-01-08T00:41:21.267124')''');
        
      var id = (await db.rawQuery('''SELECT last_insert_rowid()'''))[0]['last_insert_rowid()'] as int;
      var r = await LocalMessagesServices().getAllMessagesNotNull();
      var matcher = [
            MessageDto(localMessageId: id - 1, chatId: 1, senderId: 1, messageId: 1, content: 'content', createdDate: '2023-01-08T00:41:21.267124', updatedDate: '2023-01-08T00:41:21.267124', deletedDate: '', isRead: 0)
          ];
      
      expect(r, matcher);
      await DBHelper.instanse.deleteDB(db.path);
    });

    test('getMessageById', () async {
      await DBHelper.instanse.initDB();
      var db = await DBHelper.instanse.database;
      await db.delete('messages');

      var insert = await db.rawInsert('''
        INSERT INTO messages
          (chat_id, created_date, sender_id, content, updated_date)
          VALUES
          (1, '2023-01-08T00:41:21.267124', 1, 'content', '2023-01-08T00:41:21.267124')''');

      var id = (await db.rawQuery('''SELECT last_insert_rowid()'''))[0]['last_insert_rowid()'] as int;

      var r = await LocalMessagesServices().getMessageById(id: id);

      var matcher = {
              'local_messages_id': id,
              'chat_id': 1,
              'created_date': '2023-01-08T00:41:21.267124',
              'sender_id': 1,
              'message_id': null,
              'is_read': 0,
              'content': 'content',
              'updated_date': '2023-01-08T00:41:21.267124',
              'deleted_date': null,
              'attachment_id': null,
              'content_type': null,
            }
          ;
      
      expect(r, matcher);
      await DBHelper.instanse.deleteDB(db.path);
    });

    test('getMessagesByChatId', () async {
      await DBHelper.instanse.initDB();
      var db = await DBHelper.instanse.database;
      await db.delete('messages');

      var insert = await db.rawInsert('''
        INSERT INTO messages
          (chat_id, created_date, sender_id, content, updated_date)
          VALUES
          (1, '2023-01-08T00:41:21.267124', 1, 'content', '2023-01-08T00:41:21.267124')''');

      var id = (await db.rawQuery('''SELECT last_insert_rowid()'''))[0]['last_insert_rowid()'] as int;

      var r = await LocalMessagesServices().getMessagesByChatId(chatID: 1);

      var matcher = [{
              'local_messages_id': id,
              'chat_id': 1,
              'created_date': '2023-01-08T00:41:21.267124',
              'sender_id': 1,
              'message_id': null,
              'is_read': 0,
              'content': 'content',
              'updated_date': '2023-01-08T00:41:21.267124',
              'deleted_date': null,
              'attachment_id': null,
              'content_type': null,
            }]
          ;
      
      expect(r, matcher);
      await DBHelper.instanse.deleteDB(db.path);
    });

    test('getMessagesBySenderId', () async {
      await DBHelper.instanse.initDB();
      var db = await DBHelper.instanse.database;
      await db.delete('messages');

      var insert = await db.rawInsert('''
        INSERT INTO messages
          (chat_id, created_date, sender_id, content, updated_date)
          VALUES
          (1, '2023-01-08T00:41:21.267124', 1, 'content', '2023-01-08T00:41:21.267124')''');

      var id = (await db.rawQuery('''SELECT last_insert_rowid()'''))[0]['last_insert_rowid()'] as int;

      var r = await LocalMessagesServices().getMessagesBySenderId(senderID: 1);

      var matcher = [{
              'local_messages_id': id,
              'chat_id': 1,
              'created_date': '2023-01-08T00:41:21.267124',
              'sender_id': 1,
              'message_id': null,
              'is_read': 0,
              'content': 'content',
              'updated_date': '2023-01-08T00:41:21.267124',
              'deleted_date': null,
              'attachment_id': null,
              'content_type': null,
            }]
          ;
      
      expect(r, matcher);
      await DBHelper.instanse.deleteDB(db.path);
    });
    
    test('updateMessage', () async {
      await DBHelper.instanse.initDB();
      var db = await DBHelper.instanse.database;
      await db.delete('messages');

      var insert = await db.rawInsert('''
        INSERT INTO messages
          (chat_id, created_date, sender_id, content, updated_date)
          VALUES
          (1, '2023-01-08T00:41:21.267124', 1, 'content', '2023-01-08T00:41:21.267124')''');
      
      var id = (await db.rawQuery('''SELECT last_insert_rowid()'''))[0]['last_insert_rowid()'] as int;
      
      var message = MessageDto(
        localMessageId: id,
        chatId: 1,
        senderId: 1,
        messageId: null,
        content: 'content123',
        attachId: null,
        createdDate: '2023-01-08T00:41:21.267124',
        updatedDate: '2023-01-08T00:41:21.267124',
        deletedDate: null,
      );

      await LocalMessagesServices().updateMessage(message: message, localMessageId: message.localMessageId!);

      var r = (await db.rawQuery('''SELECT content FROM messages WHERE local_messages_id = $id'''))[0]['content'];
      var matcher = 'content123';
      
      expect(r, matcher);
      await DBHelper.instanse.deleteDB(db.path);
    });

    test('updateMessageFromBase', () async {
      await DBHelper.instanse.initDB();
      var db = await DBHelper.instanse.database;
      await db.delete('messages');

      var insert = await db.rawInsert('''
        INSERT INTO messages
          (chat_id, created_date, sender_id, message_id, content, updated_date)
          VALUES
          (1, '2023-01-08T00:41:21.267124', 1, 1, 'content', '2023-01-08T00:41:21.267124')''');

      var id = (await db.rawQuery('''SELECT last_insert_rowid()'''))[0]['last_insert_rowid()'] as int;

      await LocalMessagesServices().updateMessageFromBase(messageId: 1, content: '123456', updateDate: '2023-01-09T00:41:21.267124');

      var r = (await db.rawQuery('''SELECT message_id, content, updated_date FROM messages WHERE local_messages_id = $id'''))[0];
      
      var matcher = {
            'message_id': 1,
            'content': '123456',
            'updated_date': '2023-01-09T00:41:21.267124'
          };
      
      expect(r, matcher);
      await DBHelper.instanse.deleteDB(db.path);
    });

    test('updateWrittenToServer - sets new updated_date', () async {
      await DBHelper.instanse.initDB();
      var db = await DBHelper.instanse.database;
      await db.delete('messages');

      var insert = await db.rawInsert('''
        INSERT INTO messages
          (chat_id, created_date, sender_id, content, updated_date)
          VALUES
          (1, '2023-01-08T00:41:21.267124', 1, 'content', '2023-01-08T00:41:21.267124')''');

      var id = (await db.rawQuery('''SELECT last_insert_rowid()'''))[0]['last_insert_rowid()'] as int;

      await LocalMessagesServices().updateWrittenToServer(localMessageId: id, messagesId: 1, updatedDate: '2023-01-09T00:41:21.267124');

      var r = (await db.rawQuery('''SELECT message_id, updated_date FROM messages WHERE local_messages_id = $id'''))[0];
      
      var matcher = {
        'message_id': 1,
        'updated_date': '2023-01-09T00:41:21.267124',
      };
      
      expect(r, matcher);
      await DBHelper.instanse.deleteDB(db.path);
    });

    test('deleteWrittenToServer - sets deleted_date', () async {
      await DBHelper.instanse.initDB();
      var db = await DBHelper.instanse.database;
      await db.delete('messages');

      var insert = await db.rawInsert('''
        INSERT INTO messages
          (chat_id, created_date, sender_id, content, updated_date)
          VALUES
          (1, '2023-01-08T00:41:21.267124', 1, 'content', '2023-01-08T00:41:21.267124')''');

      var id = (await db.rawQuery('''SELECT last_insert_rowid()'''))[0]['last_insert_rowid()'] as int;

      await LocalMessagesServices().deleteWrittenToServer(localMessageId: id, deletedDate: '2023-01-08T00:41:21.267124');
      var r = (await db.rawQuery('''SELECT deleted_date FROM messages WHERE local_messages_id = $id'''))[0]['deleted_date'];
      
      var matcher = '2023-01-08T00:41:21.267124';
      
      expect(r, matcher);
      await DBHelper.instanse.deleteDB(db.path);
    });

    test('deleteAllMessagesInChat', () async {
      await DBHelper.instanse.initDB();
      var db = await DBHelper.instanse.database;
      await db.delete('messages');

      var insert = await db.rawInsert('''
        INSERT INTO messages
          (chat_id, created_date, sender_id, content, updated_date)
          VALUES
          (1, '2023-01-08T00:41:21.267124', 1, 'content', '2023-01-08T00:41:21.267124')''');

      await LocalMessagesServices().deleteAllMessagesInChat(chatID: 1);
      
      var r = await db.rawQuery('''SELECT * FROM messages WHERE chat_id = 1''');

      var matcher = [];
      
      expect(r, matcher);
      await DBHelper.instanse.deleteDB(db.path);
    });
        
    test('getMaxMessageId', () async {
      await DBHelper.instanse.initDB();
      var db = await DBHelper.instanse.database;
      await db.delete('messages');

      var insert = await db.rawInsert('''
        INSERT INTO messages
          (chat_id, created_date, sender_id, content, updated_date)
          VALUES
          (1, '2023-01-08T00:41:21.267124', 1, 'content', '2023-01-08T00:41:21.267124')''');

      var id = (await db.rawQuery('''SELECT last_insert_rowid()'''))[0]['last_insert_rowid()'];
      var r = await LocalMessagesServices().getMaxMessageId();
      var matcher = id;
      
      expect(r, matcher);
      await DBHelper.instanse.deleteDB(db.path);
    });

    test('addAttach', () async {
      await DBHelper.instanse.initDB();
      var db = await DBHelper.instanse.database;
      await db.delete('attachments');

      var attach = AttachModel(id: 1, meta: 'meta');

      await LocalMessagesServices().addAttach(attach);

      var r = await db.rawQuery('''SELECT * FROM attachments WHERE attachment_id = 1''');
      var matcher = [{'attachment_id': 1, 'attachment_meta': 'meta'}];
      
      expect(r, matcher);
      await DBHelper.instanse.deleteDB(db.path);
    });

  });
}