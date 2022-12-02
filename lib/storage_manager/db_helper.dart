import 'dart:async';

import 'package:flutter_chat_app/storage_manager/database_const.dart';
import 'package:path/path.dart';
import 'package:sqflite_common/sqlite_api.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

import '../domain/model/user.dart';

class DBHelper {
  DBHelper._();
  static final DBHelper instanse = DBHelper._();

  static Database? _database;

  ///Обращение к локальной БД извне
  Future<Database> get database async => _database ??= await initDB();

  ///Стрим контроллер, чтоб слушать изменения в БД
  final _updateListenController = StreamController<bool>.broadcast();

  void _updateListen() => _updateListenController.sink.add(true);

  ///Инициализация локальной БД. Если ее нет,
  ///то создается новая БД
  Future<Database> initDB() async {
    sqfliteFfiInit();
    var dbFactory = databaseFactoryFfi;
    var dbPath = await dbFactory.getDatabasesPath();
    String path = join(dbPath, DatabaseConst.dbFileName);
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
CREATE TABLE ${DatabaseConst.user} (
  ${DatabaseConst.columnId} INTEGER PRIMARY KEY AUTOINCREMENT,
  ${DatabaseConst.columnName} char(50) NOT NULL)
''');

//Таблица Messages
      await txn.execute('''
CREATE TABLE ${DatabaseConst.messages} (
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

//Таблица Friends Chat
      await txn.execute('''
CREATE TABLE ${DatabaseConst.friendsChat}(
 ${DatabaseConst.columnId} INTEGER PRIMARY KEY AUTOINCREMENT,
 ${DatabaseConst.columnFirstFriendId} INTEGER NOT NULL,
 ${DatabaseConst.columnSecondFriendId} INTEGER NOT NULL,
 CONSTRAINT FRIENDS_CHAT_FK_77 FOREIGN KEY ( friend1_id ) REFERENCES users ( "id" ),
 CONSTRAINT FRIENDS_CHAT_FK_78 FOREIGN KEY ( friend2_id ) REFERENCES users ( "id" )
)
''');
      //Первичная запись юзера в таблицу
      await txn
          .insert(DatabaseConst.user, {'id': 'User.id', 'name': 'User.name'});
    });
    _updateListen();
  }

  ///Функция считывания/получения данных из БД
  Future onRead({required String tableName, required int id}) async {
    var db = await instanse.database;
    await db.transaction((txn) async {
      await txn.query(tableName,
          where: '${DatabaseConst.columnId}=?', whereArgs: [id]);
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
  Future onDelete({required String tableName, required int id}) async {
    var db = await instanse.database;
    await db.transaction((txn) async {
      await txn.delete(tableName,
          where: '${DatabaseConst.columnId}=?', whereArgs: [id]);
    });
    _updateListen();
  }

  ///Функция изменения элемента в БД
  Future onUpdate(
      {required String tableName, required Map<String, dynamic> model}) async {
    var db = await instanse.database;
    var id = model[DatabaseConst.columnId];
    await db.transaction((txn) async {
      await txn.update(tableName, model,
          where: '${DatabaseConst.columnId}=?', whereArgs: [id]);
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