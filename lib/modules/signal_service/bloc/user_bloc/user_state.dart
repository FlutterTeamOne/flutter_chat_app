part of 'user_bloc.dart';

class UserState extends Equatable {
  final List<UserDto>? users;
  final bool? userDb;
  const UserState({
    this.users,
    this.userDb,
  });

  UserState copyWith({
    List<UserDto>? users,
  }) {
    return UserState(
      users: users ?? this.users,
    );
  }

  bool get userDbthis => UserPref.getUserPref;

  @override
  List<Object?> get props => [users];
}

class UserPref {
  static late SharedPreferences _prefs;

  factory UserPref() => UserPref._internal();
  UserPref._internal();

  static Future<void> init() async =>
      _prefs = await SharedPreferences.getInstance();
  static bool get getUserPref => _prefs.getBool('userDb') ?? true;
  static set setUserPref(bool value) => _prefs.setBool('userDb', value);
  static restore() async => await _prefs.clear();
}
