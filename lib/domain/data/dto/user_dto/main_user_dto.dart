import 'dart:convert';

import 'package:chat_app/domain/data/library/library_data.dart';

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
  String toString() => 'MainUserDto(userId: $userId, key: $key, dateSync: $dateSync)';

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'key': key,
      'dateSync': dateSync,
    };
  }

  factory MainUserDto.fromMap(Map<String, dynamic> map) {
    return MainUserDto(
      userId: map['userId']?.toInt() ?? 0,
      key: map['key'] ?? '',
      dateSync: map['dateSync'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory MainUserDto.fromJson(String source) => MainUserDto.fromMap(json.decode(source));
}
