import '../../../library/library_server.dart';

abstract class IUsersServices {
  factory IUsersServices() => UsersServices();

  createUser({
    required String name,
    required String email,
    required String createdDate,
    required String profilePicUrl,
    required String updatedDate,
    required String password,
    String? deletedDate,
    int? hashConnect,
  });

  getUserByField({required String field, required Object fieldValue});

  updateUser({required String newValues, required String condition});

  deleteUser({required int id});
  Future<List<Map<String, Object?>>> getUser({required int id});
  getAllUsers();
}

final usersServices = IUsersServices();
