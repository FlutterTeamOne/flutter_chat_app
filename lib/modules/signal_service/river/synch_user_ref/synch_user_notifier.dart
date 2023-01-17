import 'dart:io';

import 'package:chat_app/modules/client/custom_exception.dart';
import 'package:chat_app/modules/signal_service/river/synch_user_ref/synch_state_ref.dart';
import 'package:chat_app/modules/storage_manager/db_helper/user_path.dart';
import 'package:chat_app/src/libraries/library_all.dart';
import 'package:chat_app/ui/widgets/registration_page/models/new_user_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grpc/grpc.dart';
import 'package:logger/logger.dart';

import '../../../../src/generated/grpc_lib/grpc_sync_lib.dart';
import '../../../../src/generated/grpc_lib/grpc_user_lib.dart';

class SynchUserNotifier extends StateNotifier<SynchStateRef> {
  late LocalUsersServices _usersServices;
  late GrpcUsersClient stub;
  static final Logger _logger = Logger();

  SynchUserNotifier() : super(SynchStateRef()) {
    _usersServices = LocalUsersServices();

    stub = GrpcUsersClient(GrpcClient().channel,
        options: CallOptions(timeout: const Duration(seconds: 30)));
  }

  Future readUser() async {
    var users = <UserDto>[];

    List<Map<String, Object?>> usersForUpdate =
        await _usersServices.getAllUserIdAndUpdatedStart();
    List<UserRequest> usersRequest = [];
    if (usersForUpdate.isNotEmpty) {
      _logger.d("lastID ${usersForUpdate.last['user_id']}");
      for (var user in usersForUpdate) {
        usersRequest.add(UserRequest(
            userId: user['user_id'] as int,
            updatedDate: user['updated_date'] as String));
      }
    }
    //подключаемся к серверу

    var usersResponse = UsersResponse();
    //отправляем запрос на сервер и получаем всех юзеров
    try {
      var stub = GrpcSynchronizationClient(GrpcClient().channel);
      usersResponse = await stub.sync(UsersRequest(
          mainUser: UserPref.getUserId, usersForUpdate: usersRequest));
    } on GrpcError catch (e) {
      _logger.e("ERROR GRPC SYNH: $e");
      users = await _usersServices.getAllUsersStart();
      state = state.copyWith(users: users);
      throw CustomException(e.toString());
    } catch (e) {
      _logger.e("ERROR SYNH: $e");

      users = await _usersServices.getAllUsersStart();
      state = state.copyWith(users: users);
      throw CustomException(e.toString());
    }
    _logger.d("UsersServ NEW ${usersResponse.usersNew}");
    _logger.d("UsersServ UPDATED ${usersResponse.usersUpdated}");

    for (var user in usersResponse.usersNew) {
      //парсим всех юзеров и записываем их в локальное дб
      await _usersServices.createUserStart(
          userId: user.userId,
          name: user.name,
          email: user.email,
          createdDate: user.createdDate,
          updatedDate: user.updateDate,
          deletedDate: user.deletedDate,
          profilePicUrl: user.picture);
    }
    for (var user in usersResponse.usersUpdated) {
      await _usersServices.updateUserStart(
          newValues: '''name = "${user.name}",
                          email = "${user.email}",
                          created_date = "${user.createdDate}",
                          updated_date = "${user.updateDate}",
                          deleted_date = "${user.deletedDate}",
                          profile_pic_link = "${user.picture}"''',
          condition: 'user_id = ${user.userId}');
    }
    users = await _usersServices.getAllUsersStart();
    return state = state.copyWith(users: users);
    //получаем всех начальных юзеров
  }

  Future<void> createUser({required NewUserModel user}) async {
    CreateUserRequest request = CreateUserRequest(
        name: user.name,
        email: user.email,
        profilePicUrl: user.profilePicLink,
        password: user.password,
        dateCreated: user.registrationDate);

    CreateUserResponse response = CreateUserResponse();
    UserDto newUser;
    try {
      response = await stub.createUser(request);
      newUser = UserDto(
          userId: response.id,
          name: response.name,
          email: response.email,
          createdDate: response.dateCreated,
          profilePicLink: response.profilePicUrl,
          updatedDate: response.dateCreated);
      await LocalUsersServices().createUserStart(
          userId: newUser.userId!,
          name: newUser.name,
          email: newUser.email,
          createdDate: newUser.createdDate,
          updatedDate: newUser.updatedDate,
          profilePicUrl: newUser.profilePicLink);
    } on GrpcError catch (e) {
      _logger.e("GRPC ERROR CreateUser: $e");
      throw CustomException(e.message.toString());
    } on SocketException catch (e) {
      _logger.e("Socket ERROR CreateUser: $e");

      throw CustomException(e.toString());
    } catch (e) {
      _logger.e("ERROR CreateUser: $e");

      throw CustomException(e.toString());
    }
    _logger.v('CREATE USER FROM GRPC CLIENT RESPONSE: ${response.toString()}');

    state = state.copyWith(newUser: newUser);
  }

  Future<bool> confirmPassword(
      {required int userId, required String password}) async {
    PasswordResponse response;
    GrpcUsersClient stub = GrpcUsersClient(GrpcClient().channel);
    try {
      response = await stub.confirmPassword(
          PasswordConfirmRequest(userId: userId, password: password));
      _logger.v('RESULT: $response');
    } on GrpcError catch (e) {
      _logger.e('ERROR CONFIRM PASSWORD GRPC_CLIENT: $e');
      throw CustomException(e.message.toString());
    }
    return response.ok;
  }
}
