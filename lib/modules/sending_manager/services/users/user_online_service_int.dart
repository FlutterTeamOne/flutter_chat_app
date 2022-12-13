import 'user_online_service_impl.dart';

abstract class IUserOnlineService {
  factory IUserOnlineService() => UserOnlinveService();

  Future getUserStatus({required int localUsersId});
  Future setUserStatus(
      {required int localUsersId,
      required String lastTimeOnline,
      required int isOnline});
}
