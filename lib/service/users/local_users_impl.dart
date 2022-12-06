import 'package:grpc/grpc.dart';
import '../lib_db.dart';

class LocalUsersServices implements ILocalUsersServices {
  final ClientChannel channel;

  LocalUsersServices({required this.channel});

  @override
  Future<int> createUser(
      {required String name,
      required String email,
      required String registrationDate,
      required String profilePicUrl,
      required int mainUserId}) async {
    var db = await DBHelper.instanse.database;

    return db.insert(DatabaseConst.userTable, {
      DatabaseConst.usersColumnName: name,
      DatabaseConst.usersColumnEmail: email,
      DatabaseConst.usersColumnRegistrationDate: registrationDate,
      DatabaseConst.usersColumnProfilePicLink: profilePicUrl,
      DatabaseConst.usersColumnMainUsersId: mainUserId,
    });
  }

  @override
  deleteUser({required int id}) async {
    var db = await DBHelper.instanse.database;
    return db.rawDelete(
        'DELETE FROM ${DatabaseConst.userTable} WHERE ${DatabaseConst.usersColumnId}=$id');
  }

  @override
  getAllUsers() async {
    var db = await DBHelper.instanse.database;
    return await db.rawQuery('''
              SELECT *
              FROM ${DatabaseConst.userTable}
              ''');
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
