import 'dart:convert';

import 'package:chat_app/src/constants/db_constants.dart';

import '../model_dto.dart';

class UserDto extends ModelDto {
  final int? userId;
  final String name;
  final String email;
  final String createdDate;
  final String profilePicLink;
  final String updatedDate;
  final String? deletedDate;

  UserDto({
    this.userId,
    required this.name,
    required this.email,
    required this.createdDate,
    required this.profilePicLink,
    required this.updatedDate,
    this.deletedDate,
  });

  UserDto copyWith({
    int? userId,
    String? name,
    String? email,
    String? registrationDate,
    String? profilePicLink,
    String? updatedDate,
    String? deletedDate,
  }) {
    return UserDto(
      userId: userId ?? this.userId,
      name: name ?? this.name,
      email: email ?? this.email,
      createdDate: registrationDate ?? this.createdDate,
      profilePicLink: profilePicLink ?? this.profilePicLink,
      updatedDate: updatedDate ?? this.updatedDate,
      deletedDate: deletedDate ?? this.deletedDate,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      DatabaseConst.usersColumnProfilePicLink: profilePicLink,
      DatabaseConst.usersColumnUserId: userId,
      DatabaseConst.usersColumnName: name,
      DatabaseConst.usersColumnEmail: email,
      DatabaseConst.usersColumnCreatedDate: createdDate,
      DatabaseConst.usersColumnUpdatedDate: updatedDate,
      DatabaseConst.usersColumnDeletedDate: deletedDate,
    };
  }

  factory UserDto.fromMap(Map<String, dynamic> map) {
    return UserDto(
      userId: map[DatabaseConst.usersColumnUserId] as int,
      name: map[DatabaseConst.usersColumnName] as String,
      email: map[DatabaseConst.usersColumnEmail] as String,
      createdDate: map[DatabaseConst.usersColumnCreatedDate] as String,
      profilePicLink: map[DatabaseConst.usersColumnProfilePicLink] as String,
      updatedDate: map[DatabaseConst.usersColumnUpdatedDate] as String,
      deletedDate: map[DatabaseConst.usersColumnDeletedDate] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserDto.fromJson(String source) =>
      UserDto.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserDto(userId: $userId, name: $name, email: $email, createdDate: $createdDate, profilePicLink: $profilePicLink, updatedDate: $updatedDate, deletedDate: $deletedDate)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserDto &&
        other.userId == userId &&
        other.name == name &&
        other.email == email &&
        other.createdDate == createdDate &&
        other.profilePicLink == profilePicLink &&
        other.updatedDate == updatedDate &&
        other.deletedDate == deletedDate;
  }

  @override
  int get hashCode {
    return userId.hashCode ^
        name.hashCode ^
        email.hashCode ^
        createdDate.hashCode ^
        profilePicLink.hashCode ^
        updatedDate.hashCode ^
        deletedDate.hashCode;
  }
}
