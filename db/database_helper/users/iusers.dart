import '../db_helper.dart';

abstract class IUsers extends DBHelper  {
  IUsers();

  createUser();

  getUserByField();

  updateUser();

  deleteUser();

  getAllUsers();
}