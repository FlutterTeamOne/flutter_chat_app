class UnreadMessageState {
  int? friendsChatId;
  int? messageId;
  bool? isRead;
  UnreadMessageState({
    this.friendsChatId,
    this.messageId,
    this.isRead,
  });

  UnreadMessageState copyWith(
      {int? friendsChat, int? messageId, bool? isRead}) {
    return UnreadMessageState(
        friendsChatId: friendsChatId, messageId: messageId, isRead: isRead);
  }
}
