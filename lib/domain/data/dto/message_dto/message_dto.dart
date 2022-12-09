import 'dart:convert';

import 'package:chat_app/src/constants/db_constants.dart';

import '../model_dto.dart';

class MessageDto extends ModelDto {
  late int? localMessageId;
  final int localChatId;
  final int localSendId;
  final String date;
  final int isWrittenToDb;
  final String content;

  MessageDto(
      {this.localMessageId,
      required this.localChatId,
      required this.localSendId,
      required this.date,
      this.isWrittenToDb = 0,
      required this.content});

  MessageDto copyWith({
    int? localMessageId,
    int? localChatId,
    int? localSendId,
    String? date,
    int? isWrittenToDb,
    String? content,
  }) {
    return MessageDto(
      localMessageId: localMessageId ?? this.localMessageId,
      localChatId: localChatId ?? this.localChatId,
      localSendId: localSendId ?? this.localSendId,
      date: date ?? this.date,
      isWrittenToDb: isWrittenToDb ?? this.isWrittenToDb,
      content: content ?? this.content,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      DatabaseConst.messagesColumnLocalMessagesId: localMessageId,
      DatabaseConst.messagesColumnLocalChatId: localChatId,
      DatabaseConst.messagesColumnSenderLocalId: localSendId,
      DatabaseConst.messagesColumnDate: date,
      DatabaseConst.messagesColumnIsWrittenToDb: isWrittenToDb,
      DatabaseConst.messagesColumnContent: content,
    };
  }

  factory MessageDto.fromMap(Map<String, dynamic> map) {
    return MessageDto(
      localMessageId: map[DatabaseConst.messagesColumnLocalMessagesId] as int,
      localChatId: map[DatabaseConst.messagesColumnLocalChatId] as int,
      localSendId: map[DatabaseConst.messagesColumnSenderLocalId] as int,
      date: map[DatabaseConst.messagesColumnDate] as String,
      isWrittenToDb: map[DatabaseConst.messagesColumnIsWrittenToDb] as int,
      content: map[DatabaseConst.messagesColumnContent] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory MessageDto.fromJson(String source) =>
      MessageDto.fromMap(json.decode(source));

  @override
  String toString() {
    return 'MessageDto(localMessageId: $localMessageId, localChatId: $localChatId, localSendId: $localSendId, date: $date, isWrittenToDb: $isWrittenToDb, content: $content)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MessageDto &&
        other.localMessageId == localMessageId &&
        other.localChatId == localChatId &&
        other.localSendId == localSendId &&
        other.date == date &&
        other.isWrittenToDb == isWrittenToDb &&
        other.content == content;
  }

  @override
  int get hashCode {
    return localMessageId.hashCode ^
        localChatId.hashCode ^
        localSendId.hashCode ^
        date.hashCode ^
        isWrittenToDb.hashCode ^
        content.hashCode;
  }
}
