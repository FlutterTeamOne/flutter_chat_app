import '../../src/libs/models_lib.dart';
import '../lib_db.dart';

class LocalUsersServices implements ILocalUsersServices {
  LocalUsersServices();

  @override
  Future<int> createUser(
      {required String name,
      required String email,
      required String registrationDate,
      required String profilePicUrl,
      required int mainUserId}) async {
    var db = await DBHelper.instanse.database;

    return await db.insert(DatabaseConst.userTable, {
      DatabaseConst.usersColumnName: name,
      DatabaseConst.usersColumnEmail: email,
      DatabaseConst.usersColumnRegistrationDate: registrationDate,
      DatabaseConst.usersColumnProfilePicLink: profilePicUrl,
      DatabaseConst.usersColumnMainUsersId: mainUserId,
    });
  }

  @override
  Future<int> deleteUser({required int id}) async {
    var db = await DBHelper.instanse.database;
    return await db.rawDelete(
        'DELETE FROM ${DatabaseConst.userTable} WHERE ${DatabaseConst.usersColumnId}=$id');
  }

  @override
  Future<List<UserModel>> getAllUsers() async {
    var db = await DBHelper.instanse.database;
    var users = await db.rawQuery('''
              SELECT *
              FROM ${DatabaseConst.userTable}
              ''');
    return users
        .map((item) => UserModel(
            localUserId: item[DatabaseConst.usersColumnId] as int,
            name: item[DatabaseConst.usersColumnName] as String,
            email: item[DatabaseConst.usersColumnEmail] as String,
            registrationDate:
                item[DatabaseConst.usersColumnRegistrationDate] as String,
            profilePicLink:
                item[DatabaseConst.usersColumnProfilePicLink] as String,
            mainUsersId: item[DatabaseConst.usersColumnMainUsersId] as int))
        .toList();
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
  Future<int> getUserByLocalId({required int localId}) async {
    var db = await DBHelper.instanse.database;

    var user = await db.rawQuery('''
              SELECT ${DatabaseConst.usersColumnMainUsersId}
              FROM ${DatabaseConst.userTable}
              WHERE ${DatabaseConst.usersColumnId} = $localId
              ''');
    return user[0]['main_users_id'] as int;
  }

  @override
  Future<int> updateUser(
      {required String newValues, required String condition}) async {
    var db = await DBHelper.instanse.database;
    return await db.rawUpdate(
        'UPDATE ${DatabaseConst.userTable} SET $newValues WHERE $condition');
  }
}
