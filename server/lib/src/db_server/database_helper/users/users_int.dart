import '../../../library/library_server.dart';

abstract class IUsersServices {
  factory IUsersServices() => UsersServices();

  createUser(
      {required String name,
      required String email,
      required String createdDate,
      required String profilePicUrl,
      required String password,
      required String updatedDate});

  getUserByField({required String field, required Object fieldValue});

  updateUser({required String newValues, required String condition});

  deleteUser({required int id});
  Future<List<Map<String, Object?>>> getUser({required int id});
  getAllUsers();
  Future<List<Map<String, Object?>>> getAllUsersMoreId({required int id});
  getUserIdByChat({required int senderId, required int chatId});
  getHashCodeById({required int id});
  getUpdatedUsers({required List<UserRequest> users});
}

final usersServices = IUsersServices();
