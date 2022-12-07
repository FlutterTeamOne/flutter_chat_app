import 'package:server_bd/src/db_server/database_helper/library_db.dart';

abstract class IUsersServices {
  factory IUsersServices() => UsersServices();

  createUser(
      {required String name,
      required String email,
      required String registrationDate,
      required String profilePicUrl});

  getUserByField({required String field, required String fieldValue});

  updateUser({required String newValues, required String condition});

  deleteUser({required int id});

  getAllUsers();
}

final usersServices = IUsersServices();
