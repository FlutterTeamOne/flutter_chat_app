import 'dart:async';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
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

//название и версия бд
  static const _dbFileName = 'sfera.db';
  static const _dbVersion = 1;

//название таблицы
  static const _tableName = 'User';

//название колонк таблицы
  static const _columnId = 'id';
  static const _columnName = 'name';
  static const _columnEmail = 'email';
  static const _columnProfilePicId = 'profile_pic_id';
  static const _columnAccountCreated = 'account_created';

  ///Инициализация локальной БД. Если ее нет,
  ///то создается новая БД
  Future<Database> initDB() async {
    sqfliteFfiInit();
    var dbFactory = databaseFactoryFfi;
    var dbPath = await dbFactory.getDatabasesPath();
    String path = join(dbPath, _dbFileName);
    return await dbFactory.openDatabase(path,
        options: OpenDatabaseOptions(
          version: _dbVersion,
          onCreate: _onCreate,
        ));
  }

  ///Функция создания начальной таблицы БД
  Future _onCreate(Database db, int version) async {
    await db.transaction((txn) async {
      //Таблица User
      await txn.execute('''
CREATE TABLE $_tableName (
  $_columnId INTEGER PRIMARY KEY,
  $_columnName TEXT NOT NULL,
  $_columnEmail TEXT NOT NULL,
  $_columnProfilePicId INTEGER,
  $_columnAccountCreated DATE)
''');
//Таблица Messages
 await txn.execute('''
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
)
''');
    });
    _updateListen();
  }

  ///Функция считывания/получения данных из БД
  Future onRead() async {
    var db = await instanse.database;
    var user = await db.query(_tableName, orderBy: _columnName);
    user.isNotEmpty
        ? user.map((user) => 'Object().fromMap(user)').toList()
        : [];
    _updateListen();
  }

  ///Добавление данных в БД
  Future onAdd(Map<String, dynamic> model) async {
    var db = await instanse.database;

    await db.insert(_tableName, model);
    _updateListen();
  }

  ///Функция удаления элемента из БД по ID
  Future onDelete(int id) async {
    var db = await instanse.database;
    await db.delete(_tableName, where: '$_columnId=?', whereArgs: [id]);
    _updateListen();
  }

  ///Функция изменения элемента в БД
  Future onUpdate(Map<String, dynamic> model) async {
    var db = await instanse.database;
    var id = model[_columnId];
    await db.update(_tableName, model, where: '$_columnId=?', whereArgs: [id]);
    _updateListen();
  }

  ///Функция создания временной таблицы
  Future onCreateTemp() async {
    var db = await instanse.database;
    await db.execute('''
          CREATE TEMP
      ''');
    _updateListen();
  }
}
