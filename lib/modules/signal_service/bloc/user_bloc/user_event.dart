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
  final int? localId;

  ReadUsersEvent({this.localId, this.users});
  @override
  List<Object?> get props => [users, localId];
}
