import 'dart:convert';

import 'package:chat_app/src/constants/db_constants.dart';

import '../model_dto.dart';
class ChatDto extends ModelDto {
  final int localChatId;
  final int chatIdMain;
  final int friendId;

  ChatDto({
    required this.localChatId,
    required this.chatIdMain,
    required this.friendId,
  });

  ChatDto copyWith({
    int? localChatId,
    int? chatIdMain,
    int? friendId,
  }) {
    return ChatDto(
      localChatId: localChatId ?? this.localChatId,
      chatIdMain: chatIdMain ?? this.chatIdMain,
      friendId: friendId ?? this.friendId,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      DatabaseConst.chatsColumnLocalChatId: localChatId,
      DatabaseConst.chatsColumnChatIdMain: chatIdMain,
      DatabaseConst.chatsColumnFriendId: friendId,
    };
  }

  factory ChatDto.fromMap(Map<String, dynamic> map) {
    return ChatDto(
      localChatId: map[DatabaseConst.chatsColumnLocalChatId] as int,
      chatIdMain: map[DatabaseConst.chatsColumnChatIdMain] as int,
      friendId: map[DatabaseConst.chatsColumnFriendId] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory ChatDto.fromJson(String source) => ChatDto.fromMap(json.decode(source));

  @override
  String toString() => 'ChatDto(localChatId: $localChatId, chatIdMain: $chatIdMain, friendId: $friendId)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is ChatDto &&
      other.localChatId == localChatId &&
      other.chatIdMain == chatIdMain &&
      other.friendId == friendId;
  }

  @override
  int get hashCode => localChatId.hashCode ^ chatIdMain.hashCode ^ friendId.hashCode;
}
