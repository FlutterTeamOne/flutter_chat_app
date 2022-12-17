import 'dart:convert';

import 'package:chat_app/src/constants/db_constants.dart';

import '../model_dto.dart';

class MessageDto extends ModelDto {
  late int? localMessageId;
  final int localChatId;
  final int localSendId;
  final int? messageId;
  final String content;
  final String? createdDate;
  final String? updatedDate;
  final String? deletedDate;
  final int isRead;

  MessageDto({
    this.localMessageId,
    required this.localChatId,
    required this.localSendId,
    this.messageId,
    required this.content,
     this.createdDate,
    this.updatedDate,
    this.deletedDate,
    this.isRead = 0,
  });

  MessageDto copyWith(
      {int? localMessageId,
      int? localChatId,
      int? localSendId,
      int? messageId,
      String? createdDate,
      String? content,
      String? updatedDate,
      String? deletedDate,
      int? isRead}) {
    return MessageDto(
        localMessageId: localMessageId ?? this.localMessageId,
        localChatId: localChatId ?? this.localChatId,
        localSendId: localSendId ?? this.localSendId,
        messageId: messageId ?? this.messageId,
        createdDate: createdDate ?? this.createdDate,
        content: content ?? this.content,
        updatedDate: updatedDate ?? this.updatedDate,
        deletedDate: deletedDate ?? this.deletedDate,
        isRead: isRead ?? this.isRead);
  }

  Map<String, dynamic> toMap() {
    return {
      DatabaseConst.messagesColumnLocalMessagesId: localMessageId,
      DatabaseConst.messagesColumnChatId: localChatId,
      DatabaseConst.messagesColumnSenderId: localSendId,
      DatabaseConst.messagesColumnCreatedDate: createdDate,
      DatabaseConst.messagesColumnContent: content,
      DatabaseConst.messagesColumnMessageId: messageId,
      DatabaseConst.messagesColumnUpdatedDate: updatedDate,
      DatabaseConst.messagesColumnDeletedDate: deletedDate,
      DatabaseConst.messagesColumnIsRead: isRead,
    };
  }

  factory MessageDto.fromMap(Map<String, dynamic> map) {
    return MessageDto(
        localMessageId: map[DatabaseConst.messagesColumnLocalMessagesId] as int,
        localChatId: map[DatabaseConst.messagesColumnChatId] as int,
        localSendId: map[DatabaseConst.messagesColumnSenderId] as int,
        createdDate: map[DatabaseConst.messagesColumnCreatedDate] as String,
        content: map[DatabaseConst.messagesColumnContent] as String,
        messageId: map[DatabaseConst.messagesColumnMessageId],
        updatedDate: map[DatabaseConst.messagesColumnUpdatedDate] as String,
        deletedDate: map[DatabaseConst.messagesColumnDeletedDate] ?? '',
        isRead: map[DatabaseConst.messagesColumnIsRead] as int);
  }

  String toJson() => json.encode(toMap());

  factory MessageDto.fromJson(String source) =>
      MessageDto.fromMap(json.decode(source));

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MessageDto &&
        other.localMessageId == localMessageId &&
        other.localChatId == localChatId &&
        other.localSendId == localSendId &&
        other.messageId == messageId &&
        other.createdDate == createdDate &&
        other.updatedDate == updatedDate &&
        other.content == content &&
        other.deletedDate == deletedDate &&
        other.isRead == isRead;
  }

  @override
  int get hashCode {
    return localMessageId.hashCode ^
        localChatId.hashCode ^
        localSendId.hashCode ^
        messageId.hashCode ^
        createdDate.hashCode ^
        updatedDate.hashCode ^
        deletedDate.hashCode ^
        isRead.hashCode ^
        content.hashCode;
  }

  @override
  String toString() {
    return 'MessageDto(localMessageId: $localMessageId, localChatId: $localChatId, localSendId: $localSendId, messageId: $messageId, content: $content, createdDate: $createdDate, updatedDate: $updatedDate, deletedDate: $deletedDate, isRead: $isRead)';
  }
}
