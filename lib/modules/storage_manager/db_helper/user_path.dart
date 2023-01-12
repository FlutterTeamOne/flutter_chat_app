// ignore_for_file: avoid_print

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

    /// TODO refactor print
    print('PATH: ${dbPath.path}');
    // var _dbFileName = 'sfera';
    return dbPath.path;
  }

  static late UserDto _user;
  String get path => setPath('test2');
  static set user(UserDto user) => _user = user;
  static UserDto get getUser => _user;
}

class UserPref {
  static late SharedPreferences _prefs;

  factory UserPref() => UserPref._internal();
  UserPref._internal();

  static Future<void> init() async =>
      _prefs = await SharedPreferences.getInstance();
  static bool get getUserDbPref => _prefs.getBool('userDb') ?? true;
  static set setUserDbPref(bool value) => _prefs.setBool('userDb', value);
  static set setUserId(int id) => _prefs.setInt('userId', id);

  static set setThemeIndex(int index) => _prefs.setInt('theme_key', index);
  static get getUserId => _prefs.getInt('userId');
  static get getThemeIndex => _prefs.getInt('theme_key');

  static restore() async => await _prefs.clear();
}
