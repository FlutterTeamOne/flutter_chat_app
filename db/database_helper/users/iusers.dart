import 'package:sqflite_common/sqlite_api.dart';

import '../db_helper.dart';

abstract class IUsers extends DBHelper  {
  IUsers();

  createUser({required Database db, required String name, required String email, required String registrationDate, required String profilePicUrl});

  getUserByField({required Database db, required String field, required String fieldValue});

  updateUser({required Database db, required String newValues, required String condition});

  deleteUser({required Database db, required int id});

  getAllUsers({required Database db});

}