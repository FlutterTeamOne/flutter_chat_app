import 'package:server/src/db_server/database_helper/attachments/attachment_int.dart';
import 'package:server/src/db_server/services/database_impl.dart';
import 'package:sqflite_common/sqlite_api.dart';

class AttachmentServices implements IAttachmentServices {
  @override
  Future createAttachment({
    required String attachmentMeta
  }) async {
    Database db = await DbServerServices.instanse.database;
    await db.transaction((txn) async {
      await txn.execute('''
      INSERT INTO attachments (attachment_meta)
        VALUES ('$attachmentMeta')
      ''');

      return await txn.execute(
        '''SELECT * FROM attachments
          WHERE (attachment_meta = '$attachmentMeta')
        '''
      );
    });
  }

  @override
  Future readAttachment({required int id}) async {
    Database db = await DbServerServices.instanse.database;
    await db.transaction((txn) async {
      await txn.execute(
        '''SELECT * FROM attachments
            WHERE (attachment_id = $id)
          );
      ''');
    });
  }

  @override
  Future deleteAttachment({required int id}) async {
    Database db = await DbServerServices.instanse.database;
    await db.transaction((txn) async {
      await txn.execute(
        '''DELETE FROM attachments
            WHERE (attachment_id = $id)
          );
      ''');
    });

  }
}