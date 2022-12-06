import '../model/user.dart';

abstract class UserRepository {
  Future<User> getUser({required id, required name, required email});
}
