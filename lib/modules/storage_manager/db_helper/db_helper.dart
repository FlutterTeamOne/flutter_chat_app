import 'dart:async';
import 'package:chat_app/domain/data/dto/user_dto/user_dto.dart';
import 'package:chat_app/modules/storage_manager/db_helper/user_path.dart';

import '../../../src/constants/db_constants.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite_common/sqlite_api.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class DBHelper {
  //Singleton
  DBHelper._();
  static final DBHelper instanse = DBHelper._();

  static Database? _database;

  ///Обращение к локальной БД извне
  Future<Database> get database async => _database ??= await initDB();

  ///Стрим контроллер, чтоб слушать изменения в БД
  final _updateListenController = StreamController<bool>.broadcast();
  StreamController<bool> get updateListenController => _updateListenController;

  void _updateListen() => _updateListenController.sink.add(true);

  ///Инициализация локальной БД. Если ее нет,
  ///то создается новая БД
  Future<Database> initDB() async {
    sqfliteFfiInit();
    var dbFactory = databaseFactoryFfi;
    // var dbPath = await dbFactory.getDatabasesPath();
    // var dbPath = await getTemporaryDirectory();
    var dbPath = '.dart_tool/sqflite_common_ffi/databases/';
    // print('PATH: ${dbPath.path}');
    var user = UserPath.getUser;
    print('USER DB:  $user');
    // String path = join(dbPath.path,
    //     user.name + user.userId.toString() + DatabaseConst.dbFileName);
    String path = join(
        dbPath, user.name + user.userId.toString() + DatabaseConst.dbFileName);
    print('PATH_ABSOLUTE: $path');
    return await dbFactory.openDatabase(path,
        options: OpenDatabaseOptions(
          version: DatabaseConst.dbVersion,
          onCreate: (db, version) => _onCreate(db, version, user: user),
        ));
  }

  ///Функция создания начальной таблицы БД
  Future _onCreate(Database db, int version, {required UserDto user}) async {
    await db.transaction((txn) async {
      //Таблица User
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
//Таблица User_main
      await txn.execute('''
CREATE TABLE ${DatabaseConst.mainUserTable}(
  ${DatabaseConst.mainUserColumnUserId} ${DatabaseConst.integer},
  ${DatabaseConst.mainUserColumnKey} ${DatabaseConst.char50},
  ${DatabaseConst.mainUserColumnDataSync} ${DatabaseConst.char26}
)
''');
//Таблица Chats
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

//Таблица Messages
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
// Attachments table
      await txn.execute('''
          CREATE TABLE ${DatabaseConst.attachmentsTable} 
          (
          ${DatabaseConst.attachmentsColumnAttachmentId} ${DatabaseConst.integer} ${DatabaseConst.primaryKey} ${DatabaseConst.autoincrement},
          ${DatabaseConst.attachmentsColumnAttachmentMeta} ${DatabaseConst.char4096} ${DatabaseConst.notNull}
          )
      ''');
// CHECK ((sender_is_user = 0) OR (sender_is_user = 1))

      await txn.execute('''
CREATE INDEX CHATS_FK_3 ON ${DatabaseConst.chatsTable}
(
 ${DatabaseConst.chatsColumnUserId}
)
''');
      await txn.execute('''
CREATE INDEX MESSAGES_FK_2 ON ${DatabaseConst.messageTable}
(
 ${DatabaseConst.chatsColumnChatId}
);
''');
      await txn.execute('''
CREATE INDEX MAIN_USER_FK_1 ON ${DatabaseConst.mainUserTable}
(
 ${DatabaseConst.usersColumnUserId}
)
''');

      // //Первичная запись юзера в таблицу
      await txn.insert(
        DatabaseConst.userTable,
        {
          DatabaseConst.usersColumnUserId: user.userId,
          DatabaseConst.usersColumnName: user.name,
          DatabaseConst.usersColumnEmail: user.email,
          DatabaseConst.usersColumnProfilePicLink: user.profilePicLink,
          DatabaseConst.usersColumnCreatedDate: user.createdDate,
          DatabaseConst.usersColumnUpdatedDate: user.updatedDate,
          DatabaseConst.usersColumnDeletedDate: user.deletedDate
        },
      );

      await txn.insert(DatabaseConst.mainUserTable, {
        DatabaseConst.mainUserColumnKey: '',
        DatabaseConst.mainUserColumnUserId: user.userId,
        DatabaseConst.mainUserColumnDataSync: '',
      });
      // await txn.insert(
      //   DatabaseConst.userTable,
      //   {
      //     'name': 'test2',
      //     'email': 't2@t2.t2',
      //     DatabaseConst.usersColumnProfilePicLink:
      //         'https://music.mathwatha.com/wp-content/uploads/2017/08/tonyprofile-300x300.jpg',
      //     DatabaseConst.usersColumnCreatedDate:
      //         DateTime.now().toIso8601String(),
      //     DatabaseConst.usersColumnUserId: 2,
      //     DatabaseConst.usersColumnUpdatedDate:
      //         DateTime.now().toIso8601String(),
      //   },
      // );
      // await txn.insert(
      //   DatabaseConst.chatsTable,
      //   {
      //     DatabaseConst.chatsColumnUserId: 2,
      //     DatabaseConst.chatsColumnCreatedDate:
      //         DateTime.now().toIso8601String(),
      //     DatabaseConst.chatsColumnUpdatedDate:
      //         DateTime.now().toIso8601String(),
      //   },
      // );
    });

    _updateListen();
  }

  ///Функция считывания/получения данных из БД
  Future onRead(
      {required String tableName, required Map<String, dynamic> model}) async {
    var db = await instanse.database;
    await db.transaction((txn) async {
      await txn.query(
        tableName,
      );
      // where: '${DatabaseConst.columnId}=?', whereArgs: [model.id]);
    });

    _updateListen();
  }

  ///Добавление данных в БД
  Future onAdd(
      {required String tableName, required Map<String, dynamic> model}) async {
    var db = await instanse.database;
    await db.transaction((txn) async {
      await txn.insert(tableName, model);
    });
    _updateListen();
  }

  ///Функция удаления элемента из БД по ID
  Future onDelete(
      {required String tableName,
      required String column,
      required Map<String, dynamic> model}) async {
    var db = await instanse.database;
    await db.transaction((txn) async {
      await txn.delete(tableName, where: '$column=?', whereArgs: [model['id']]);
    });
    _updateListen();
  }

  ///Функция изменения элемента в БД
  Future onUpdate(
      {required String tableName,
      required String column,
      required Map<String, dynamic> model,
      required id}) async {
    var db = await instanse.database;
    await db.transaction((txn) async {
      await txn.update(tableName, model, where: '$column=?', whereArgs: [id]);
    });
    _updateListen();
  }

  Future updateChatUpdatedDate(
      {required int id, required String updatedDate}) async {
    var db = await instanse.database;
    await db.transaction((txn) async {
      await txn.execute('''
      INSERT INTO chats (updated_date)
        VALUES ('$updatedDate')
        WHERE (chat_id = $id)
      ''');

      return await txn.execute('''SELECT * FROM chats
          WHERE 
          (chat_id = $id)
        ''');
    });
  }

// ///Функция создания временной таблицы
// Future onCreateTemp() async {
//   var db = await instanse.database;
//   await db.execute('''
//         CREATE TEMP
//     ''');
//   _updateListen();
// }
  Future close() async {
    var db = await instanse.database;
    _database = null;
    await db.close();
  }

  Future deleteDB() async {
    var db = await instanse.database;
    var databaseFactory = databaseFactoryFfi;
    // var dbPath = await getTemporaryDirectory();
    var dbPath = '.dart_tool/sqflite_common_ffi/databases/';
    var user = UserPath.getUser;
    String path = join(
        dbPath
        // .path
        ,
        user.name + user.userId.toString() + DatabaseConst.dbFileName);
    _database = null;
    await db.close();
    await databaseFactory.deleteDatabase(path);
  }
}
