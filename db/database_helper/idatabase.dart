import 'package:sqflite_common/sqlite_api.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

abstract class IDatabase {
  IDatabase();

  openDatabase();
}