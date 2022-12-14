import 'dart:convert';

import 'package:chat_app/src/constants/db_constants.dart';

import '../model_dto.dart';

class MessageUpdatedDto extends ModelDto {
  final int messageIsUpdatedId;
  final int localMessagesId;
  final String whenUpdated;
  MessageUpdatedDto({
    required this.messageIsUpdatedId,
    required this.localMessagesId,
    required this.whenUpdated,
  });

  MessageUpdatedDto copyWith({
    int? messageIsUpdatedId,
    int? localMessagesId,
    String? whenUpdated,
  }) {
    return MessageUpdatedDto(
      messageIsUpdatedId: messageIsUpdatedId ?? this.messageIsUpdatedId,
      localMessagesId: localMessagesId ?? this.localMessagesId,
      whenUpdated: whenUpdated ?? this.whenUpdated,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      DatabaseConst.messageUpdatedColumnMessageIsUpdatedId: messageIsUpdatedId,
      DatabaseConst.messageUpdatedColumnLocalMessagesId: localMessagesId,
      DatabaseConst.messageUpdatedColumnWhenUpdated: whenUpdated,
    };
  }

  factory MessageUpdatedDto.fromMap(Map<String, dynamic> map) {
    return MessageUpdatedDto(
      messageIsUpdatedId: map[DatabaseConst.messageUpdatedColumnMessageIsUpdatedId]?.toInt() ?? 0,
      localMessagesId: map[DatabaseConst.messageUpdatedColumnLocalMessagesId]?.toInt() ?? 0,
      whenUpdated: map[DatabaseConst.messageUpdatedColumnWhenUpdated] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory MessageUpdatedDto.fromJson(String source) => MessageUpdatedDto.fromMap(json.decode(source));

  @override
  String toString() => 'MessageUpdatedDto(messageIsUpdatedId: $messageIsUpdatedId, localMessagesId: $localMessagesId, whenUpdated: $whenUpdated)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is MessageUpdatedDto &&
      other.messageIsUpdatedId == messageIsUpdatedId &&
      other.localMessagesId == localMessagesId &&
      other.whenUpdated == whenUpdated;
  }

  @override
  int get hashCode => messageIsUpdatedId.hashCode ^ localMessagesId.hashCode ^ whenUpdated.hashCode;
}
