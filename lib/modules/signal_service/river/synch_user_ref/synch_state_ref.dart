import 'package:chat_app/domain/data/library/library_data.dart';

class SynchStateRef {
  final List<UserDto>? users;
  final UserDto? newUser;
  SynchStateRef({
    this.users,
    this.newUser,
  });

  SynchStateRef copyWith({
    List<UserDto>? users,
    UserDto? newUser,
  }) {
    return SynchStateRef(
      users: users ?? this.users,
      newUser: newUser ?? this.newUser,
    );
  }
}
