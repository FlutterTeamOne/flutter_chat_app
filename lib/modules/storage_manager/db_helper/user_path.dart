import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import '../../../domain/data/dto/user_dto/user_dto.dart';

class UserPath {
  String _path = 'test1';
  String setPath(String name) {
    var dbPath = '';
    getDbPath().then((value) => dbPath = value);
    _path = join(dbPath, 'sfera_$name.db');
    return _path;
  }

  Future<String> getDbPath() async {
    var dbPath = await getTemporaryDirectory();
    print('PATH: ${dbPath.path}');
    // var _dbFileName = 'sfera';
    return dbPath.path;
  }

  static late UserDto _user ;
  String get path => setPath('test2');
  static set user(UserDto user) => _user = user;
 static  UserDto get getUser => _user;
}
