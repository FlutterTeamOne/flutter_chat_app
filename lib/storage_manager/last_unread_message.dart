import 'package:flutter_chat_app/storage_manager/user_preferences.dart';

import '../domain/model/message_model.dart';

class UnreadMessage {
  final userPreferences = UserPreferences();
  setUnreadMessage(int messageId, int friendsChatId, bool isRead) async {
    await userPreferences.setFriendsChatId(friendsChatId);
    await userPreferences.setMessageId(messageId);
    await userPreferences.setIsRead(isRead);
  }

  getUnreadMessage() async {
    final friendsChatId = await userPreferences.getFriendsChatId();
    final messageId = await userPreferences.getMessageId();
    final isRead = await userPreferences.getIsRead();
    return LastUnreadMessage(
        friendsChatId: friendsChatId,
        lastUnreadMessageId: messageId,
        isRead: isRead);
  }
}
