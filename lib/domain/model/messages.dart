import 'package:flutter_chat_app/storage_manager/database_const.dart';

import 'model.dart';

class Messages extends Model {
  static const table = 'messages';

  final int? id;
  final int localChatId;
  final int senderLocalId;
  final String date;
  final bool isWrittenToDb;
  final String content;
  Messages({
    this.id,
    required this.localChatId,
    required this.senderLocalId,
    required this.date,
    required this.isWrittenToDb,
    required this.content,
  });

  static Messages fromMap(Map<String, dynamic> map) {
    return Messages(
        id: map[DatabaseConst.columnId]?.toInt() ?? 0,
        localChatId: map[DatabaseConst.columnLocalChatId]?.toInt() ?? 0,
        senderLocalId: map[DatabaseConst.columnSenderLocalId]?.toInt() ?? 0,
        date: map[DatabaseConst.columnDate],
        isWrittenToDb: map[DatabaseConst.columnIsWrittenToDb] == 1,
        content: map[DatabaseConst.columnContent]);
  }

  @override
  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      DatabaseConst.columnId: id,
      DatabaseConst.columnLocalChatId: localChatId,
      DatabaseConst.columnSenderLocalId: senderLocalId,
      DatabaseConst.columnDate: date,
      DatabaseConst.columnIsWrittenToDb: isWrittenToDb ? 1 : 0,
      DatabaseConst.columnContent: content,
    };
    if (id != null) {
      map[DatabaseConst.columnId] = id;
    }
    return map;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Messages &&
        other.id == id &&
        other.localChatId == localChatId &&
        other.senderLocalId == senderLocalId &&
        other.date == date &&
        other.isWrittenToDb == isWrittenToDb &&
        other.content == content;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        localChatId.hashCode ^
        senderLocalId.hashCode ^
        date.hashCode ^
        isWrittenToDb.hashCode ^
        content.hashCode;
  }
}
