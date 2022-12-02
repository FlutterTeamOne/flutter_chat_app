abstract class UnreadMessageEvent {}

class SetUnreadEvent extends UnreadMessageEvent {
  int friendsChatId;
  int messageId;
  bool isRead;
  SetUnreadEvent({
    required this.friendsChatId,
    required this.messageId,
    required this.isRead,
});
}