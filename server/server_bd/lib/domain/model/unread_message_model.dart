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
