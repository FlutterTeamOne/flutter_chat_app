part of 'user_bloc.dart';

class UserState {
  final List<UserModel>? users;
  UserState({
    this.users,
  });
  

  UserState copyWith({
    List<UserModel>? users,
  }) {
    return UserState(
      users: users ?? this.users,
    );
  }
}
