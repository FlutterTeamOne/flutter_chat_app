import 'package:server/src/generated/grpc_manager.pb.dart';
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
    Database db = await DbServerServices.instanse.database;

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
  deleteUser({required int id}) async {
    Database db = await DbServerServices.instanse.database;

    return await db
        .rawDelete('''SELETE FROM users WHERE (main_users_id = id)''');
  }

  @override
  Future getAllUsers() async {
    Database db = await DbServerServices.instanse.database;

    //тут json
    var users = await db.rawQuery(
        '''SELECT user_id, name, email, profile_pic_url FROM users''');

    return users;
    // List<User> userList = [];

    // for (var user in users) {
    //Косяк тут был)
    //   user.forEach((key, value) => userList.add(User(
    //       id: user['user_id'] as int,
    //       name: user['name'] as String,
    //       email: user['email'] as String,
    //       picture: user['profile_pic_url'] as String)));
    // }

    // return Users(users: userList);
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
