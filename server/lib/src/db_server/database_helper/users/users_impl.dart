import 'package:sqflite_common/sqlite_api.dart';

import '../../../library/library_server.dart';

class UsersServices implements IUsersServices {
  @override
  createUser(
      {required String name,
      required String email,
      required String registrationDate,
      required String profilePicUrl,
      required String password}) async {
    var db = await dbServerServices.openDatabase();

    await db.execute('''
      INSERT INTO users (name, email) VALUES (
        $name,
        $email,
        $registrationDate,
        $profilePicUrl,
        $password
      );
      ''');

    return await db.rawQuery('''
      SELECT main_users_id FROM users 
      WHERE (
        (name = $name) 
        AND 
        (email = $email)
        AND
        (registration_date = $registrationDate)
        AND
        (profile_pic_url = $profilePicUrl)
        AND
        (password = $password)
        );
    ''');
  }

  @override
  deleteUser({required Database db, required int id}) async {
    var db = await db.instance.database;
    //bla bla blaaaaaaaaaaaaaaaa

    return await db
        .rawDelete('''SELETE FROM users WHERE (main_users_id = id)''');
  }

  @override
  getAllUsers() async {
    var db = await dbServerServices.openDatabase();

    return await db.rawQuery('''SELECT * FROM users''');
  }

  @override
  getUserByField({required String field, required Object fieldValue}) async {
    var db = await dbServerServices.openDatabase();
    var s = await db
        .rawQuery('''SELECT * FROM users WHERE ($field = $fieldValue)''');
    return await db
        .rawQuery('''SELECT * FROM users WHERE ($field = $fieldValue)''');
  }

  @override
  updateUser({required String newValues, required String condition}) async {
    var db = await dbServerServices.openDatabase();

    return await db
        .rawUpdate('''UPDATE users SET $newValues WHERE ($condition)''');
  }
}
