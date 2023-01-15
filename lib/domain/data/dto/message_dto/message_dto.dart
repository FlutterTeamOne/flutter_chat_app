import 'dart:convert';

import '../../../../src/constants/db_constants.dart';
import '../../../../src/generated/messages/messages.pbgrpc.dart';

import '../model_dto.dart';

class MessageDto extends ModelDto {
  late int? localMessageId;
  final int chatId;
  final int senderId;
  final int? messageId;
  final String content;
  final int? attachId;
  final String? createdDate;
  final String? updatedDate;
  final String? deletedDate;
  final int isRead;
  final ContentType contentType;
  MessageDto(
      {this.localMessageId,
      required this.chatId,
      required this.senderId,
      this.messageId,
      required this.content,
      this.attachId,
      this.createdDate,
      this.updatedDate,
      this.deletedDate,
      this.isRead = 0,
      this.contentType = ContentType.isText});

  MessageDto copyWith(
      {int? localMessageId,
      int? chatId,
      int? senderId,
      int? messageId,
      int? attachId,
      String? createdDate,
      String? content,
      String? updatedDate,
      String? deletedDate,
      int? isRead,
      ContentType? contentType}) {
    return MessageDto(
        localMessageId: localMessageId ?? this.localMessageId,
        chatId: chatId ?? this.chatId,
        senderId: senderId ?? this.senderId,
        messageId: messageId ?? this.messageId,
        createdDate: createdDate ?? this.createdDate,
        content: content ?? this.content,
        attachId: attachId ?? this.attachId,
        updatedDate: updatedDate ?? this.updatedDate,
        deletedDate: deletedDate ?? this.deletedDate,
        isRead: isRead ?? this.isRead,
        contentType: contentType ?? this.contentType);
  }

  Map<String, dynamic> toMap() {
    return {
      DatabaseConst.messagesColumnLocalMessagesId: localMessageId,
      DatabaseConst.messagesColumnChatId: chatId,
      DatabaseConst.messagesColumnSenderId: senderId,
      DatabaseConst.messagesColumnCreatedDate: createdDate,
      DatabaseConst.messagesColumnContent: content,
      DatabaseConst.messagesColumnMessageId: messageId,
      DatabaseConst.messagesColumnUpdatedDate: updatedDate,
      DatabaseConst.messagesColumnDeletedDate: deletedDate,
      DatabaseConst.messagesColumnAttachmentId: attachId,
      DatabaseConst.messagesColumnIsRead: isRead,
      DatabaseConst.messagesColumnContentType: contentType.name
    };
  }

  factory MessageDto.fromMessage(Message message) {
    return MessageDto(
        localMessageId: message.localMessgaeId,
        messageId: message.messageId,
        chatId: message.chatId,
        senderId: message.senderId,
        content: message.content,
        createdDate: message.dateCreate,
        updatedDate: message.dateUpdate,
        attachId: message.attachmentId,
        contentType: message.contentType);
  }
  factory MessageDto.fromMap(Map<String, dynamic> map) {
    return MessageDto(
        localMessageId: map[DatabaseConst.messagesColumnLocalMessagesId] as int,
        chatId: map[DatabaseConst.messagesColumnChatId] as int,
        senderId: map[DatabaseConst.messagesColumnSenderId] as int,
        createdDate: map[DatabaseConst.messagesColumnCreatedDate] as String,
        content: map[DatabaseConst.messagesColumnContent] as String,
        messageId: map[DatabaseConst.messagesColumnMessageId],
        updatedDate: map[DatabaseConst.messagesColumnUpdatedDate] as String,
        deletedDate: map[DatabaseConst.messagesColumnDeletedDate] ?? '',
        attachId: map[DatabaseConst.messagesColumnAttachmentId],
        isRead: map[DatabaseConst.messagesColumnIsRead] as int,
        contentType: map[DatabaseConst.messagesColumnContentType] == null
            ? ContentType.isText
            : map[DatabaseConst.messagesColumnContentType] ==
                    ContentType.isText.name
                ? ContentType.isText
                : map[DatabaseConst.messagesColumnContentType] ==
                        ContentType.isMedia.name
                    ? ContentType.isMedia
                    : map[DatabaseConst.messagesColumnContentType] ==
                            ContentType.isMediaText.name
                        ? ContentType.isMediaText
                        : ContentType.isText);
  }

  String toJson() => json.encode(toMap());

  factory MessageDto.fromJson(String source) =>
      MessageDto.fromMap(json.decode(source));

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MessageDto &&
        other.localMessageId == localMessageId &&
        other.chatId == chatId &&
        other.senderId == senderId &&
        other.messageId == messageId &&
        other.createdDate == createdDate &&
        other.updatedDate == updatedDate &&
        other.content == content &&
        other.attachId == attachId &&
        other.deletedDate == deletedDate &&
        other.isRead == isRead &&
        other.contentType == contentType;
  }

  @override
  int get hashCode {
    return localMessageId.hashCode ^
        chatId.hashCode ^
        senderId.hashCode ^
        messageId.hashCode ^
        createdDate.hashCode ^
        updatedDate.hashCode ^
        deletedDate.hashCode ^
        isRead.hashCode ^
        content.hashCode ^
        attachId.hashCode ^
        contentType.hashCode;
  }

  @override
  String toString() {
    return 'MessageDto(localMessageId: $localMessageId, chatId: $chatId, senderId: $senderId, messageId: $messageId, content: $content, createdDate: $createdDate, updatedDate: $updatedDate, deletedDate: $deletedDate, isRead: $isRead)';
  }
}
