
import 'package:chat_app/domain/data/dto/attach_dto/attach_dto.dart';
import 'package:chat_app/domain/data/dto/chat_dto/chat_dto.dart';
import 'package:chat_app/domain/data/dto/message_dto/message_dto.dart';
import 'package:chat_app/domain/data/dto/user_dto/user_dto.dart';
import 'package:chat_app/modules/sending_manager/services/chats/local_chat_impl.dart';
import 'package:chat_app/modules/sending_manager/services/messages/local_message_impl.dart';
import 'package:chat_app/modules/sending_manager/services/users/local_users_service_impl.dart';
import 'package:chat_app/modules/sending_manager/services/users/main_user_service_impl.dart';
import 'package:chat_app/modules/storage_manager/db_helper/db_helper.dart';
import 'package:chat_app/modules/storage_manager/db_helper/db_helper_start.dart';
import 'package:chat_app/modules/storage_manager/db_helper/user_path.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
    group('Local db: LocalChatsServices CRUD', () {
      sqfliteFfiInit();
      databaseFactory = databaseFactoryFfi;
      var user = UserDto(
        name: 'LocalMessagesServices',
        email: 'LocalMessagesServices@test',
        createdDate: 'createdDate',
        profilePicLink: 'profilePicLink',
        updatedDate: 'updatedDate');
      UserPath.user = user;
    
    test('createChat - takes ChatDto, returns List<UserDto>', () async {
      await DBHelper.instanse.initDB();
      var db = await DBHelper.instanse.database;
      await db.delete('chats');

      var date = '2023-01-08T00:41:21.267124';

      var r = await LocalChatServices().createChat(createDate: date, userId: 1, chatId: 1);

      var id = (await db.rawQuery('''SELECT last_insert_rowid()'''))[0]['last_insert_rowid()'] as int;

      var matcher = [ChatDto(
        chatId: id,
        userIdChat: 1,
        createdDate: date,
        updatedDate: date,
        deletedDate: ''
      )];
      
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

      var id = (await db.rawQuery('''SELECT last_insert_rowid()'''))[0]['last_insert_rowid()'] as int;

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

      var id = (await db.rawQuery('''SELECT last_insert_rowid()'''))[0]['last_insert_rowid()'] as int;

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

      var id = (await db.rawQuery('''SELECT last_insert_rowid()'''))[0]['last_insert_rowid()'] as int;

      var date = '2023-01-08T00:41:21.267124';
      var chat = ChatDto(
        chatId: id,
        userIdChat: 1,
        createdDate: date,
        updatedDate: date,
        deletedDate: ''
      );

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

      var id = (await db.rawQuery('''SELECT last_insert_rowid()'''))[0]['last_insert_rowid()'] as int;

      var r = await LocalChatServices().getAllChatsSortedByUpdatedDate();

      var matcher = [
            ChatDto(chatId: id, userIdChat: 2, createdDate: '2023-01-08T00:41:21.267124', updatedDate: '2024-01-08T00:41:21.267124', deletedDate: ''),
            ChatDto(chatId: id - 1, userIdChat: 1, createdDate: '2023-01-08T00:41:21.267124', updatedDate: '2023-01-08T00:41:21.267124', deletedDate: '')
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

      var id = (await db.rawQuery('''SELECT last_insert_rowid()'''))[0]['last_insert_rowid()'] as int;

      var date = '2023-01-08T00:41:21.267124';

      var r = await LocalChatServices().getChatById(id: id);
      var matcher =  [
            {
              'chat_id': 1,
              'user_id': 1,
              'created_date': '2023-01-08T00:41:21.267124',
              'update_date': '2023-01-08T00:41:21.267124',
              'deleted_date': null
            }
          ];
      
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

      var id = (await db.rawQuery('''SELECT last_insert_rowid()'''))[0]['last_insert_rowid()'] as int;

      var date = '2023-01-08T00:41:21.267124';

      var r = await LocalChatServices().getMainIdChatByMessage(localId: id);
      var matcher = id;
      
      expect(r, matcher);
      await DBHelper.instanse.deleteDB(db.path);
    });

    test('updateChatDateUpdated', () async {
      await DBHelper.instanse.initDB();
      var db = await DBHelper.instanse.database;
      await db.delete('chats');

      var insert = await db.rawQuery('''
        INSERT INTO chats 
          (user_id, created_date, update_date)
        VALUES
      (1, '2023-01-08T00:41:21.267124', '2023-01-08T00:41:21.267124')''');

      var id = (await db.rawQuery('''SELECT last_insert_rowid()'''))[0]['last_insert_rowid()'] as int;


      await LocalChatServices().updateChatDateUpdated(chatId: id, dateUpdated: '2023-01-010T00:41:21.267124');

      var r = (await db.rawQuery('''SELECT update_date FROM chats WHERE chat_id = $id'''))[0]['update_date'];
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

      var id = (await db.rawQuery('''SELECT last_insert_rowid()'''))[0]['last_insert_rowid()'] as int;

      var r = await LocalChatServices().getMaxId();
      var matcher = id;
      
      expect(r, matcher);
      await DBHelper.instanse.deleteDB(db.path);
    });
    test('addNewMessage - returns the id of the new message', () async {
      await DBHelper.instanse.initDB();
      var db = await DBHelper.instanse.database;
      await db.delete('messages');

      var r = await LocalMessagesServices().addNewMessage(
          chatId: 1,
          senderId: 1,
          content: 'content',
          date: DateTime.now().toIso8601String());
      var matcher = 1;

      expect(r, matcher);
      await DBHelper.instanse.deleteDB(db.path);
    });

    test('addNewMessage - adds the new message to the "messages" table',
        () async {
      await DBHelper.instanse.initDB();
      var db = await DBHelper.instanse.database;
      await db.delete('messages');

      var date = '2023-01-08T00:41:21.267124';

      await LocalMessagesServices().addNewMessage(
          chatId: 1, senderId: 1, content: 'content', date: date);

      var id = (await db.rawQuery('''SELECT last_insert_rowid()'''))[0]
          ['last_insert_rowid()'] as int;

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
          (chat_id, created_date, sender_id, content, updated_date, message_id)
          VALUES
          (1, '2023-01-08T00:41:21.267124', 1, 'content', '2023-01-08T00:41:21.267124', 1)''');

      var id = (await db.rawQuery('''SELECT last_insert_rowid()'''))[0]
          ['last_insert_rowid()'] as int;

      var r = await LocalMessagesServices().deleteMessageByMessageId(id: 1);
      var matcher = 1;

      expect(r, matcher);
      await DBHelper.instanse.deleteDB(db.path);
    });

    test('deleteMessage - deletes a message from the table "messages"',
        () async {
      await DBHelper.instanse.initDB();
      var db = await DBHelper.instanse.database;
      await db.delete('messages');

      var insert = await db.rawInsert('''
        INSERT INTO messages
          (chat_id, created_date, sender_id, content, updated_date, message_id)
          VALUES
          (1, '2023-01-08T00:41:21.267124', 1, 'content', '2023-01-08T00:41:21.267124', 1)''');

      var id = (await db.rawQuery('''SELECT last_insert_rowid()'''))[0]
          ['last_insert_rowid()'] as int;

      await LocalMessagesServices().deleteMessageByMessageId(id: 1);

      var r = await db
          .rawQuery('''SELECT * FROM messages WHERE local_messages_id = $id''');
      var matcher = [];

      expect(r, matcher);
      await DBHelper.instanse.deleteDB(db.path);
    });

    test('deleteMessageFromBase - returns the number of deleted messages',
        () async {
      await DBHelper.instanse.initDB();
      var db = await DBHelper.instanse.database;
      await db.delete('messages');

      var insert = await db.rawInsert('''
        INSERT INTO messages
          (chat_id, created_date, message_id, sender_id, content, updated_date)
          VALUES
          (1, '2023-01-08T00:41:21.267124', 1, 1, 'content', '2023-01-08T00:41:21.267124')''');

      var r = await LocalMessagesServices().deleteMessageFromBase(
          id: 1, dateDelete: '2023-01-09T00:41:21.267124');

      var matcher = 1;

      expect(r, matcher);
      await DBHelper.instanse.deleteDB(db.path);
    });

    test('deleteMessageFromBase - deletes a message from the table "messages"',
        () async {
      await DBHelper.instanse.initDB();
      var db = await DBHelper.instanse.database;
      await db.delete('messages');

      var insert = await db.rawInsert('''
        INSERT INTO messages
          (chat_id, created_date, message_id, sender_id, content, updated_date)
          VALUES
          (1, '2023-01-08T00:41:21.267124', 1, 1, 'content', '2023-01-08T00:41:21.267124')''');

      await LocalMessagesServices().deleteMessageFromBase(
          id: 1, dateDelete: '2023-01-09T00:41:21.267124');

      var r =
          await db.rawQuery('''SELECT * FROM messages WHERE message_id = 1''');
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

      var id = (await db.rawQuery('''SELECT last_insert_rowid()'''))[0]
          ['last_insert_rowid()'] as int;

      var r = (await LocalMessagesServices().getAllMessages())[0];

      var matcher = MessageDto(
          localMessageId: id,
          chatId: 1,
          senderId: 1,
          messageId: null,
          content: 'content',
          createdDate: '2023-01-08T00:41:21.267124',
          updatedDate: '2023-01-08T00:41:21.267124',
          deletedDate: '',
          isRead: 0);

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

      var id = (await db.rawQuery('''SELECT last_insert_rowid()'''))[0]
          ['last_insert_rowid()'] as int;
      var r = await LocalMessagesServices().getAllMessagesNotNull();
      var matcher = [
        MessageDto(
            localMessageId: id - 1,
            chatId: 1,
            senderId: 1,
            messageId: 1,
            content: 'content',
            createdDate: '2023-01-08T00:41:21.267124',
            updatedDate: '2023-01-08T00:41:21.267124',
            deletedDate: '',
            isRead: 0)
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

      var id = (await db.rawQuery('''SELECT last_insert_rowid()'''))[0]
          ['last_insert_rowid()'] as int;

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
      };

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

      var id = (await db.rawQuery('''SELECT last_insert_rowid()'''))[0]
          ['last_insert_rowid()'] as int;

      var r = await LocalMessagesServices().getMessagesByChatId(chatID: 1);

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
          'content_type': null,
        }
      ];

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

      var id = (await db.rawQuery('''SELECT last_insert_rowid()'''))[0]
          ['last_insert_rowid()'] as int;

      var r = await LocalMessagesServices().getMessagesBySenderId(senderID: 1);

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
          'content_type': null,
        }
      ];

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

      var id = (await db.rawQuery('''SELECT last_insert_rowid()'''))[0]
          ['last_insert_rowid()'] as int;

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

      await LocalMessagesServices().updateMessage(
          message: message, localMessageId: message.localMessageId!);

      var r = (await db.rawQuery(
              '''SELECT content FROM messages WHERE local_messages_id = $id'''))[
          0]['content'];
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

      var id = (await db.rawQuery('''SELECT last_insert_rowid()'''))[0]
          ['last_insert_rowid()'] as int;

      await LocalMessagesServices().updateMessageFromBase(
          messageId: 1,
          content: '123456',
          updateDate: '2023-01-09T00:41:21.267124');

      var r = (await db.rawQuery(
          '''SELECT message_id, content, updated_date FROM messages WHERE local_messages_id = $id'''))[0];

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

      var id = (await db.rawQuery('''SELECT last_insert_rowid()'''))[0]
          ['last_insert_rowid()'] as int;

      await LocalMessagesServices().updateWrittenToServer(
          localMessageId: id,
          messagesId: 1,
          updatedDate: '2023-01-09T00:41:21.267124');

      var r = (await db.rawQuery(
          '''SELECT message_id, updated_date FROM messages WHERE local_messages_id = $id'''))[0];

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

      var id = (await db.rawQuery('''SELECT last_insert_rowid()'''))[0]
          ['last_insert_rowid()'] as int;

      await LocalMessagesServices().deleteWrittenToServer(
          localMessageId: id, deletedDate: '2023-01-08T00:41:21.267124');
      var r = (await db.rawQuery(
              '''SELECT deleted_date FROM messages WHERE local_messages_id = $id'''))[
          0]['deleted_date'];

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

      var id = (await db.rawQuery('''SELECT last_insert_rowid()'''))[0]
          ['last_insert_rowid()'];
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

      var r = await db
          .rawQuery('''SELECT * FROM attachments WHERE attachment_id = 1''');
      var matcher = [
        {'attachment_id': 1, 'attachment_meta': 'meta'}
      ];

      expect(r, matcher);
      await DBHelper.instanse.deleteDB(db.path);
    });
    test(
        'createUser - takes user\'s parameters, returns the id of the inserted row',
        () async {
      await DBHelper.instanse.initDB();
      var db = await DBHelper.instanse.database;
      await db.delete('users');
      var r = await LocalUsersServices().createUser(
          userId: 1,
          name: 'name',
          email: 'email',
          createdDate: '2022-13-45T34:11:11.123456',
          updatedDate: '2022-13-45T34:11:11.123456',
          profilePicUrl: 'profilePicUrl');

      var lastID = await db.rawQuery('''SELECT last_insert_rowid()''');
      var matcher = 1;
      expect(r, matcher);
      await DBHelper.instanse.deleteDB(db.path);
    });

    test(
        'createUserStart - takes user\'s parameters, inserts the user into startDB and returns the number of inserted rows',
        () async {
      await DBHelperStart.instanse.initDB();
      var db = await DBHelperStart.instanse.database;
      var deleted = await db.delete('users');
      var r = await LocalUsersServices().createUserStart(
          userId: 1,
          name: 'name',
          email: 'email',
          createdDate: '2022-13-45T34:11:11.123456',
          updatedDate: '2022-13-45T34:11:11.123456',
          profilePicUrl: 'profilePicUrl');

      var lastID = await db.rawQuery('''SELECT last_insert_rowid()''');
      var matcher = 1;
      expect(r, matcher);
      await DBHelperStart.instanse.deleteDB(db.path);
    });

    test('deleteUser - returns the number of deleted rows', () async {
      await DBHelper.instanse.initDB();
      var db = await DBHelper.instanse.database;
      await db.delete('users');

      await db.rawInsert('''
        INSERT INTO users (name, email, profile_pic_link, created_date, updated_date) 
          VALUES ('1', '1', 'link', '2022-13-45T34:11:11.123456', '2022-13-45T34:11:11.123456')
      ''');
      var r = await LocalUsersServices().deleteUser(id: 1);
      var matcher = 1;
      expect(r, matcher);
      await DBHelper.instanse.deleteDB(db.path);
    });

    test('getAllUsers - returns list of UserDtos ', () async {
      await DBHelper.instanse.initDB();
      var db = await DBHelper.instanse.database;
      var deleted = await db.delete('users');

      await db.rawInsert('''
        INSERT INTO users (name, email, profile_pic_link, created_date, updated_date) 
          VALUES ('LocalUsersServices', 'LocalUsersServices@test', 'profilePicLink', '2022-13-45T34:11:11.123456', '2022-13-45T34:11:11.123456')
      ''');
      var r = await LocalUsersServices().getAllUsers();
      var query = await db.rawQuery('''SELECT * FROM users;''');

      var addedUserId = await db.rawQuery('''SELECT last_insert_rowid()''');
      var matcher = UserDto(
          userId: addedUserId[0]['last_insert_rowid()'] as int,
          name: query[0]['name'] as String,
          email: query[0]['email'] as String,
          createdDate: query[0]['created_date'] as String,
          profilePicLink: query[0]['profile_pic_link'] as String,
          updatedDate: query[0]['updated_date'] as String,
          deletedDate: '');
      expect(r[0], matcher);
      await DBHelper.instanse.deleteDB(db.path);
    });

    test('getAllUsers - returns list of UserDtos ', () async {
      await DBHelper.instanse.initDB();
      var db = await DBHelper.instanse.database;
      var deleted = await db.delete('users');

      await db.rawInsert('''
        INSERT INTO users (name, email, profile_pic_link, created_date, updated_date) 
          VALUES ('LocalUsersServices', 'LocalUsersServices@test', 'profilePicLink', '2022-13-45T34:11:11.123456', '2022-13-45T34:11:11.123456')
      ''');
      var r = await LocalUsersServices().getAllUsers();
      var query = await db.rawQuery('''SELECT * FROM users;''');

      var addedUserId = await db.rawQuery('''SELECT last_insert_rowid()''');
      var matcher = UserDto(
          userId: addedUserId[0]['last_insert_rowid()'] as int,
          name: query[0]['name'] as String,
          email: query[0]['email'] as String,
          createdDate: query[0]['created_date'] as String,
          profilePicLink: query[0]['profile_pic_link'] as String,
          updatedDate: query[0]['updated_date'] as String,
          deletedDate: '');
      expect(r[0], matcher);
      await DBHelper.instanse.deleteDB(db.path);
    });

    test('getAllUsersStart - returns list of Users in the startDB', () async {
      await DBHelperStart.instanse.initDB();
      var db = await DBHelperStart.instanse.database;
      var deleted = await db.delete('users');

      var insert = await db.rawInsert('''
        INSERT INTO users (user_id, name, email, profile_pic_link, created_date, updated_date, deleted_date) 
          VALUES (100000, 'LocalUsersServices', 'LocalUsersServices@test', 'profilePicLink', '2022-13-45T34:11:11.123456', '2022-13-45T34:11:11.123456', '');
      ''');
      var r = await LocalUsersServices().getAllUsersStart();
      var query = await db.rawQuery('''SELECT * FROM users;''');

      var addedUserId = await db.rawQuery('''SELECT last_insert_rowid()''');

      var matcher = UserDto(
          userId: addedUserId[0]['last_insert_rowid()'] as int,
          name: query[0]['name'] as String,
          email: query[0]['email'] as String,
          createdDate: query[0]['created_date'] as String,
          profilePicLink: query[0]['profile_pic_link'] as String,
          updatedDate: query[0]['updated_date'] as String,
          deletedDate: '');
      expect(r[0], matcher);
      await DBHelperStart.instanse.deleteDB(db.path);
    });

    test(
        'getUserByField - returns list of Users in where one of the fields id equal to the passed value',
        () async {
      await DBHelper.instanse.initDB();
      var db = await DBHelper.instanse.database;
      var deleted = await db.delete('users');

      var insert = await db.rawInsert('''
        INSERT INTO users (user_id, name, email, profile_pic_link, created_date, updated_date, deleted_date) 
          VALUES (100000, 'LocalUsersServices', 'LocalUsersServices@test', 'profilePicLink', '2022-13-45T34:11:11.123456', '2022-13-45T34:11:11.123456', '');
      ''');
      var r = await LocalUsersServices()
          .getUserByField(field: 'name', fieldValue: 'LocalUsersServices');

      var query = await db.rawQuery(
          '''SELECT * FROM users WHERE (name = "LocalUsersServices");''');

      var addedUserId = await db.rawQuery('''SELECT last_insert_rowid()''');

      var matcher = UserDto(
              userId: addedUserId[0]['last_insert_rowid()'] as int,
              name: query[0]['name'] as String,
              email: query[0]['email'] as String,
              createdDate: query[0]['created_date'] as String,
              profilePicLink: query[0]['profile_pic_link'] as String,
              updatedDate: query[0]['updated_date'] as String,
              deletedDate: '')
          .toMap();

      expect(r[0], matcher);

      await DBHelper.instanse.deleteDB(db.path);
    });

    test(
        'getMainIdUserByLocalId - gets a row id, returns the main_id of the user from the main_user table',
        () async {
      await DBHelper.instanse.initDB();
      var db = await DBHelper.instanse.database;
      var deleted = await db.delete('main_user');

      var insert = await db.rawInsert('''
        INSERT INTO main_user (user_id, user_key, date_sync) VALUES (1, 1, 'date_sync');
      ''');

      var insertedRowId =
          (await db.rawQuery('''SELECT last_insert_rowid()'''))[0]
              ['last_insert_rowid()'] as int;

      var r = await LocalUsersServices().getMainIdUserByLocalId(localId: 1);

      var matcher = (await db.rawQuery(
              '''SELECT user_id FROM main_user WHERE (user_id = $insertedRowId);'''))[
          0]['user_id'] as int;

      expect(r, matcher);

      await DBHelper.instanse.deleteDB(db.path);
    });

    test('getUserByLocalId - returns a UserDto by rowid', () async {
      await DBHelper.instanse.initDB();
      var db = await DBHelper.instanse.database;
      var deleted = await db.delete('users');

      var insert = await db.rawInsert('''
        INSERT INTO users (user_id, name, email, profile_pic_link, created_date, updated_date, deleted_date) 
          VALUES (100000, 'LocalUsersServices', 'LocalUsersServices@test', 'profilePicLink', '2022-13-45T34:11:11.123456', '2022-13-45T34:11:11.123456', '');
      ''');

      var insertedRowId =
          (await db.rawQuery('''SELECT last_insert_rowid()'''))[0]
              ['last_insert_rowid()'] as int;

      var r = await LocalUsersServices().getUserById(id: insertedRowId);

      var matcher = (await db.rawQuery(
          '''SELECT * FROM users WHERE (user_id = $insertedRowId);'''));

      expect(r, matcher);

      await DBHelper.instanse.deleteDB(db.path);
    });

    test('getUserByLocalId - returns a UserDto by rowid', () async {
      await DBHelper.instanse.initDB();
      var db = await DBHelper.instanse.database;
      var deleted = await db.delete('users');

      var insert = await db.rawInsert('''
        INSERT INTO users (user_id, name, email, profile_pic_link, created_date, updated_date, deleted_date) 
          VALUES (100000, 'LocalUsersServices', 'LocalUsersServices@test', 'profilePicLink', '2022-13-45T34:11:11.123456', '2022-13-45T34:11:11.123456', '');
      ''');

      var insertedRowId =
          (await db.rawQuery('''SELECT last_insert_rowid()'''))[0]
              ['last_insert_rowid()'] as int;

      var r = await LocalUsersServices().getUserById(id: insertedRowId);

      var matcher = (await db.rawQuery(
          '''SELECT * FROM users WHERE (user_id = $insertedRowId);'''));

      expect(r, matcher);

      await DBHelper.instanse.deleteDB(db.path);
    });

    test('updateUser - returns the number of updated fields', () async {
      await DBHelper.instanse.initDB();
      var db = await DBHelper.instanse.database;
      var deleted = await db.delete('users');

      var insert = await db.rawInsert('''
        INSERT INTO users (user_id, name, email, profile_pic_link, created_date, updated_date, deleted_date) 
          VALUES (100000, 'LocalUsersServices', 'LocalUsersServices@test', 'profilePicLink', '2022-13-45T34:11:11.123456', '2022-13-45T34:11:11.123456', '');
      ''');

      var r = await LocalUsersServices().updateUser(
          newValues: "name = 'LocalUsersServices2'",
          condition: "user_id = 100000");

      var matcher = 1;

      expect(r, matcher);

      await DBHelper.instanse.deleteDB(db.path);
    });

    test('updateUser - updates user data', () async {
      await DBHelper.instanse.initDB();
      var db = await DBHelper.instanse.database;
      var deleted = await db.delete('users');

      var insert = await db.rawInsert('''
        INSERT INTO users (user_id, name, email, profile_pic_link, created_date, updated_date, deleted_date) 
          VALUES (100000, 'LocalUsersServices', 'LocalUsersServices@test', 'profilePicLink', '2022-13-45T34:11:11.123456', '2022-13-45T34:11:11.123456', '');
      ''');

      await LocalUsersServices().updateUser(
          newValues: "name = 'LocalUsersServices2'",
          condition: "user_id = 100000");

      var r = await db
          .rawQuery('''SELECT name FROM users WHERE user_id = 100000''');

      var matcher = 'LocalUsersServices2';

      expect(r[0]['name'], matcher);

      await DBHelper.instanse.deleteDB(db.path);
    });

    test('updateUserStart - returns the number of updated fields', () async {
      await DBHelperStart.instanse.initDB();
      var db = await DBHelperStart.instanse.database;
      var deleted = await db.delete('users');

      var insert = await db.rawInsert('''
        INSERT INTO users (user_id, name, email, profile_pic_link, created_date, updated_date, deleted_date) 
          VALUES (100000, 'LocalUsersServices', 'LocalUsersServices@test', 'profilePicLink', '2022-13-45T34:11:11.123456', '2022-13-45T34:11:11.123456', '');
      ''');

      var insertedRowId =
          (await db.rawQuery('''SELECT last_insert_rowid()'''))[0]
              ['last_insert_rowid()'] as int;

      var r = await LocalUsersServices().updateUserStart(
          newValues: "name = 'LocalUsersServices2'",
          condition: "user_id = 100000");

      var matcher = 1;

      expect(r, matcher);

      await DBHelperStart.instanse.deleteDB(db.path);
    });

    test('updateUserStart - updates user data', () async {
      await DBHelperStart.instanse.initDB();
      var db = await DBHelperStart.instanse.database;
      var deleted = await db.delete('users');

      var insert = await db.rawInsert('''
        INSERT INTO users (user_id, name, email, profile_pic_link, created_date, updated_date, deleted_date) 
          VALUES (100000, 'LocalUsersServices', 'LocalUsersServices@test', 'profilePicLink', '2022-13-45T34:11:11.123456', '2022-13-45T34:11:11.123456', '');
      ''');

      await LocalUsersServices().updateUserStart(
          newValues: "name = 'LocalUsersServices2'",
          condition: "user_id = 100000");

      var r = await db
          .rawQuery('''SELECT name FROM users WHERE user_id = 100000''');

      var matcher = 'LocalUsersServices2';

      expect(r[0]['name'], matcher);

      await DBHelperStart.instanse.deleteDB(db.path);
    });

    test(
        'getAllUserIdAndUpdatedStarted - gets user_id and updated_date for all users in the table',
        () async {
      await DBHelperStart.instanse.initDB();
      var db = await DBHelperStart.instanse.database;
      var deleted = await db.delete('users');

      var insert = await db.rawInsert('''
        INSERT INTO users (user_id, name, email, profile_pic_link, created_date, updated_date, deleted_date) 
          VALUES (100000, 'LocalUsersServices', 'LocalUsersServices@test', 'profilePicLink', '2022-13-45T34:11:11.123456', '2022-13-45T34:11:11.123456', '');
      ''');

      var r = await LocalUsersServices().getAllUserIdAndUpdatedStart();

      // var r = await db.rawQuery('''SELECT name FROM users WHERE user_id = 100000''');

      var matcher = [
        {'user_id': 100000, 'updated_date': '2022-13-45T34:11:11.123456'}
      ];

      expect(r, matcher);

      await DBHelperStart.instanse.deleteDB(db.path);
    });

    test(
        'getAllUserIdAndUpdated - gets user_id and updated_date for all users in the table',
        () async {
      await DBHelper.instanse.initDB();
      var db = await DBHelper.instanse.database;
      var deleted = await db.delete('users');

      var insert = await db.rawInsert('''
        INSERT INTO users (user_id, name, email, profile_pic_link, created_date, updated_date, deleted_date) 
          VALUES (100000, 'LocalUsersServices', 'LocalUsersServices@test', 'profilePicLink', '2022-13-45T34:11:11.123456', '2022-13-45T34:11:11.123456', '');
      ''');

      var r = await LocalUsersServices().getAllUserIdAndUpdated();

      var matcher = [
        {'user_id': 100000, 'updated_date': '2022-13-45T34:11:11.123456'}
      ];

      expect(r, matcher);

      await DBHelper.instanse.deleteDB(db.path);
    });

    test('getLastUserId - gets the biggest user_id', () async {
      await DBHelperStart.instanse.initDB();
      var db = await DBHelperStart.instanse.database;
      var deleted = await db.delete('users');

      await db.rawInsert('''
        INSERT INTO users (user_id, name, email, profile_pic_link, created_date, updated_date, deleted_date) 
          VALUES (100000, 'LocalUsersServices', 'LocalUsersServices@test', 'profilePicLink', '2022-13-45T34:11:11.123456', '2022-13-45T34:11:11.123456', '');
      ''');

      await db.rawInsert('''
        INSERT INTO users (user_id, name, email, profile_pic_link, created_date, updated_date, deleted_date) 
          VALUES (100001, 'LocalUsersServices', 'LocalUsersServices@test', 'profilePicLink', '2022-13-45T34:11:11.123456', '2022-13-45T34:11:11.123456', '');
      ''');

      var r = await LocalUsersServices().getLastUserIdStart();

      var matcher = 100001;

      expect(r, matcher);

      await DBHelperStart.instanse.deleteDB(db.path);
    });

    test('getLastUserId - gets the biggest user_id', () async {
      await DBHelperStart.instanse.initDB();
      var db = await DBHelperStart.instanse.database;
      var deleted = await db.delete('users');

      await db.rawInsert('''
        INSERT INTO users (user_id, name, email, profile_pic_link, created_date, updated_date, deleted_date) 
          VALUES (100000, 'LocalUsersServices', 'LocalUsersServices@test', 'profilePicLink', '2022-13-45T34:11:11.123456', '2022-13-45T34:11:11.123456', '');
      ''');

      await db.rawInsert('''
        INSERT INTO users (user_id, name, email, profile_pic_link, created_date, updated_date, deleted_date) 
          VALUES (100001, 'LocalUsersServices', 'LocalUsersServices@test', 'profilePicLink', '2022-13-45T34:11:11.123456', '2022-13-45T34:11:11.123456', '');
      ''');

      var r = await LocalUsersServices().getLastUserIdStart();

      var matcher = 100001;

      expect(r, matcher);

      await DBHelperStart.instanse.deleteDB(db.path);
    });

    test('getMaxUserId - gets the biggest user_id', () async {
      await DBHelper.instanse.initDB();
      var db = await DBHelper.instanse.database;
      var deleted = await db.delete('users');

      await db.rawInsert('''
        INSERT INTO users (user_id, name, email, profile_pic_link, created_date, updated_date, deleted_date) 
          VALUES (100000, 'LocalUsersServices', 'LocalUsersServices@test', 'profilePicLink', '2022-13-45T34:11:11.123456', '2022-13-45T34:11:11.123456', '');
      ''');

      await db.rawInsert('''
        INSERT INTO users (user_id, name, email, profile_pic_link, created_date, updated_date, deleted_date) 
          VALUES (100001, 'LocalUsersServices', 'LocalUsersServices@test', 'profilePicLink', '2022-13-45T34:11:11.123456', '2022-13-45T34:11:11.123456', '');
      ''');

      var r = await LocalUsersServices().getMaxUserId();

      var matcher = 100001;

      expect(r, matcher);

      await DBHelper.instanse.deleteDB(db.path);
    });
    test('getDateSync', () async {
      await DBHelper.instanse.initDB();
      var db = await DBHelper.instanse.database;
      await db.delete('main_user');

      await db.rawInsert('''INSERT INTO main_user (user_id, user_key, date_sync) 
        VALUES (1, 'key', 'date_sync')''');

      var r = await MainUserServices().getDateSync();

      var matcher = 'date_sync';

      expect(r, matcher);
    });

    test('getUserId', () async {
      await DBHelper.instanse.initDB();
      var db = await DBHelper.instanse.database;
      await db.delete('main_user');

      await db.rawInsert('''INSERT INTO main_user (user_id, user_key, date_sync) 
        VALUES (1, 'key', 'date_sync')''');

      var r = await MainUserServices().getUserID();

      var matcher = 1;

      expect(r, matcher);
    });

    test('createMainUser - inserts new row to the main_user table', () async {
      await DBHelper.instanse.initDB();
      var db = await DBHelper.instanse.database;
      await db.delete('main_user');

      await MainUserServices().createMainUser(1);

      var r = await db.rawQuery('''SELECT user_id, user_key FROM main_user
        WHERE user_id = 1''');

      var matcher = [{'user_id': 1, 'user_key': ''}];

      expect(r, matcher);
    });

    test('createMainUser - returns number of inserted rows', () async {
      await DBHelper.instanse.initDB();
      var db = await DBHelper.instanse.database;
      await db.delete('main_user');

      var r = await MainUserServices().createMainUser(1);

      var matcher = 1;

      expect(r, matcher);
    });

    test('updateMainUser - updates a field condition is true', () async {
      await DBHelper.instanse.initDB();
      var db = await DBHelper.instanse.database;
      await db.delete('main_user');
      
      await db.rawInsert('''INSERT INTO main_user (user_id, user_key, date_sync) 
      VALUES (1, 'key', 'date_sync')''');

      await MainUserServices().updateMainUser(newValues: 'user_key = "key"', condition: 'user_id = 1');

      var r = await db.rawQuery('''SELECT user_key FROM main_user
        WHERE user_id = 1''');

      var matcher = 'key';

      expect(r[0]['user_key'], matcher);
    });

    test('updateMainUser - returns number of updated rows', () async {
      await DBHelper.instanse.initDB();
      var db = await DBHelper.instanse.database;
      await db.delete('main_user');

      await db.rawInsert('''INSERT INTO main_user (user_id, user_key, date_sync) 
      VALUES (1, 'key', 'date_sync')''');

      var r = await MainUserServices().updateMainUser(newValues: 'user_key = "key"', condition: 'user_id = 1');

      var matcher = 1;

      expect(r, matcher);
    });
  });
}