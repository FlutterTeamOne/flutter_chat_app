import 'package:chat_app/domain/data/dto/user_dto/user_dto.dart';

class NewUserStateRef {
  final UserDto newUser;
  // final int newUserId;
  NewUserStateRef(
      {
      // required this.newUserId,
      required this.newUser});
  NewUserStateRef copyWith({UserDto? newUser}) {
    return NewUserStateRef(newUser: newUser ?? this.newUser);
  }
}