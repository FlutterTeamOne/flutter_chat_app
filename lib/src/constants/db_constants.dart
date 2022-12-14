class DatabaseConst {
  //название и версия бд
  static const dbFileName = 'sfera.db';
  static const dbVersion = 1;
  static const dbFileNameStart = 'startDb.db';

  //название таблиц
  static const messageTable = 'messages';
  static const userTable = 'users';
  static const chatsTable = 'chats';
  static const mainUserTable = 'main_user';
  static const userLastTimeOnlineTable = 'user_last_time_online';
  static const attachmentsTable = 'attachments';

  //название колонок таблиц
  //users
  static const usersColumnUserId = 'user_id';
  static const usersColumnName = 'name';
  static const usersColumnEmail = 'email';
  static const usersColumnProfilePicLink = 'profile_pic_link';
  static const usersColumnCreatedDate = 'created_date';
  static const usersColumnUpdatedDate = 'updated_date';
  static const usersColumnDeletedDate = 'deleted_date';

  //Messages
  static const messagesColumnLocalMessagesId = 'local_messages_id';
  static const messagesColumnChatId = 'chat_id';
  static const messagesColumnSenderId = 'sender_id';
  static const messagesColumnMessageId = 'message_id';
  static const messagesColumnCreatedDate = 'created_date';
  static const messagesColumnIsRead = 'is_read';
  static const messagesColumnContent = 'content';
  static const messagesColumnUpdatedDate = 'updated_date';
  static const messagesColumnDeletedDate = 'deleted_date';
  static const messagesColumnAttachmentId = 'attachment_id';
  static const messagesColumnContentType = 'content_type';

  //chats
  static const chatsColumnChatId = 'chat_id';
  static const chatsColumnUserId = 'user_id';
  static const chatsColumnCreatedDate = 'created_date';
  static const chatsColumnUpdatedDate = 'update_date';
  static const chatsColumnDeletedDate = 'deleted_date';

  //attachments
  static const attachmentsColumnAttachmentId = 'attachment_id';
  static const attachmentsColumnAttachmentMeta = 'attachment_meta';

  //main_user
  static const mainUserColumnUserId = 'user_id';
  static const mainUserColumnKey = 'user_key';
  static const mainUserColumnDataSync = 'date_sync';

  //user_had_been_online
  static const userLastTimeOnlineColumnId = 'user_last_time_online_id';
  static const userLastTimeOnlineColumnisOnline = 'is_online';
  static const userLastTimeOnlineColumnLastTimeOnline = 'last_time_online';

  //ключи
  static const integer = 'INTEGER';
  static const primaryKey = 'PRIMARY KEY';
  static const autoincrement = 'AUTOINCREMENT';
  static const notNull = 'NOT NULL';
  static const char50 = 'char(50)';
  static const char26 = 'char(26)';
  static const char4096 = 'char(4096)';
  static const text = 'TEXT';
  static const constraint = 'CONSTRAINT';
  static const foreignKey = 'FOREIGN KEY';
  static const references = 'REFERENCES';
  static const unique = 'UNIQUE';
  static const date = 'date';
}
