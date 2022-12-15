import '../../../../../domain/data/dto/user_dto/user_dto.dart';

abstract class NewUserEvent {}

class SetNewUserEvent extends NewUserEvent {
  final UserDto user;
  SetNewUserEvent({
    required this.user
});
}