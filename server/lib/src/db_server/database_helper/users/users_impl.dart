import 'package:sqflite_common/sqlite_api.dart';

import '../../../library/library_server.dart';

class UsersServices implements IUsersServices {
  @override
  createUser(
      {required String name,
      required String email,
      required String createdDate,
      required String profilePicUrl,
      required String updatedDate,
      required String password,
      String? deletedDate,
      int? hashConnect, 
      }) async {
    Database db = await DbServerServices.instanse.database;

    await db.execute('''
      INSERT INTO users (name, email, created_date, profile_pic_url, updated_date, password) VALUES (
        $name,
        $email,
        $createdDate,
        $profilePicUrl,
        $createdDate,
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
        (created_date = $createdDate)
        AND
        (profile_pic_url = $profilePicUrl)
        AND
        (updated_date = $updatedDate)
        AND
        (password = $password)
        );
    ''');
  }

  @override
  deleteUser({required int id}) async {
    Database db = await DbServerServices.instanse.database;

    return await db
        .rawDelete('''SELETE FROM users WHERE (main_users_id = id)''');
  }

  @override
  getAllUsers() async {
    Database db = await DbServerServices.instanse.database;

    return await db.rawQuery('''SELECT * FROM users''');
  }

  @override
  Future<List<Map<String, Object?>>> getUser({required int id}) async {
    Database db = await DbServerServices.instanse.database;

    return await db.rawQuery(
        '''SELECT user_id, updated_date, deleted_date FROM users WHERE (user_id = $id)''');
  }

  @override
  Future<List<Map<String, Object?>>> getUserById(
      {required String field, required Object fieldValue}) async {
    Database db = await DbServerServices.instanse.database;

    return await db
        .rawQuery('''SELECT * FROM users WHERE ($field = $fieldValue)''');
  }

  @override
  updateUser({required String newValues, required String condition}) async {
    Database db = await DbServerServices.instanse.database;

    return await db
        .rawUpdate('''UPDATE users SET $newValues WHERE ($condition)''');
  }

  @override
  getUserByField({required String field, required Object fieldValue}) {
    // TODO: implement getUserByField
    throw UnimplementedError();
  }
}
