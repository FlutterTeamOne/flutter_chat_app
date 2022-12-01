import 'dart:async';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite_common/sqlite_api.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

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
    String path = join(dbPath, 'sfera.db');
    return await dbFactory.openDatabase(
      path,
      options: OpenDatabaseOptions(
        version: 1,
        onCreate: _onCreate,
      ),
    );
  }

  ///Функция создания начальной таблицы БД
  Future _onCreate(Database db, int version) async {
    db.execute('''
CREATE TABLE User (
  id INTEGER PRIMARY KEY,
  name TEXT NOT NULL,
  email TEXT NOT NULL,
  profile_pic_id INTEGER,
  account_created DATE)
''');
    _updateListen();
  }

  ///Функция считывания/получения данных из БД
  Future onRead() async {
    var db = await instanse.database;
    var user = await db.query('User', orderBy: 'name');
    user.isNotEmpty
        ? user.map((user) => 'Object().fromMap(user)').toList()
        : [];
    _updateListen();
  }

  ///Добавление данных в БД
  Future onAdd() async {
    var db = await instanse.database;

    await db.insert('table', {});
    _updateListen();
  }

  ///Функция удаления элемента из БД по ID
  Future onDelete(int id) async {
    var db = await instanse.database;
    db.delete('', where: 'id = ?', whereArgs: [id]);
    _updateListen();
  }

  ///Функция изменения элемента в БД
  Future onUpdate(Object object) async {
    var db = await instanse.database;
    db.update('', {});
    _updateListen();
  }

  ///Функция создания временной таблицы
  Future onCreateTemp() async {
    var db = await instanse.database;
    db.execute('''
          CREATE TEMP
      ''');
    _updateListen();
  }
}
