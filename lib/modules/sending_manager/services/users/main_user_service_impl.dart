import '../../library/library_sending_manager.dart';
import '../../../../src/constants/db_constants.dart';

import '../../../storage_manager/library/library_storage_manager.dart';

class MainUserServices implements IMainUserService {
  MainUserServices();

  @override
  Future<String> getDateSync() async {
    var db = await DBHelper.instanse.database;
    var isSync = await db.rawQuery('''
    SELECT ${DatabaseConst.mainUserColumnDataSync}
    FROM ${DatabaseConst.mainUserTable}
    ''');
    return isSync[0][DatabaseConst.mainUserColumnDataSync] as String;
  }

  @override
  Future<int> getUserID() async {
    var db = await DBHelper.instanse.database;

    var id = await db.rawQuery('''SELECT ${DatabaseConst.mainUserColumnUserId}
          FROM ${DatabaseConst.mainUserTable}
          ''');
    return id[0][DatabaseConst.mainUserColumnUserId] as int;
  }

  @override
  Future<int> createMainUser(int id) async {
    var db = await DBHelper.instanse.database;

    return await db.rawInsert('''INSERT INTO ${DatabaseConst.mainUserTable}
    (${DatabaseConst.mainUserColumnUserId},
    ${DatabaseConst.mainUserColumnKey},
     ${DatabaseConst.mainUserColumnDataSync}) VALUES 
     ($id, '', '${DateTime.now().toIso8601String()}')''');
  }

  @override
  Future<int> updateMainUser(
      {required String newValues, required String condition}) async {
    var db = await DBHelper.instanse.database;
    return await db.rawUpdate(
        'UPDATE ${DatabaseConst.mainUserTable} SET $newValues WHERE $condition');
  }
}
