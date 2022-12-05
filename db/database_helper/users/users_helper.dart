import 'package:sqflite_common/sqlite_api.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

import 'iusers.dart';

class UsersHelper extends IUsers {

  UsersHelper();

  @override
  createUser({required Database db, required String name, required String email, required String registrationDate, required String profilePicUrl}) async {

    await db.execute('''
      INSERT INTO users (name, email) VALUES (
        $name,
        $email,
        $registrationDate,
        $profilePicUrl
      );
      ''');

    return  await db.rawQuery('''
      SELECT main_users_id FROM users 
      WHERE (
        (name = $name) 
        AND 
        (email = $email)
        AND
        (registration_date = $registrationDate)
        AND
        (profile_pic_url = $profilePicUrl));
    ''');
  }

  @override
  deleteUser({required Database db, required int id}) async {

    return await db.rawDelete('''SELETE FROM users WHERE (main_users_id = id)''');
  }

  @override
  getAllUsers({required Database db}) async {

    return await db.rawQuery('''SELECT * FROM users''');
  }

  @override
  getUserByField({required Database db, required String field, required String fieldValue}) async {

    return await db.rawQuery('''SELECT * FROM users WHERE ($field = $fieldValue)''');
  }

  @override
  updateUser({required Database db, required String newValues, required String condition}) async {

    return await db.rawUpdate('''UPDATE users SET $newValues WHERE ($condition)''');
  }

}