import 'package:server/src/db_server/database_helper/attachments/attachment_int.dart';
import 'package:server/src/db_server/services/database_impl.dart';
import 'package:server/src/models/attach_model.dart';
import 'package:sqflite_common/sqlite_api.dart';

class AttachmentServices implements IAttachmentServices {
  @override
  Future<Map<String, Object?>> createAttachment(
      {required String attachmentMeta}) async {
    Database db = await DbServerServices.instanse.database;

    var id = await db.rawInsert('''
      INSERT INTO attachments (attachment_meta)
        VALUES ('$attachmentMeta')
      ''');
    var attach = await db
        .rawQuery('SELECT * FROM attachments WHERE (attachment_id =?)', [id]);
    print('attach: $attach');
    print('attach id: ${attach[0]['attachment_id']}');

    var map = <String, Object?>{};
    map.addAll({
      "attachment_id": attach[0]['attachment_id'],
      "attachment_meta": attach[0]['attachment_meta']
    });

    print('r:$map');
    return map;
  }

  @override
  Future readAttachment({required int id}) async {
    Database db = await DbServerServices.instanse.database;

    await db.execute('''SELECT * FROM attachments
            WHERE (attachment_id = $id)
          );
      ''');
  }

  @override
  Future deleteAttachment({required int id}) async {
    Database db = await DbServerServices.instanse.database;

    await db.execute('''DELETE FROM attachments
            WHERE (attachment_id = $id)
          );
      ''');
  }
}
