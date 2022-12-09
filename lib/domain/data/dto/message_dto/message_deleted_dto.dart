import 'dart:convert';

import 'package:chat_app/domain/data/dto/model_dto.dart';
import 'package:chat_app/src/constants/db_constants.dart';

class MessageDeletedDto extends ModelDto {
  final int messageDeletedId;
  final int localMessagedId;
  final String whenDeleted;
  MessageDeletedDto({
    required this.messageDeletedId,
    required this.localMessagedId,
    required this.whenDeleted,
  });

  MessageDeletedDto copyWith({
    int? messageDeletedId,
    int? localMessagedId,
    String? whenDeleted,
  }) {
    return MessageDeletedDto(
      messageDeletedId: messageDeletedId ?? this.messageDeletedId,
      localMessagedId: localMessagedId ?? this.localMessagedId,
      whenDeleted: whenDeleted ?? this.whenDeleted,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      DatabaseConst.messageDeletedColumnID: messageDeletedId,
      DatabaseConst.messagesColumnLocalMessagesId: localMessagedId,
      DatabaseConst.messageDeletedColumnWhenDeleted: whenDeleted,
    };
  }

  factory MessageDeletedDto.fromMap(Map<String, dynamic> map) {
    return MessageDeletedDto(
      messageDeletedId: map[DatabaseConst.messageDeletedColumnID]?.toInt() ?? 0,
      localMessagedId:
          map[DatabaseConst.messagesColumnLocalMessagesId]?.toInt() ?? 0,
      whenDeleted: map[DatabaseConst.messageDeletedColumnWhenDeleted] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory MessageDeletedDto.fromJson(String source) =>
      MessageDeletedDto.fromMap(json.decode(source));

  @override
  String toString() =>
      'MessageDeletedDto(messageDeletedId: $messageDeletedId, localMessagedId: $localMessagedId, whenDeleted: $whenDeleted)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MessageDeletedDto &&
        other.messageDeletedId == messageDeletedId &&
        other.localMessagedId == localMessagedId &&
        other.whenDeleted == whenDeleted;
  }

  @override
  int get hashCode =>
      messageDeletedId.hashCode ^
      localMessagedId.hashCode ^
      whenDeleted.hashCode;
}
