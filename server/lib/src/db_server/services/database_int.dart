
import '../../library/library_server.dart';

abstract class IDbServerServices {
  factory IDbServerServices() => DbServerServices();
  openDatabase();
}

final dbServerServices = IDbServerServices();
