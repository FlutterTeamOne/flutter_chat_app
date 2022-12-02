import 'package:flutter_chat_app/storage_manager/database_const.dart';

import 'model.dart';

class User extends Model {
  static const table = 'User';

  final int? id;
  final String name;
  final String email;
  final String registrationDate;
  final String profilePicLink;
  final int mainUsersId;

  User({
    this.id,
    required this.name,
    required this.email,
    required this.registrationDate,
    required this.profilePicLink,
    required this.mainUsersId,
  });

  static User fromMap(Map<String, dynamic> map) {
    return User(
      id: map[DatabaseConst.columnId]?.toInt() ?? 0,
      name: map[DatabaseConst.columnName] ?? '',
      email: map[DatabaseConst.columnEmail] ?? '',
      registrationDate: 
          map[DatabaseConst.columnRegistrationDate],
      profilePicLink: map[DatabaseConst.columnProfilePicLink] ?? '',
      mainUsersId: map[DatabaseConst.columnMainUsersId] ?? 0,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      DatabaseConst.columnId: id,
      DatabaseConst.columnName: name,
      DatabaseConst.columnEmail: email,
      DatabaseConst.columnRegistrationDate: registrationDate,
      DatabaseConst.columnProfilePicLink: profilePicLink,
      DatabaseConst.columnMainUsersId: mainUsersId
    };
    if (id != null) {
      map[DatabaseConst.columnId] = id;
    }
    return map;
  }

  // @override
  // bool operator ==(Object other) {
  //   if (identical(this, other)) return true;

  //   return other is User &&
  //       other.id == id &&
  //       other.name == name &&
  //       other.email == email &&
  //       other.registrationDate == registrationDate &&
  //       other.profilePicLink == profilePicLink &&
  //       other.mainUsersId == mainUsersId;
  // }

  // @override
  // int get hashCode {
  //   return id.hashCode ^
  //       name.hashCode ^
  //       email.hashCode ^
  //       registrationDate.hashCode ^
  //       profilePicLink.hashCode ^
  //       mainUsersId.hashCode;
  // }
}
