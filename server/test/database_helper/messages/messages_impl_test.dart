

import 'package:server/src/db_server/database_helper/messages/message_impl.dart';
import 'package:server/src/db_server/services/database_impl.dart';
import 'package:server/src/generated/messages.pb.dart';
import 'package:sqflite_common/sqlite_api.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:test/test.dart';

void main() {
    // WidgetsFlutterBinding.ensureInitialized();
    group('Main db: LocalMessagesServices CRUD', () {
      sqfliteFfiInit();

      test('createUser - takes user\'s parameters, returns List<Map<String, Object?>>', () async {
        Database db = await DbServerServices.instanse.database;
        await db.delete('messages');
        // var date = '2022-13-45T34:11:11.123456';
        var contentType = ContentType.isText;
        
        var r = (await MessagesDBServices().addNewMessage(chatId: 1, senderId: 1, content: 'content', contentType: contentType))['message_id'];

        var id = (await db.rawQuery('''SELECT last_insert_rowid()'''))[0]['last_insert_rowid()'];

        var matcher = id;
        
        expect(r, matcher);
        await db.close();
      });

      test('deleteMessage - returns the number of deleted rows', () async {
        Database db = await DbServerServices.instanse.database;
        await db.delete('messages');
        var date = '2022-13-45T34:11:11.123456';
        var contentType = ContentType.isText;

        var insert = await db.rawQuery('''INSERT INTO messages (chat_id, sender_id, content, created_date, updated_date, content_type) VALUES (1, 1, 'content', "$date", "$date", "$contentType")''');

        var id = (await db.rawQuery('''SELECT last_insert_rowid()'''))[0]['last_insert_rowid()'] as int;
        
        var r = await MessagesDBServices().deleteMessage(id: id);
        var matcher = 1;
        
        expect(r, matcher);

        await db.close();
      });

      test('deleteMessage - deletes the rows', () async {
        Database db = await DbServerServices.instanse.database;
        await db.delete('messages');
        var date = '2022-13-45T34:11:11.123456';
        var contentType = ContentType.isText;

        var insert = await db.rawQuery('''INSERT INTO messages (chat_id, sender_id, content, created_date, updated_date, content_type) VALUES (1, 1, 'content', "$date", "$date", "$contentType")''');

        var id = (await db.rawQuery('''SELECT last_insert_rowid()'''))[0]['last_insert_rowid()'] as int;
        
        await MessagesDBServices().deleteMessage(id: id);
         var r = await db.rawQuery('''SELECT * FROM messages WHERE message_id = $id''');
        var matcher = [];
        
        expect(r, matcher);

        await db.close();
      });

      test('getAllMessages', () async {
        Database db = await DbServerServices.instanse.database;
        await db.delete('messages');
        var date = '2022-13-45T34:11:11.123456';
        var contentType = ContentType.isText;

        var insert = await db.rawQuery('''INSERT INTO messages (chat_id, sender_id, content, created_date, updated_date, content_type) VALUES (1, 1, 'content', "$date", "$date", "$contentType")''');

        var id = (await db.rawQuery('''SELECT last_insert_rowid()'''))[0]['last_insert_rowid()'];
        
        var r = await MessagesDBServices().getAllMessages();
        var matcher = [
            {
              'message_id': id,
              'chat_id': 1,
              'sender_id': 1,
              'content': 'content',
              'created_date': '2022-13-45T34:11:11.123456',
              'updated_date': '2022-13-45T34:11:11.123456',
              'deleted_date': null,
              'attachment_id': null,
              'content_type': 'isText'
            }
          ];
        
        expect(r, matcher);

        await db.close();
      });

      test('getMessageById', () async {
        Database db = await DbServerServices.instanse.database;
        await db.delete('messages');
        var date = '2022-13-45T34:11:11.123456';
        var contentType = ContentType.isText;

        var insert = await db.rawQuery('''INSERT INTO messages (chat_id, sender_id, content, created_date, updated_date, content_type) VALUES (1, 1, 'content', "$date", "$date", "$contentType")''');

        var id = (await db.rawQuery('''SELECT last_insert_rowid()'''))[0]['last_insert_rowid()'] as int;
        
        var r = await MessagesDBServices().getMessageById(id: id);
        var matcher = [
            {
              'message_id': id,
              'chat_id': 1,
              'sender_id': 1,
              'content': 'content',
              'created_date': '2022-13-45T34:11:11.123456',
              'updated_date': '2022-13-45T34:11:11.123456',
              'deleted_date': null,
              'attachment_id': null,
              'content_type': 'isText'
            }
          ];
        
        expect(r, matcher);

        await db.close();
      });

      test('getMessagesByChatId', () async {
        Database db = await DbServerServices.instanse.database;
        await db.delete('messages');
        var date = '2022-13-45T34:11:11.123456';
        var contentType = ContentType.isText;

        var insert = await db.rawQuery('''INSERT INTO messages (chat_id, sender_id, content, created_date, updated_date, content_type) VALUES (1, 1, 'content', "$date", "$date", "$contentType")''');

        var id = (await db.rawQuery('''SELECT last_insert_rowid()'''))[0]['last_insert_rowid()'] as int;
        
        var r = await MessagesDBServices().getMessagesByChatId(chatId: 1);
        var matcher = [
            {
              'message_id': id,
              'chat_id': 1,
              'sender_id': 1,
              'content': 'content',
              'created_date': '2022-13-45T34:11:11.123456',
              'updated_date': '2022-13-45T34:11:11.123456',
              'deleted_date': null,
              'attachment_id': null,
              'content_type': 'isText'
            }
          ];
        
        expect(r, matcher);

        await db.close();
      });

      test('getMessagesBySenderId', () async {
        Database db = await DbServerServices.instanse.database;
        await db.delete('messages');
        var date = '2022-13-45T34:11:11.123456';
        var contentType = ContentType.isText;

        var insert = await db.rawQuery('''INSERT INTO messages (chat_id, sender_id, content, created_date, updated_date, content_type) VALUES (1, 1, 'content', "$date", "$date", "$contentType")''');

        var id = (await db.rawQuery('''SELECT last_insert_rowid()'''))[0]['last_insert_rowid()'] as int;
        
        var r = await MessagesDBServices().getMessagesBySenderId(senderId: 1);
        var matcher = [
            {
              'message_id': id,
              'chat_id': 1,
              'sender_id': 1,
              'content': 'content',
              'created_date': '2022-13-45T34:11:11.123456',
              'updated_date': '2022-13-45T34:11:11.123456',
              'deleted_date': null,
              'attachment_id': null,
              'content_type': 'isText'
            }
          ];
        
        expect(r, matcher);

        await db.close();
      });

      test('updateMessage - returns the number of updated rows', () async {
        Database db = await DbServerServices.instanse.database;
        await db.delete('messages');
        var date = '2022-13-45T34:11:11.123456';
        var contentType = ContentType.isText;

        var insert = await db.rawQuery('''INSERT INTO messages (chat_id, sender_id, content, created_date, updated_date, content_type) VALUES (1, 1, 'content', "$date", "$date", "$contentType")''');

        var id = (await db.rawQuery('''SELECT last_insert_rowid()'''))[0]['last_insert_rowid()'] as int;
        
        var r = await MessagesDBServices().updateMessage(newValues: 'content = "content123"', condition: 'message_id = $id');
        var matcher = 1;
        
        expect(r, matcher);

        await db.close();
      });

  });
}