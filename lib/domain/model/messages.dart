import 'model.dart';

class Messages extends Model {
  static const table = 'messages';

  final int? id;
  final int friendsChatId;
  final int recieverId;
  final int senderId;
  final String content;
  Messages({
    this.id,
    required this.friendsChatId,
    required this.recieverId,
    required this.senderId,
    required this.content,
  });

  static Messages fromMap(Map<String, dynamic> map) {
    return Messages(
      id: map['id']?.toInt() ?? 0,
      friendsChatId: map['friends_chat_id']?.toInt() ?? 0,
      recieverId: map['reciever_id']?.toInt() ?? 0,
      senderId: map['sender_id']?.toInt() ?? 0,
      content: map['content']
    );
  }

  @override
  Map<String,dynamic> toJson() {
    Map<String,dynamic> map={
      'id': id,
      'friends_chat_id': friendsChatId,
      'reciever_id': recieverId,
      'sender_id': senderId,
      'content': content,
    };
    if(id!=null){
      map['id']=id;
    }
    return map;
    }
  }

