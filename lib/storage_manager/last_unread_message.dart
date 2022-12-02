import 'package:flutter_chat_app/storage_manager/user_preferences.dart';

import '../domain/model/message_model.dart';

class UnreadMessage {
  final userPreferences = UserPreferences();
  setUnreadMessage(int messageId, int friendsChatId, bool isRead) {
    userPreferences.setFriendsChatId(friendsChatId);
    userPreferences.setMessageId(messageId);
    userPreferences.setIsRead(isRead);
  }

  getUnreadMessage() {
    final friendsChatId = userPreferences.getFriendsChatId();
    final messageId = userPreferences.getMessageId();
    final isRead = userPreferences.getIsRead();
    return LastUnreadMessage(
        friendsChatId: friendsChatId,
        lastUnreadMessageId: messageId,
        isRead: isRead);
  }
}
