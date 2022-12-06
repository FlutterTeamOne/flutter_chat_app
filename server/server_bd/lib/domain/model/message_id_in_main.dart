import 'package:flutter_chat_app/storage_manager/database_const.dart';

import 'model.dart';

class MessageIdInMain extends Model {
  static const table = 'message_id_in_main';

  final int? id;
  final int localMessagesId;
  MessageIdInMain({
    this.id,
    required this.localMessagesId,
  });

  static MessageIdInMain fromMap(Map<String, dynamic> map) {
    return MessageIdInMain(
      id: map[DatabaseConst.columnId]?.toInt() ?? 0,
      localMessagesId: map[DatabaseConst.columnLocalMessagesId]?.toInt() ?? 0,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      DatabaseConst.columnId: id,
      DatabaseConst.columnLocalMessagesId: localMessagesId,
    };
    if (id != null) {
      map[DatabaseConst.columnId] = id;
    }
    return map;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MessageIdInMain &&
        other.id == id &&
        other.localMessagesId == localMessagesId;
  }

  @override
  int get hashCode => id.hashCode ^ localMessagesId.hashCode;
}
