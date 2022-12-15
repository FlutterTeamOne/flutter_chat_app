import 'dart:async';
import 'package:chat_app/domain/data/dto/user_dto/user_dto.dart';

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
  Future<Database> initDB({UserDto? user}) async {
    sqfliteFfiInit();
    var dbFactory = databaseFactoryFfi;
    // var dbPath = await dbFactory.getDatabasesPath();
    var dbPath = await getTemporaryDirectory();
    // print('PATH: ${dbPath.path}');
    String path = join('dbPath, ${user!.name}', '${DatabaseConst.dbFileName}_${user.name}.db');
    return await dbFactory.openDatabase(path,
        options: OpenDatabaseOptions(
          version: DatabaseConst.dbVersion,
          onCreate: _onCreate,
        ));
  }

  ///Функция создания начальной таблицы БД
  Future _onCreate(Database db, int version, {UserDto? user}) async {
    await db.transaction((txn) async {
      //Таблица User
      await txn.execute('''
CREATE TABLE ${DatabaseConst.userTable} (
  ${DatabaseConst.usersColumnId} ${DatabaseConst.integer} ${DatabaseConst.primaryKey} ${DatabaseConst.autoincrement},
  ${DatabaseConst.usersColumnName} ${DatabaseConst.char50} ${DatabaseConst.notNull},
  ${DatabaseConst.usersColumnEmail} ${DatabaseConst.char50} ${DatabaseConst.notNull},
  ${DatabaseConst.usersColumnProfilePicLink} ${DatabaseConst.char50} ${DatabaseConst.notNull},
  ${DatabaseConst.usersColumnMainUsersId} ${DatabaseConst.integer} ${DatabaseConst.notNull} ${DatabaseConst.unique},
  ${DatabaseConst.usersColumnCreatedDate} ${DatabaseConst.char26} ${DatabaseConst.notNull},
  ${DatabaseConst.usersColumnUpdatedDate} ${DatabaseConst.char26} ${DatabaseConst.notNull},
  ${DatabaseConst.usersColumnsDeletedDate} ${DatabaseConst.char26}
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
 ${DatabaseConst.chatsColumnLocalChatId} ${DatabaseConst.integer} ${DatabaseConst.primaryKey} ${DatabaseConst.autoincrement},
 ${DatabaseConst.chatsColumnUserId} ${DatabaseConst.integer} ${DatabaseConst.notNull} ${DatabaseConst.unique},
 ${DatabaseConst.chatsColumnCreatedDate} ${DatabaseConst.char26} ${DatabaseConst.notNull},
 ${DatabaseConst.chatsColumnUpdatedDate} ${DatabaseConst.char26},
 ${DatabaseConst.chatsColumnDeletedDate} ${DatabaseConst.char26},
 ${DatabaseConst.constraint} CHATS_FK_84 ${DatabaseConst.foreignKey} ( ${DatabaseConst.chatsColumnUserId} ) ${DatabaseConst.references} ${DatabaseConst.userTable} ( local_users_id )
)
''');

//Таблица Messages
      await txn.execute('''
CREATE TABLE ${DatabaseConst.messageTable} (
 ${DatabaseConst.messagesColumnLocalMessagesId} ${DatabaseConst.integer} ${DatabaseConst.primaryKey} ${DatabaseConst.autoincrement},
 ${DatabaseConst.messagesColumnLocalChatId} ${DatabaseConst.integer} ${DatabaseConst.notNull},
 ${DatabaseConst.messagesColumnCreatedDate} ${DatabaseConst.char26} ${DatabaseConst.notNull},
 ${DatabaseConst.messagesColumnSenderLocalId} ${DatabaseConst.integer} ${DatabaseConst.notNull},
 ${DatabaseConst.messagesColumnMessageId} ${DatabaseConst.integer},
 ${DatabaseConst.messagesColumnIsRead} ${DatabaseConst.integer} ${DatabaseConst.notNull} DEFAULT 0,
 ${DatabaseConst.messagesColumnContent} ${DatabaseConst.char50} ${DatabaseConst.notNull},
 ${DatabaseConst.messagesColumnUpdatedDate} ${DatabaseConst.char26} ${DatabaseConst.notNull},
 ${DatabaseConst.messagesColumnDeletedDate} ${DatabaseConst.char26}, 
 ${DatabaseConst.constraint} MESSAGES_FK_79 ${DatabaseConst.foreignKey} ( ${DatabaseConst.messagesColumnLocalChatId} ) ${DatabaseConst.references} ${DatabaseConst.chatsTable} ( local_chats_id ),
 ${DatabaseConst.constraint} MESSAGES_FK_80 ${DatabaseConst.foreignKey} ( ${DatabaseConst.messagesColumnSenderLocalId} ) ${DatabaseConst.references} ${DatabaseConst.userTable} ( local_users_id ),
 CHECK ((is_read = 0) OR (is_read = 1))
 CHECK ((sender_is_user = 0) OR (sender_is_user = 1))
 CHECK (LENGTH(${DatabaseConst.messagesColumnCreatedDate}) = 26)
)
''');

      await txn.execute('''
CREATE INDEX CHATS_FK_3 ON ${DatabaseConst.chatsTable}
(
 ${DatabaseConst.chatsColumnUserId}
)
''');
      await txn.execute('''
CREATE INDEX MESSAGES_FK_2 ON ${DatabaseConst.messageTable}
(
 ${DatabaseConst.chatsColumnLocalChatId}
);
''');
      await txn.execute('''
CREATE INDEX MAIN_USER_FK_1 ON ${DatabaseConst.mainUserTable}
(
 ${DatabaseConst.usersColumnId}
)
''');

      await txn.insert(
        DatabaseConst.userTable,
        {
          'name': 'test1',
          'email': 't1@t1.t1',
          DatabaseConst.usersColumnProfilePicLink:
              'https://music.mathwatha.com/wp-content/uploads/2017/08/tonyprofile-300x300.jpg',
          DatabaseConst.usersColumnCreatedDate:
              DateTime.now().toIso8601String(),
          DatabaseConst.usersColumnMainUsersId: 1,
          DatabaseConst.usersColumnUpdatedDate:
              DateTime.now().toIso8601String(),
        },
      );
      // await txn.insert(
      //   DatabaseConst.userTable,
      //   {
      //     'name': 'test1',
      //     'email': 't1@t1.t1',
      //     DatabaseConst.usersColumnProfilePicLink:
      //         'https://music.mathwatha.com/wp-content/uploads/2017/08/tonyprofile-300x300.jpg',
      //     DatabaseConst.usersColumnCreatedDate:
      //         DateTime.now().toIso8601String(),
      //     DatabaseConst.usersColumnMainUsersId: 1,
      //     DatabaseConst.usersColumnUpdatedDate:
      //         DateTime.now().toIso8601String(),
      //   },
      // );
      // await txn.insert(
      //   DatabaseConst.userTable,
      //   {
      //     'name': 'test2',
      //     'email': 't2@t2.t2',
      //     DatabaseConst.usersColumnProfilePicLink:
      //         'https://music.mathwatha.com/wp-content/uploads/2017/08/tonyprofile-300x300.jpg',
      //     DatabaseConst.usersColumnCreatedDate:
      //         DateTime.now().toIso8601String(),
      //     DatabaseConst.usersColumnMainUsersId: 2,
      //     DatabaseConst.usersColumnUpdatedDate:
      //         DateTime.now().toIso8601String(),
      //   },
      // );
      await txn.insert(
        DatabaseConst.chatsTable,
        {
          DatabaseConst.chatsColumnUserId: 2,
          DatabaseConst.chatsColumnCreatedDate:
              DateTime.now().toIso8601String(),
          DatabaseConst.chatsColumnUpdatedDate:
              DateTime.now().toIso8601String(),
        },
      );
      await txn.insert(DatabaseConst.mainUserTable, {
        DatabaseConst.mainUserColumnKey: '',
        DatabaseConst.mainUserColumnUserId: 1,
        DatabaseConst.mainUserColumnDataSync: DateTime.now().toIso8601String(),
      });
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

// ///Функция создания временной таблицы
// Future onCreateTemp() async {
//   var db = await instanse.database;
//   await db.execute('''
//         CREATE TEMP
//     ''');
//   _updateListen();
// }
}
