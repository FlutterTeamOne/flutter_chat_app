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

  bool get userDbthis => UserPref.getUserDbPref;

  @override
  List<Object?> get props => [users];
}
