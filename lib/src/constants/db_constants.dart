class DatabaseConst {
  //название и версия бд
  static const dbFileName = 'sfera.db';
  static const dbVersion = 1;

  //название таблиц
  static const messageTable = 'messages';
  static const userTable = 'users';
  static const chatsTable = 'chats';
  static const messageIdTable = 'message_id_in_main'; // Для синхронизации
  static const userLastTimeOnlineTable = 'user_last_time_online';
  static const messageUpdatedTable = 'message_updated';
  static const messageDeletedTable = 'message_deleted';

  //название колонок таблиц
  //users
  static const usersColumnId = 'local_users_id';
  static const usersColumnName = 'name';
  static const usersColumnEmail = 'email';
  static const usersColumnProfilePicLink = 'profile_pic_link';
  static const usersColumnRegistrationDate = 'registration_date';
  static const usersColumnMainUsersId = 'main_users_id';

  //Messages
  static const messagesColumnLocalMessagesId = 'local_messages_id';
  static const messagesColumnLocalChatId = 'local_chat_id';
  static const messagesColumnSenderLocalId = 'sender_is_user';
  static const messagesColumnDate = 'date';
  static const messagesColumnIsWrittenToDb = 'is_written_to_db';
  static const messagesColumnContent = 'content';

  //chats
  static const chatsColumnLocalChatId = 'local_chat_id';
  static const chatsColumnChatIdMain = 'chat_id_main';
  static const chatsColumnFriendId = 'friend_id';

  //message_id_in_main
  static const messageIdColumn = "main_messages_id";
  static const messageIdColumnLocal = "local_messages_id";

  //user_had_been_online
  static const userLastTimeOnlineColumnId = 'user_last_time_online_id';
  static const userLastTimeOnlineColumnisOnline = 'is_online';
  static const userLastTimeOnlineColumnLastTimeOnline = 'last_time_online';

  //message_updated
  static const messageUpdatedColumnMessageIsUpdatedId = 'message_is_updated_id';
  static const messageUpdatedColumnLocalMessagesId = 'local_messages_id';
  static const messageUpdatedColumnWhenUpdated = 'when_updated';

  //message_deleted
  static const messageDeletedColumnID = 'message_deleted_id';
  static const messageDeletedColumnWhenDeleted = 'when_deleted';

  //ключи
  static const integer = 'INTEGER';
  static const primaryKey = 'PRIMARY KEY';
  static const autoincrement = 'AUTOINCREMENT';
  static const notNull = 'NOT NULL';
  static const char50 = 'char(50)';
  static const text = 'TEXT';
  static const constraint = 'CONSTRAINT';
  static const foreignKey = 'FOREIGN KEY';
  static const references = 'REFERENCES';
  static const unique = 'UNIQUE';
  static const date = 'date';
}
