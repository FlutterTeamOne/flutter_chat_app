import 'dart:convert';

import 'package:chat_app/domain/data/library/library_data.dart';
import 'package:chat_app/src/constants/db_constants.dart';

class MainUserDto extends ModelDto {
  final int userId;
  final String key;
  final String dateSync;
  MainUserDto({
    required this.userId,
    required this.key,
    required this.dateSync,
  });

  MainUserDto copyWith({
    int? userId,
    String? key,
    String? dateSync,
  }) {
    return MainUserDto(
      userId: userId ?? this.userId,
      key: key ?? this.key,
      dateSync: dateSync ?? this.dateSync,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MainUserDto &&
        other.userId == userId &&
        other.key == key &&
        other.dateSync == dateSync;
  }

  @override
  int get hashCode => userId.hashCode ^ key.hashCode ^ dateSync.hashCode;

  @override
  String toString() =>
      'MainUserDto(userId: $userId, key: $key, dateSync: $dateSync)';

  Map<String, dynamic> toMap() {
    return {
      DatabaseConst.mainUserColumnUserId: userId,
      DatabaseConst.mainUserColumnKey: key,
      DatabaseConst.mainUserColumnDataSync: dateSync,
    };
  }

  factory MainUserDto.fromMap(Map<String, dynamic> map) {
    return MainUserDto(
      userId: map[DatabaseConst.mainUserColumnUserId]?.toInt() ?? 0,
      key: map[DatabaseConst.mainUserColumnKey] ?? '',
      dateSync: map[DatabaseConst.mainUserColumnDataSync] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory MainUserDto.fromJson(String source) =>
      MainUserDto.fromMap(json.decode(source));
}
