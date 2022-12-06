part of 'user_bloc.dart';

abstract class UserEvent {}

class CreateUserEvent extends UserEvent {
  final UserModel user;

  CreateUserEvent({
    required this.user,
  });
}

class ReadUsersEvent extends UserEvent {
  final List<UserModel>? users;

  ReadUsersEvent({this.users});
}
