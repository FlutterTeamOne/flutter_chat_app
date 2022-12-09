part of 'user_bloc.dart';

class UserState {
  final List<UserDto>? users;
  UserState({
    this.users,
  });


  UserState copyWith({
    List<UserDto>? users,
  }) {
    return UserState(
      users: users ?? this.users,
    );
  }
}
