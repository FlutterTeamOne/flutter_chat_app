import 'dart:convert';

import 'package:chat_app/src/constants/db_constants.dart';

import '../model_dto.dart';

class UserLastTimeOnlineDto extends ModelDto {
  final int userLastTimeOnlineId;
  final int localUsersId;
  final bool isOnline;
  final String lastTimeOnline;
  UserLastTimeOnlineDto({
    required this.userLastTimeOnlineId,
    required this.localUsersId,
    required this.isOnline,
    required this.lastTimeOnline,
  });
 

  UserLastTimeOnlineDto copyWith({
    int? userLastTimeOnlineId,
    int? localUsersId,
    bool? isOnline,
    String? lastTimeOnline,
  }) {
    return UserLastTimeOnlineDto(
      userLastTimeOnlineId: userLastTimeOnlineId ?? this.userLastTimeOnlineId,
      localUsersId: localUsersId ?? this.localUsersId,
      isOnline: isOnline ?? this.isOnline,
      lastTimeOnline: lastTimeOnline ?? this.lastTimeOnline,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      DatabaseConst.userLastTimeOnlineColumnId: userLastTimeOnlineId,
      DatabaseConst.usersColumnId: localUsersId,
      DatabaseConst.userLastTimeOnlineColumnisOnline: isOnline,
      DatabaseConst.userLastTimeOnlineColumnLastTimeOnline: lastTimeOnline,
    };
  }

  factory UserLastTimeOnlineDto.fromMap(Map<String, dynamic> map) {
    return UserLastTimeOnlineDto(
      userLastTimeOnlineId: map[DatabaseConst.userLastTimeOnlineColumnId] as int,
      localUsersId: map[DatabaseConst.usersColumnId],
      isOnline: map[DatabaseConst.userLastTimeOnlineColumnisOnline] ?? false,
      lastTimeOnline: map[DatabaseConst.userLastTimeOnlineColumnLastTimeOnline],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserLastTimeOnlineDto.fromJson(String source) => UserLastTimeOnlineDto.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserLastTimeOnlineDto(userLastTimeOnlineId: $userLastTimeOnlineId, localUsersId: $localUsersId, isOnline: $isOnline, lastTimeOnline: $lastTimeOnline)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is UserLastTimeOnlineDto &&
      other.userLastTimeOnlineId == userLastTimeOnlineId &&
      other.localUsersId == localUsersId &&
      other.isOnline == isOnline &&
      other.lastTimeOnline == lastTimeOnline;
  }

  @override
  int get hashCode {
    return userLastTimeOnlineId.hashCode ^
      localUsersId.hashCode ^
      isOnline.hashCode ^
      lastTimeOnline.hashCode;
  }
}
 