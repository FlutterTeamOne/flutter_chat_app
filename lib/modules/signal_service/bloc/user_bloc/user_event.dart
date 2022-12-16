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

