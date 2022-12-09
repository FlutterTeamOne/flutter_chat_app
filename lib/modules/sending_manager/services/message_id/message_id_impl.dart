import '../../../../src/constants/db_constants.dart';
import '../../library/library_sending_manager.dart';
import '../../../storage_manager/library/library_storage_manager.dart';

class MessageIdServices implements IMessageIdServices {
  MessageIdServices();

  @override
  Future<int> createMessageId(
      {required int mainId, required int localId}) async {
    var db = await DBHelper.instanse.database;
    return await db.rawInsert('''INSERT INTO ${DatabaseConst.messageIdTable}
        (${DatabaseConst.messageIdColumn},${DatabaseConst.messageIdColumnLocal})
        VALUES ($mainId,$localId)''');
  }

  @override
  Future<int> deleteMessageId({required int mainId}) async {
    var db = await DBHelper.instanse.database;
    return await db.rawDelete('''DELETE FROM ${DatabaseConst.messageIdTable} 
        WHERE ${DatabaseConst.messageIdColumn}=$mainId''');
  }

  @override
  updateMessageId(
      {required String newValues, required String condition}) async {
    var db = await DBHelper.instanse.database;
    return await db.rawUpdate(
        'UPDATE ${DatabaseConst.messageIdTable} SET $newValues WHERE $condition');
  }
}
