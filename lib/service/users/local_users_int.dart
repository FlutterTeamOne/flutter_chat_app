import 'package:flutter_chat_app/features/data/models/user_model.dart/user_model.dart';
import 'package:flutter_chat_app/service/lib_db.dart';

abstract class ILocalUsersServices {
  factory ILocalUsersServices() => LocalUsersServices();
  Future<int> createUser(
      {required String name,
      required String email,
      required String registrationDate,
      required String profilePicUrl,
      required int mainUserId});

  Future<List<Map<String, Object?>>> getUserByField(
      {required String field, required String fieldValue});

  Future<int> updateUser(
      {required String newValues, required String condition});

  Future<int> deleteUser({required int id});

  Future<List<UserModel>> getAllUsers();
  Future<int> getUserByLocalId({required int localId});
}

final localUsersServices = ILocalUsersServices();
