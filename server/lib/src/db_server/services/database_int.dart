import 'package:server/src/library/library_server.dart';

abstract class IDbServerServices {
  factory IDbServerServices() => DbServerServices();
  openDatabase();
  createDatabase();
}

final dbServerServices = IDbServerServices();
