import 'package:server/src/generated/grpc_manager.pb.dart';

import '../../../library/library_server.dart';

class UsersServices implements IUsersServices {
  @override
  createUser(
      {required String name,
      required String email,
      required String registrationDate,
      required String profilePicUrl}) async {
    var db = await dbServerServices.openDatabase();

    await db.execute('''
      INSERT INTO users (name, email) VALUES (
        $name,
        $email,
        $registrationDate,
        $profilePicUrl
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
        (profile_pic_url = $profilePicUrl));
    ''');
  }

  @override
  deleteUser({required int id}) async {
    var db = await dbServerServices.openDatabase();

    return await db
        .rawDelete('''SELETE FROM users WHERE (main_users_id = id)''');
  }

  @override
  getAllUsers() async {
    var db = await dbServerServices.openDatabase();

    //тут json
    var users = await db.rawQuery('''SELECT * FROM users''');

    ///
    ///Преобразовать json в List<User>
    ///
    ///Где User {
    ///string name = 1;
    ///int32 id = 2;}
    ///
    ///Таблица Users находится в server/lib/src/db_server/services/database_impl.dart
    ///c 30 строки название колонок в таблице юзерс
    ///
    ///
    ///Проверка запроса осуществляется в server/lib/src/test_db/test.dart
    List<User> usersList = [];
    final user = User();
    // usersList.  ;
    print(user.name);
    // for (var element in User(id: , name: )) {
    // final a =
    // usersList.add(value)
    // }
    // return usersList;
  }

  @override
  getUserByField({required String field, required String fieldValue}) async {
    var db = await dbServerServices.openDatabase();

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
