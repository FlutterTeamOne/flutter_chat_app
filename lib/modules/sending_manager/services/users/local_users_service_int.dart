import '../../../../domain/data/library/library_data.dart';
import '../../library/library_sending_manager.dart';

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

  Future<List<UserDto>> getAllUsers();
  Future<int> getMainIdUserByLocalId({required int localId});
  Future<UserDto> getUserByLocalId({required int localId});
}

final localUsersServices = ILocalUsersServices();
