import 'model.dart';

class FriendsChat extends Model {
  static const table = 'friends_chat';

  final int? id;
  final int firstFriendId;
  final int secondFriendId;
  FriendsChat({
    this.id,
    required this.firstFriendId,
    required this.secondFriendId,
  });

  static FriendsChat fromMap(Map<String, dynamic> map) {
    return FriendsChat(
      id: map['id']?.toInt(),
      firstFriendId: map['friend1_id']?.toInt() ?? 0,
      secondFriendId: map['friend2_id']?.toInt() ?? 0,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'id': id,
      'friend1_id': firstFriendId,
      'friend2_id': secondFriendId
    };
    if (id != null) {
      map['id'] = id;
    }
    return map;
  }
}
