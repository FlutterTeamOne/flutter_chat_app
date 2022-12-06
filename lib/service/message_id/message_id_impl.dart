import 'package:grpc/grpc.dart';
import 'package:flutter_chat_app/service/lib_db.dart';

class MessageIdServices implements IMessageIdServices {
  final ClientChannel channel;

  MessageIdServices({required this.channel});

  @override
  Future<int> createMessageId(
      {required int mainId, required int localId}) async {
    var db = await DBHelper.instanse.database;
    return await db.rawInsert(
        'INSERT INTO ${DatabaseConst.messageIdTable}(${DatabaseConst.messageIdColumn},${DatabaseConst.messageIdColumnLocal}) VALUS ($mainId,$localId');
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
