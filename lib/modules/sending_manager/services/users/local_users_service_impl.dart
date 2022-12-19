import 'package:chat_app/modules/storage_manager/db_helper/db_helper_start.dart';

import '../../../../src/constants/db_constants.dart';
import '../../../../domain/data/library/library_data.dart';
import '../../library/library_sending_manager.dart';
import '../../../storage_manager/library/library_storage_manager.dart';

class LocalUsersServices implements ILocalUsersServices {
  LocalUsersServices();

  @override
  Future<int> createUser({
    required int userId,
    required String name,
    required String email,
    required String createdDate,
    required String updatedDate,
    String? deletedDate,
    required String profilePicUrl,
  }) async {
    var db = await DBHelper.instanse.database;

    return await db.insert(DatabaseConst.userTable, {
      DatabaseConst.usersColumnUserId: userId,
      DatabaseConst.usersColumnName: name,
      DatabaseConst.usersColumnEmail: email,
      DatabaseConst.usersColumnCreatedDate: createdDate,
      DatabaseConst.usersColumnUpdatedDate: updatedDate,
      DatabaseConst.usersColumnDeletedDate: deletedDate ?? '',
      DatabaseConst.usersColumnProfilePicLink: profilePicUrl,
    });
  }

  @override
  Future<int> createUserStart({
    required int userId,
    required String name,
    required String email,
    required String createdDate,
    required String updatedDate,
    String? deletedDate,
    required String profilePicUrl,
  }) async {
    var db = await DBHelperStart.instanse.database;

    return await db.insert(DatabaseConst.userTable, {
      DatabaseConst.usersColumnUserId: userId,
      DatabaseConst.usersColumnName: name,
      DatabaseConst.usersColumnEmail: email,
      DatabaseConst.usersColumnCreatedDate: createdDate,
      DatabaseConst.usersColumnUpdatedDate: updatedDate,
      DatabaseConst.usersColumnDeletedDate: deletedDate ?? '',
      DatabaseConst.usersColumnProfilePicLink: profilePicUrl,
    });
  }

  @override
  Future<int> deleteUser({required int id}) async {
    var db = await DBHelper.instanse.database;
    return await db.rawDelete(
        'DELETE FROM ${DatabaseConst.userTable} WHERE ${DatabaseConst.usersColumnUserId}=?',
        [id]);
  }

  @override
  Future<List<UserDto>> getAllUsers() async {
    var db = await DBHelper.instanse.database;
    var users = await db.rawQuery('''
              SELECT *
              FROM ${DatabaseConst.userTable}
              ''');
    return users.map((item) => UserDto.fromMap(item)).toList();
  }

  @override
  Future<List<UserDto>> getAllUsersStart() async {
    var db = await DBHelperStart.instanse.database;
    var users = await db.rawQuery('''
              SELECT *
              FROM ${DatabaseConst.userTable}
              ''');
    return users.map((item) => UserDto.fromMap(item)).toList();
  }

  @override
  Future<List<Map<String, Object?>>> getUserByField(
      {required String field, required String fieldValue}) async {
    var db = await DBHelper.instanse.database;

    return await db.rawQuery('''
              SELECT *
              FROM ${DatabaseConst.userTable}
              WHERE $field = $fieldValue
              ''');
  }

  @override
  Future<int> getMainIdUserByLocalId({required int localId}) async {
    var db = await DBHelper.instanse.database;

    var user = await db.rawQuery('''
              SELECT ${DatabaseConst.mainUserColumnUserId}
              FROM ${DatabaseConst.mainUserTable}
              WHERE ${DatabaseConst.mainUserColumnUserId} = $localId
              ''');
    return user[0]['user_id'] as int;
  }

  @override
  Future<UserDto> getUserByLocalId({required int localId}) async {
    var db = await DBHelper.instanse.database;

    var user = await db.rawQuery('''
              SELECT ${DatabaseConst.usersColumnUserId}
              FROM ${DatabaseConst.userTable}
              WHERE ${DatabaseConst.usersColumnUserId} = $localId
              ''');
    return user[0] as UserDto;
  }

  @override
  Future<int> updateUser(
      {required String newValues, required String condition}) async {
    var db = await DBHelper.instanse.database;
    return await db.rawUpdate(
        'UPDATE ${DatabaseConst.userTable} SET $newValues WHERE $condition');
  }

  Future getLastUserId() async {
    var db = await DBHelperStart.instanse.database;
    var lastUser = await db.rawQuery('''
              SELECT MAX(user_id) as user_id
              FROM users
              ''');
    print(lastUser);
    return lastUser[0]['user_id'] ?? 0;
  }

  @override
  Future<int> getMaxUserId() async {
    var db = await DBHelper.instanse.database;
    var chat =
        await db.rawQuery('''SELECT MAX(${DatabaseConst.usersColumnUserId}) 
                as ${DatabaseConst.usersColumnUserId} 
                FROM ${DatabaseConst.userTable}''');
    return (chat[0][DatabaseConst.usersColumnUserId] ?? 0) as int;
  }
}
