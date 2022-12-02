import 'dart:convert';

class Message {
  final int id;
  final int friendsChatId;
  final int receiverId;
  final int senderId;
  final String content;
  final bool isRead;
  final DateTime messageCreated;

  Message({
    required this.id,
    required this.friendsChatId,
    required this.receiverId,
    required this.senderId,
    required this.content,
    required this.isRead,
    required this.messageCreated,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'friends_chat_id': friendsChatId,
      'receiver_id': receiverId,
      'sender_id': senderId,
      'content': content,
      'is_read': isRead,
      'messageCreated': messageCreated.microsecondsSinceEpoch,
    };
  }

  factory Message.fromMap(Map<String, dynamic> map) {
    return Message(
      id: map['id']?.toInt() ?? 0,
      friendsChatId: map['friends_chat_id']?.toInt() ?? 0,
      receiverId: map['receiver_id']?.toInt() ?? 0,
      senderId: map['sender_id']?.toInt() ?? 0,
      content: map['content'] ?? '',
      isRead: map['is_read']?.toBool(),
      messageCreated:
          DateTime.fromMillisecondsSinceEpoch(map['messageCreated']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Message.fromJson(String source) =>
      Message.fromMap(json.decode(source));
}

class LastUnreadMessage {
  final int lastUnreadMessageId;
  final int friendsChatId;
  final bool isRead;

  LastUnreadMessage({
    required this.lastUnreadMessageId,
    required this.friendsChatId,
    required this.isRead,
  });
}
