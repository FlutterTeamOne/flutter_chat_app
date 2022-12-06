import 'dart:async';

import 'package:flutter_chat_app/storage_manager/database_const.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite_common/sqlite_api.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

import '../domain/model/chats.dart';
import '../domain/model/message_id_in_main.dart';
import '../domain/model/messages.dart';
import '../domain/model/model.dart';
import '../domain/model/user.dart';

class DBHelper {
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
    var dbPath = await getTemporaryDirectory();
    print('PATH: ${dbPath.path}');
    String path = join(dbPath.path, DatabaseConst.dbFileName);
    return await dbFactory.openDatabase(path,
        options: OpenDatabaseOptions(
          version: DatabaseConst.dbVersion,
          onCreate: _onCreate,
        ));
  }

  ///Функция создания начальной таблицы БД
  Future _onCreate(Database db, int version) async {
    await db.transaction((txn) async {
      //Таблица User
      await txn.execute('''
CREATE TABLE ${User.table} (
  ${DatabaseConst.columnId} ${DatabaseConst.integer} ${DatabaseConst.primaryKey} ${DatabaseConst.autoincrement},
  ${DatabaseConst.columnName} ${DatabaseConst.char50} ${DatabaseConst.notNull},
  ${DatabaseConst.columnEmail} ${DatabaseConst.char50} ${DatabaseConst.notNull},
  ${DatabaseConst.columnRegistrationDate} ${DatabaseConst.date} ${DatabaseConst.notNull},
  ${DatabaseConst.columnProfilePicLink} ${DatabaseConst.char50} ${DatabaseConst.notNull},
  ${DatabaseConst.columnMainUsersId} ${DatabaseConst.integer} ${DatabaseConst.notNull} ${DatabaseConst.unique}
  )
''');

//Таблица Messages
      await txn.execute('''
CREATE TABLE ${DatabaseConst.messageTable} (
 ${DatabaseConst.columnId} ${DatabaseConst.integer} ${DatabaseConst.primaryKey} ${DatabaseConst.autoincrement},
 ${DatabaseConst.columnLocalChatId} ${DatabaseConst.integer} ${DatabaseConst.notNull},
 ${DatabaseConst.columnDate} ${DatabaseConst.integer} ${DatabaseConst.notNull},
 ${DatabaseConst.columnSenderLocalId} ${DatabaseConst.integer} ${DatabaseConst.notNull},
 ${DatabaseConst.columnIsWrittenToDb} ${DatabaseConst.integer} ${DatabaseConst.notNull} DEFAULT 0,
 ${DatabaseConst.columnContent} ${DatabaseConst.char50} ${DatabaseConst.notNull},
 ${DatabaseConst.constraint} MESSAGES_FK_79 ${DatabaseConst.foreignKey} ( ${DatabaseConst.columnLocalChatId} ) ${DatabaseConst.references} ${Chats.table} ( local_chats_id ),
 ${DatabaseConst.constraint} MESSAGES_FK_80 ${DatabaseConst.foreignKey} ( ${DatabaseConst.columnSenderLocalId} ) ${DatabaseConst.references} ${User.table} ( local_users_id ),
 CHECK ((is_written_to_db = 0) OR (is_written_to_db = 1))
 
)
''');
//CHECK ((sender_is_user = 0) OR (sender_is_user = 1))
//Таблица Messages Id In Main
      await txn.execute('''
CREATE TABLE ${MessageIdInMain.table}
(
 ${DatabaseConst.columnId} ${DatabaseConst.integer} ${DatabaseConst.primaryKey} ${DatabaseConst.autoincrement},
 ${DatabaseConst.columnLocalMessagesId} ${DatabaseConst.integer} ${DatabaseConst.notNull} ${DatabaseConst.unique}
)
''');
//Таблица Chats
      await txn.execute('''
CREATE TABLE ${Chats.table}(
 ${DatabaseConst.columnId} ${DatabaseConst.integer} ${DatabaseConst.primaryKey} ${DatabaseConst.autoincrement},
 ${DatabaseConst.columnChatIdMain} ${DatabaseConst.integer} ${DatabaseConst.notNull} ${DatabaseConst.unique},
 ${DatabaseConst.columnFriendId} ${DatabaseConst.integer} ${DatabaseConst.notNull},
 ${DatabaseConst.constraint} CHATS_FK_84 ${DatabaseConst.foreignKey} ( ${DatabaseConst.columnFriendId} ) ${DatabaseConst.references} ${User.table} ( local_users_id )
)
''');

      await txn.execute('''
CREATE INDEX CHATS_FK_3 ON ${Chats.table}
(
 ${DatabaseConst.columnFriendId}
)
''');
      await txn.execute('''
CREATE INDEX MESSAGES_FK_2 ON ${DatabaseConst.messageTable}
(
 ${DatabaseConst.columnLocalChatId}
);
''');
      await txn.execute('''
CREATE INDEX MESSAGE_ID_IN_MAIN_FK_1 ON ${MessageIdInMain.table}
(
 ${DatabaseConst.columnLocalMessagesId}
)
''');

      // //Первичная запись юзера в таблицу
      // await txn.insert(User.table, {'id': 'User.id', 'name': 'User.name'});
    });
    _updateListen();
  }

  ///Функция считывания/получения данных из БД
  Future onRead({required String tableName, required Model model}) async {
    var db = await instanse.database;
    await db.transaction((txn) async {
      await txn.query(tableName,
          where: '${DatabaseConst.columnId}=?', whereArgs: [model.id]);
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
  Future onDelete({required String tableName, required Model model}) async {
    var db = await instanse.database;
    await db.transaction((txn) async {
      await txn.delete(tableName,
          where: '${DatabaseConst.columnId}=?', whereArgs: [model.id]);
    });
    _updateListen();
  }

  ///Функция изменения элемента в БД
  Future onUpdate({required String tableName, required Model model}) async {
    var db = await instanse.database;
    await db.transaction((txn) async {
      await txn.update(tableName, model.toJson(),
          where: '${DatabaseConst.columnId}=?', whereArgs: [model.id]);
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