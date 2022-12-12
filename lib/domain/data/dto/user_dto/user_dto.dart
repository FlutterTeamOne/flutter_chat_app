import 'dart:convert';

import 'package:chat_app/src/constants/db_constants.dart';

import '../model_dto.dart';

class UserDto extends ModelDto {
  final int? localUserId;
  final String name;
  final String email;
  final String registrationDate;
  final String profilePicLink;
  final int mainUsersId;
  final String updatedDate;
  final String? deletedDate;

  UserDto({
    this.localUserId,
    required this.name,
    required this.email,
    required this.registrationDate,
    required this.profilePicLink,
    required this.mainUsersId,
    required this.updatedDate,
    this.deletedDate,
  });

  UserDto copyWith({
    int? localUserId,
    String? name,
    String? email,
    String? registrationDate,
    String? profilePicLink,
    int? mainUsersId,
    String? updatedDate,
    String? deletedDate,
  }) {
    return UserDto(
      localUserId: localUserId ?? this.localUserId,
      name: name ?? this.name,
      email: email ?? this.email,
      registrationDate: registrationDate ?? this.registrationDate,
      profilePicLink: profilePicLink ?? this.profilePicLink,
      mainUsersId: mainUsersId ?? this.mainUsersId,
      updatedDate: updatedDate ?? this.updatedDate,
      deletedDate: deletedDate ?? this.deletedDate,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      DatabaseConst.usersColumnId: localUserId,
      DatabaseConst.usersColumnName: name,
      DatabaseConst.usersColumnEmail: email,
      DatabaseConst.usersColumnCreatedDate: registrationDate,
      DatabaseConst.usersColumnProfilePicLink: profilePicLink,
      DatabaseConst.usersColumnMainUsersId: mainUsersId,
      DatabaseConst.usersColumnUpdatedDate: updatedDate,
      DatabaseConst.usersColumnsDeletedDate: deletedDate,
    };
  }

  factory UserDto.fromMap(Map<String, dynamic> map) {
    return UserDto(
      // localUserId: map[DatabaseConst.usersColumnId] as int,
      name: map[DatabaseConst.usersColumnName] as String,
      email: map[DatabaseConst.usersColumnEmail] as String,
      registrationDate: map[DatabaseConst.usersColumnCreatedDate] as String,
      profilePicLink: map[DatabaseConst.usersColumnProfilePicLink] as String,
      mainUsersId: map[DatabaseConst.usersColumnMainUsersId] as int,
      updatedDate: map[DatabaseConst.usersColumnUpdatedDate] as String,
      deletedDate: map[DatabaseConst.usersColumnsDeletedDate] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserDto.fromJson(String source) =>
      UserDto.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserDto(localUserId: $localUserId, name: $name, email: $email, registrationDate: $registrationDate, profilePicLink: $profilePicLink, mainUsersId: $mainUsersId, updatedDate: $updatedDate, deletedDate: $deletedDate)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserDto &&
        other.localUserId == localUserId &&
        other.name == name &&
        other.email == email &&
        other.registrationDate == registrationDate &&
        other.profilePicLink == profilePicLink &&
        other.mainUsersId == mainUsersId &&
        other.updatedDate == updatedDate &&
        other.deletedDate == deletedDate;
  }

  @override
  int get hashCode {
    return localUserId.hashCode ^
        name.hashCode ^
        email.hashCode ^
        registrationDate.hashCode ^
        profilePicLink.hashCode ^
        mainUsersId.hashCode ^
        updatedDate.hashCode ^
        deletedDate.hashCode;
  }
}
