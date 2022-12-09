part of 'user_bloc.dart';

abstract class UserEvent {}

class CreateUserEvent extends UserEvent {
  final UserDto user;

  CreateUserEvent({
    required this.user,
  });
}

class ReadUsersEvent extends UserEvent {
  final List<UserDto>? users;
  final int? localId;

  ReadUsersEvent({this.localId, this.users});
}
