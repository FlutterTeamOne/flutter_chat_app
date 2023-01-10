import '../../library/library_sending_manager.dart';

abstract class IMainUserService {
  factory IMainUserService() => MainUserServices();

  Future<int> getUserID();
  Future<String> getDateSync();
  Future<int> createMainUser(int id);
  Future<int> updateMainUser(
      {required String newValues, required String condition});
}
