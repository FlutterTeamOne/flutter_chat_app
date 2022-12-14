part of 'user_bloc.dart';

class UserState extends Equatable {
  final List<UserDto>? users;
  const UserState({
    this.users,
  });

  UserState copyWith({
    List<UserDto>? users,
  }) {
    return UserState(
      users: users ?? this.users,
    );
  }

  @override
  List<Object?> get props => [users];
}
