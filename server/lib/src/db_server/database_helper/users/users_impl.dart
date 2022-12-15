import 'package:sqflite_common/sqlite_api.dart';

import '../../../library/library_server.dart';

class UsersServices implements IUsersServices {
  @override
  createUser({
    required String name,
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
        '$name',
        '$email',
        '$createdDate',
        '$profilePicUrl',
        '$createdDate',
        '$password'
      );
      ''');

    return await db.rawQuery('''
      SELECT * FROM users 
      WHERE (
        (name = '$name') 
        AND 
        (email = '$email')
        AND
        (created_date = '$createdDate')
        AND
        (profile_pic_url = '$profilePicUrl')
        AND
        (updated_date = '$updatedDate')
        AND
        (password = '$password')
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

    return await db.rawQuery('''SELECT user_id, hash_connect FROM users''');
  }

  @override
  Future<List<Map<String, Object?>>> getUser({required int id}) async {
    Database db = await DbServerServices.instanse.database;

    return await db.rawQuery(
        '''SELECT * FROM users WHERE (user_id = $id)''');
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

  @override
  getUserIdByChat({required int senderId, required int chatId}) async {
    Database db = await DbServerServices.instanse.database;

    var friends = await db.rawQuery('''SELECT friend1_id, friend2_id 
        FROM chats 
        WHERE chat_id = $chatId''');
    return friends[0]['friend1_id'] == senderId
        ? friends[0]['friend2_id'] as int
        : friends[0]['friend1_id'] as int;
  }

  @override
  getHashCodeById({required int id}) async {
    Database db = await DbServerServices.instanse.database;

    var hash = await db.rawQuery('''SELECT hash_connect 
        FROM users 
        WHERE user_id = $id''');
    return hash[0]['hash_connect'] as int;
  }
}
