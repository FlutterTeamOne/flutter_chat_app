import 'package:flutter_chat_app/client/grpc_client.dart';
import 'package:flutter_chat_app/service/lib_db.dart';

abstract class ILocalUsersServices {
  factory ILocalUsersServices() =>
      LocalUsersServices(channel: GrpcClient().channel);
  createUser(
      {required String name,
      required String email,
      required String registrationDate,
      required String profilePicUrl,
      required int mainUserId});

  getUserByField({required String field, required String fieldValue});

  updateUser({required String newValues, required String condition});

  deleteUser({required int id});

  getAllUsers();
}

final localUsersServices = ILocalUsersServices();
