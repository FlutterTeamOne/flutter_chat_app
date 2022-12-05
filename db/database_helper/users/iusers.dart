import '../db_helper.dart';

abstract class IUsers extends DBHelper  {
  IUsers();

  createUser({required String name, required String email, required String registrationDate, required String profilePicUrl});

  getUserByField({required String field, required String fieldValue});

  updateUser({required String newValues, required String condition});

  deleteUser({required int id});

  getAllUsers();

}