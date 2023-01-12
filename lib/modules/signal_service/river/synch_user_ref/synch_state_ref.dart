

import 'package:chat_app/domain/data/library/library_data.dart';

class SynchStateRef {
  final List<UserDto>? users;
  SynchStateRef({
    this.users,
  });

  SynchStateRef copyWith({
    List<UserDto>? users,
  }) {
    return SynchStateRef(
      users: users ?? this.users,
    );
  }

  
}
