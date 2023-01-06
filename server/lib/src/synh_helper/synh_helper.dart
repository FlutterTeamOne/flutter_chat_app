import 'package:server/src/generated/grpcsynh.pb.dart';

class SynhHelper {
  static List<SynhUser> synhUsersResponse({required dynamic users}) {
    List<SynhUser> userList = [];
    if (users == null) {
      return [];
    }
      for (var user in users) {
        var userForList = SynhUser();
        userForList.userId = user['user_id'] as int;
        userForList.name = user['name'] as String;
        userForList.email = user['email'] as String;
        userForList.picture = user['profile_pic_url'] as String;
        userForList.createdDate = user['created_date'] as String;
        userForList.updateDate = user['updated_date'] as String;
        userForList.deletedDate = user['deleted_date'] ?? '';
        userList.add(userForList);
      }
    return userList;
  }

  static List<SynhChat> synhChatsResponse(
      {required dynamic chats, required int mainUserId}) {
    List<SynhChat> chatList = [];
    if (chats == null) {
      return [];
    }
    for (var chat in chats) {
      var chatForList = SynhChat();
      chatForList.chatId = chat['chat_id'] as int;
      chatForList.userId = (chat['friend1_id'] == mainUserId
          ? chat['friend2_id']
          : chat['friend1_id']) as int;
      chatForList.createdDate = chat['created_date'] as String;
      chatForList.updateDate = chat['updated_date'] as String;
      chatForList.deletedDate = chat['deleted_date'] ?? '';
      chatList.add(chatForList);
    }
    return chatList;
  }

  static List<SynhMessage> synhMessagesResponse({required dynamic messages}) {
    List<SynhMessage> messagesList = [];
    if (messages == null) {
      return [];
    }
    for (var message in messages) {
      var type = message['content_type'] == null
          ? ContentTypeSynch.isText
          : message['content_type'] == ContentTypeSynch.isMedia.name
              ? ContentTypeSynch.isMedia
              : message['content_type'] == ContentTypeSynch.isMediaText.name
                  ? ContentTypeSynch.isMediaText
                  : ContentTypeSynch.isText;
      var messageForList = SynhMessage();
      messageForList.senderId = message['sender_id'] as int;
      messageForList.chatId = message['chat_id'] as int;
      messageForList.createdDate = message['created_date'] as String;
      messageForList.messageId = message['message_id'] as int;
      messageForList.content = message['content'] as String;
      messageForList.updatedDate = message['updated_date'] as String;
      messageForList.deletedDate = message['deleted_date'] ?? '';
      messageForList.contentType = type;
      messageForList.attachmentId = message['attachment_id'] ?? 0;
      //Параметра нету в базе
      //messageForList.isRead = messages[i]['is_read'].toInt() ?? 0;
      messagesList.add(messageForList);
    }
    return messagesList;
  }
}
