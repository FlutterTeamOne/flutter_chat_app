class DatabaseConst {
  //название и версия бд
  static const dbFileName = 'sfera.db';
  static const dbVersion = 1;

  //название таблиц
  static const messageTable = 'messages';
  static const userTable = 'users';
  //название колонок таблиц
  static const columnId = 'id';
  static const columnName = 'name';
  static const columnEmail = 'email';
  static const columnProfilePicLink = 'profile_pic_link';
  static const columnRegistrationDate = 'registration_date';
  static const columnMainUsersId = 'main_users_id';

  static const columnLocalChatId = 'local_chat_id';
  static const columnSenderLocalId = 'sender_id';
  static const columnDate = 'date';
  static const columnIsWrittenToDb = 'is_written_to_db';
  static const columnContent = 'content';
  static const columnFriendId = 'friend_id';
  static const columnChatIdMain = 'chat_id_main';
  static const columnLocalMessagesId = 'local_messages_id';

  //
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