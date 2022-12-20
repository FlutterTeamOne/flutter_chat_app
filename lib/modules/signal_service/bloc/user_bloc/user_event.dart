part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class CreateUserEvent extends UserEvent {
  final UserDto user;

  CreateUserEvent({
    required this.user,
  });
  @override
  List<Object?> get props => [user];
}

class ReadUsersEvent extends UserEvent {
  final List<UserDto>? users;
  final bool userDb;

  ReadUsersEvent({this.users, this.userDb = true});
  @override
  List<Object?> get props => [users, userDb];
}

class ChangeUserEvent extends UserEvent {
  final UserDto? user;
  final bool userDb;

  ChangeUserEvent({this.user, this.userDb = true});
  @override
  List<Object?> get props => [user, userDb];
}
