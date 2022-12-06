import 'package:flutter_chat_app/src/db_server/database_helper/library_db.dart';

abstract class IDbServerServices {
  factory IDbServerServices() => DbServerServices();

  openDatabase();
}

final dbServerServices = IDbServerServices();
