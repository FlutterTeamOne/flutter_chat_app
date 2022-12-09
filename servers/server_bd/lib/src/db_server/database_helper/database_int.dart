import 'library_db.dart';

abstract class IDbServerServices {
  factory IDbServerServices() => DbServerServices();

  openDatabase();
}

final dbServerServices = IDbServerServices();
