import 'dart:async';

import '../../../src/constants/app_data_constants.dart';

import '../../../src/constants/db_constants.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite_common/sqlite_api.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class DBHelperStart {
  //Singleton
  DBHelperStart._();
  static final DBHelperStart instanse = DBHelperStart._();

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
    //var dbPath = await getTemporaryDirectory();
    var dbPath = AppDataConstants.dbDirectory;
    // print('PATH_start: ${dbPath.path}');
    // String path = join(dbPath.path, DatabaseConst.dbFileNameStart);
    String path = join(dbPath, DatabaseConst.dbFileNameStart);
    print('PATH_absolute: ${path}');
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
CREATE TABLE ${DatabaseConst.userTable} (
  ${DatabaseConst.usersColumnUserId} ${DatabaseConst.integer} ${DatabaseConst.primaryKey},
  ${DatabaseConst.usersColumnName} ${DatabaseConst.char50} ${DatabaseConst.notNull},
  ${DatabaseConst.usersColumnEmail} ${DatabaseConst.char50} ${DatabaseConst.notNull},
  ${DatabaseConst.usersColumnProfilePicLink} ${DatabaseConst.char50} ${DatabaseConst.notNull},
  ${DatabaseConst.usersColumnCreatedDate} ${DatabaseConst.char26} ${DatabaseConst.notNull},
  ${DatabaseConst.usersColumnUpdatedDate} ${DatabaseConst.char26} ${DatabaseConst.notNull},
  ${DatabaseConst.usersColumnDeletedDate} ${DatabaseConst.char26}
  )
''');
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

  Future deleteDB([String? testPath]) async {
    var db = await instanse.database;
    var databaseFactory = databaseFactoryFfi;
    
    _database = null;
    await db.close();
    await databaseFactory.deleteDatabase(db.path);
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
