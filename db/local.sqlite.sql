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
 sender_local_id   integer NOT NULL,
 date             date NOT NULL,
 is_written_to_db  boolean NOT NULL,
 content           char(50) NOT NULL,
 CONSTRAINT MESSAGES_FK_84_1 FOREIGN KEY ( local_chat_id ) REFERENCES chats ( local_chats_id ),
 CONSTRAINT MESSAGES_FK_85 FOREIGN KEY ( sender_local_id ) REFERENCES users ( local_users_id )
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
 registration_date date NOT NULL,
 profile_pic_link  char(50) NOT NULL,
 main_users_id     integer NOT NULL UNIQUE
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
CREATE INDEX MESSAGES_FK_3 ON messages
(
 sender_local_id
);
CREATE INDEX MESSAGE_ID_IN_MAIN_FK_1 ON message_id_in_main
(
 local_messages_id
);
 
-- TRIGGER
 
-- VIEW
 
