// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import '../../../../domain/data/dto/user_dto/user_dto.dart';
import '../../../storage_manager/db_helper/user_path.dart';

class UserStateRef extends Equatable {
  final List<UserDto>? users;
  final UserDto? mainUser;
  final bool? userDb;
  final bool? isDeleted;
  const UserStateRef({this.users, this.userDb, this.isDeleted, this.mainUser});

  UserStateRef copyWith({
    List<UserDto>? users,
    UserDto? mainUser,
    bool? userDb,
    bool? isDeleted,
  }) {
    return UserStateRef(
      users: users ?? this.users,
      mainUser: mainUser ?? this.mainUser,
      userDb: userDb ?? this.userDb,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }

  bool get userDbthis => UserPref.getUserDbPref;

  @override
  List<Object?> get props => [users, mainUser, userDb, isDeleted];
}
