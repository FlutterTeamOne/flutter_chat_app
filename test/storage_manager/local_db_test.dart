import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:sqflite/sqflite.dart';

Future main() async {

  setUpAll(() {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  });
  
  test('Unit test init and read sql', () async {
    var db = await openDatabase(inMemoryDatabasePath, version: 1,
        onCreate: (db, version) async {
      await db.execute('CREATE TABLE User (id INTEGER PRIMARY KEY, name TEXT)');
    });

    await db.insert('User', {'name': 'Bob'});

    expect(await db.query('User'), [
      {'id': 1, 'name': 'Bob'}
    ]);

    await db.close();
  });
}
