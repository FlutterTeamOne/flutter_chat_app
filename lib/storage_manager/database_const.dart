class DatabaseConst {
  //название и версия бд
  static const dbFileName = 'sfera.db';
  static const dbVersion = 1;

  //названия таблиц
  static const user = 'User';
  static const messages = 'messages';
  static const friendsChat = 'friends_chat';

  //название колонок таблиц
  // static const _columnEmail = 'email';
  // static const _columnProfilePicId = 'profile_pic_id';
  // static const _columnAccountCreated = 'account_created';
  static const columnId = 'id';
  static const columnName = 'name';
  static const columnFriendsChatId = 'friends_chat_id';
  static const columnRecieverId = 'reciever_id';
  static const columnSenderId = 'sender_id';
  static const columnContent = 'content';
  static const columnFirstFriendId = 'friend1_id';
  static const columnSecondFriendId = 'friend2_id';
}
