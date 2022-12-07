import 'package:server_bd/src/db_server/database_helper/library_db.dart';

abstract class IDbServerServices {
  factory IDbServerServices() => DbServerServices();

  openDatabase();
}

final dbServerServices = IDbServerServices();
