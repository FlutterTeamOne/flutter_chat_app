import 'package:chat_app/modules/signal_service/river/synch_user_ref/synch_state_ref.dart';
import 'package:chat_app/modules/storage_manager/db_helper/user_path.dart';
import 'package:chat_app/src/libraries/library_all.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../src/generated/grpc_lib/grpc_sync_lib.dart';

class SynchUserNotifier extends StateNotifier<SynchStateRef> {
  late LocalUsersServices _usersServices;

  SynchUserNotifier() : super(SynchStateRef()) {
    _usersServices = LocalUsersServices();
  }

  Future readUser() async {
    var users = <UserDto>[];

    List<Map<String, Object?>> usersForUpdate =
        await _usersServices.getAllUserIdAndUpdatedStarted();
    List<UserRequest> usersRequest = [];
    if (usersForUpdate.isNotEmpty) {
      print("lastID ${usersForUpdate.last['user_id']}");
      for (var user in usersForUpdate) {
        usersRequest.add(UserRequest(
            userId: user['user_id'] as int,
            updatedDate: user['updated_date'] as String));
      }
    }
    //подключаемся к серверу
    var stub = GrpcSynchronizationClient(GrpcClient().channel);
    var usersResponse = UsersResponse();
    //отправляем запрос на сервер и получаем всех юзеров
    try {
      usersResponse = await stub.sync(UsersRequest(
          mainUser: UserPref.getUserId, usersForUpdate: usersRequest));
    } catch (e) {
      print(e);
    }
    print("UsersServ NEW ${usersResponse.usersNew}");
    print("UsersServ UPDATED ${usersResponse.usersUpdated}");
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
//получаем всех начальных юзеров
    users = await _usersServices.getAllUsersStart();
   return state = state.copyWith(users: users);
  }
}
