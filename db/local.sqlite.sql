-- TABLE
CREATE TABLE chats
(
 local_chat_id  integer PRIMARY KEY AUTOINCREMENT,
 chat_id_main integer NOT NULL UNIQUE,
 friend_id       integer NOT NULL,
 CONSTRAINT CHATS_FK_84 FOREIGN KEY ( friend_id ) REFERENCES users ( local_users_id )
);
CREATE TABLE messages
(
 local_messages_id integer PRIMARY KEY AUTOINCREMENT,
 local_chat_id     integer NOT NULL,
 sender_is_user   integer NOT NULL,
 date             char(26) NOT NULL,
 is_written_to_db  integer NOT NULL DEFAULT 0,
 content           char(50) NOT NULL,
 CONSTRAINT MESSAGES_FK_84_1 FOREIGN KEY ( local_chat_id ) REFERENCES chats ( local_chats_id ),
  CHECK ((is_written_to_db = 0) OR (is_written_to_db = 1)),
  CHECK ((sender_is_user = 0) OR (sender_is_user = 1)),
  CHECK (LENGTH(date) = 26)
);
CREATE TABLE message_id_in_main
(
 main_messages_id  integer PRIMARY KEY AUTOINCREMENT,
 local_messages_id integer NOT NULL UNIQUE,
 CONSTRAINT MESSAGE_ID_IN_MAIN_FK_86 FOREIGN KEY ( local_messages_id ) REFERENCES messages ( local_messages_id )
);
CREATE TABLE users
(
 local_users_id    integer PRIMARY KEY AUTOINCREMENT,
 name              char(50) NOT NULL,
 email             char(50) NOT NULL,
 registration_date char(26) NOT NULL,
 profile_pic_link  char(50) NOT NULL,
 main_users_id     integer NOT NULL UNIQUE,
 CHECK (LENGTH(registration_date) = 26)
);
 
-- INDEX
CREATE INDEX CHATS_FK_3 ON chats
(
 friend_id
);
CREATE INDEX MESSAGES_FK_2 ON messages
(
 local_chat_id
);
CREATE INDEX MESSAGE_ID_IN_MAIN_FK_1 ON message_id_in_main
(
 local_messages_id
);
 
-- TRIGGER
 
-- VIEW

CREATE VIEW messages_in_chat_1 AS
	SELECT * FROM messages WHERE (local_chat_id = 1);
   
CREATE VIEW messages_in_chat_2 AS
	SELECT * FROM messages WHERE (local_chat_id = 2);
