import 'package:chat_app/modules/sending_manager/services/users/user_online_service_int.dart';
import 'package:chat_app/modules/storage_manager/db_helper/db_helper.dart';
import 'package:chat_app/src/constants/db_constants.dart';

class UserOnlinveService implements IUserOnlineService {
  @override
  Future<List<Map<String, Object?>>> getUserStatus(
      {required int localUsersId}) async {
    var db = await DBHelper.instanse.database;
    return await db.query(DatabaseConst.userLastTimeOnlineTable,
        where: '${DatabaseConst.usersColumnId}=$localUsersId');
  }

  @override
  Future setUserStatus(
      {required int localUsersId,
      required String lastTimeOnline,
      required int isOnline}) async {
    var db = await DBHelper.instanse.database;
    var userStatus = {
      DatabaseConst.userLastTimeOnlineColumnId: localUsersId,
      DatabaseConst.userLastTimeOnlineColumnLastTimeOnline: lastTimeOnline,
      DatabaseConst.userLastTimeOnlineColumnisOnline: isOnline
    };
    await db.insert(DatabaseConst.userLastTimeOnlineTable, userStatus);
  }
}
