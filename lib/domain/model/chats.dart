import '../../storage_manager/database_const.dart';
import 'model.dart';

class Chats extends Model {
  static const table = 'chats';

  final int? id;
  final int chatIdMain;
  final int friendId;
  Chats({
    this.id,
    required this.chatIdMain,
    required this.friendId,
  });

  static Chats fromMap(Map<String, dynamic> map) {
    return Chats(
      id: map[DatabaseConst.columnId]?.toInt(),
      chatIdMain: map[DatabaseConst.columnChatIdMain]?.toInt() ?? 0,
      friendId: map[DatabaseConst.columnFriendId]?.toInt() ?? 0,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      DatabaseConst.columnId: id,
      DatabaseConst.columnChatIdMain: chatIdMain,
      DatabaseConst.columnFriendId: friendId
    };
    if (id != null) {
      map[DatabaseConst.columnId] = id;
    }
    return map;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Chats &&
        other.id == id &&
        other.chatIdMain == chatIdMain &&
        other.friendId == friendId;
  }

  @override
  int get hashCode => id.hashCode ^ chatIdMain.hashCode ^ friendId.hashCode;
}
