import 'dart:convert';

import 'package:chat_app/src/constants/db_constants.dart';

import '../model_dto.dart';

class ChatDto extends ModelDto {
  final int? chatId;
  final int userIdChat;
  final String createdDate;
  final String updatedDate;
  final String? deletedDate;
  ChatDto({
    this.chatId,
    required this.userIdChat,
    required this.createdDate,
    required this.updatedDate,
    this.deletedDate,
  });

  ChatDto copyWith({
    int? chatId,
    int? userIdChat,
    String? createdDate,
    String? updatedDate,
    String? deletedDate,
  }) {
    return ChatDto(
      chatId: chatId ?? this.chatId,
      userIdChat: userIdChat ?? this.userIdChat,
      createdDate: createdDate ?? this.createdDate,
      updatedDate: updatedDate ?? this.updatedDate,
      deletedDate: deletedDate ?? this.deletedDate,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      DatabaseConst.chatsColumnChatId: chatId,
      DatabaseConst.chatsColumnUserId: userIdChat,
      DatabaseConst.chatsColumnCreatedDate: createdDate,
      DatabaseConst.chatsColumnUpdatedDate: updatedDate,
      DatabaseConst.chatsColumnDeletedDate: deletedDate,
    };
  }

  factory ChatDto.fromMap(Map<String, dynamic> map) {
    return ChatDto(
      chatId: map[DatabaseConst.chatsColumnChatId] as int,
      userIdChat: map[DatabaseConst.chatsColumnUserId] as int,
      createdDate: map[DatabaseConst.chatsColumnCreatedDate] as String,
      updatedDate: map[DatabaseConst.chatsColumnUpdatedDate] as String,
      deletedDate: map[DatabaseConst.chatsColumnDeletedDate] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ChatDto.fromJson(String source) =>
      ChatDto.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ChatDto(ChatId: $chatId, userId: $userIdChat, createdDate: $createdDate, updatedDate: $updatedDate, deletedDate: $deletedDate)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ChatDto &&
        other.chatId == chatId &&
        other.userIdChat == userIdChat &&
        other.createdDate == createdDate &&
        other.updatedDate == updatedDate &&
        other.deletedDate == deletedDate;
  }

  @override
  int get hashCode =>
      chatId.hashCode ^
      userIdChat.hashCode ^
      createdDate.hashCode ^
      updatedDate.hashCode ^
      deletedDate.hashCode;
}
