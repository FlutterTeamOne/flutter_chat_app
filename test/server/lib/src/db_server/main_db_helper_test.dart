import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite_common/sqlite_api.dart';
import '../../../../../server/lib/src/db_server/services/database_impl.dart';

Future main() async {


  group("Main db: creating tables:", () {   

    test('"users" table created', () async {
      Database db = await DbServerServices.instanse.database;
      var r = await db.rawQuery('''SELECT name FROM sqlite_master WHERE type='table' AND name='users';''');
      
      expect(r, [{'name': 'users'}]);
    });

    test('"messages" table created', () async {
      Database db = await DbServerServices.instanse.database;

      var r = await db.rawQuery('''SELECT name FROM sqlite_master WHERE type='table' AND name='messages';''');
      
      expect(r, [{'name': 'messages'}]);
    });

    test('"chats" table created', () async {
      Database db = await DbServerServices.instanse.database;

      var r = await db.rawQuery('''SELECT name FROM sqlite_master WHERE type='table' AND name='chats';''');
      
      expect(r, [{'name': 'chats'}]);
    });
    test('"attachments" table created', () async {
      Database db = await DbServerServices.instanse.database;

      var r = await db.rawQuery('''SELECT name FROM sqlite_master WHERE type='table' AND name='attachments';''');
      
      expect(r, [{'name': 'attachments'}]);
    });
  });
}