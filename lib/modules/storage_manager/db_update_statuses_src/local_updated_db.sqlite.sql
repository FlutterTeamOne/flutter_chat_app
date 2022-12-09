-- TABLE
CREATE TABLE chats
(
 local_chats_id   integer PRIMARY KEY AUTOINCREMENT,
 chat_id_main_db  integer NOT NULL,
 friend_id        integer NOT NULL,
 date_of_creation char(26) NOT NULL,
 CONSTRAINT CHATS_FK_84 FOREIGN KEY ( friend_id ) REFERENCES users ( local_users_id ),
 CONSTRAINT CHATS_DATE_OF_CREATION_CHECK_1 CHECK ( LENGTH(date_of_creation) = 26 )
);
CREATE TABLE deleted_users
(
 deleted_users_id integer PRIMARY KEY AUTOINCREMENT,
 local_users_id   integer NOT NULL,
 when_deleted     char(26) NOT NULL,
 CONSTRAINT DELETED_USER_FK_88 FOREIGN KEY ( local_users_id ) REFERENCES users ( local_users_id ),
 CONSTRAINT DELETED_USER_DATE_CHECK CHECK ( LENGTH(when_deleted) = 26 )
);
CREATE TABLE messages
(
 local_messages_id integer PRIMARY KEY AUTOINCREMENT,
 local_chat_id     integer NOT NULL,
 sender_local_id   integer NOT NULL,
 date              char(26) NOT NULL,
 is_written_to_db  boolean NOT NULL,
 content           char(50) NOT NULL,
 CONSTRAINT FK_84_1 FOREIGN KEY ( local_chat_id ) REFERENCES chats ( local_chats_id ),
 CONSTRAINT FK_85 FOREIGN KEY ( sender_local_id ) REFERENCES users ( local_users_id ),
 CONSTRAINT MESSAGE_SEND_DATE_CHECK CHECK ( LENGTH(date) = 26 )
);
CREATE TABLE message_deleted
(
 message_deleted_id integer PRIMARY KEY AUTOINCREMENT,
 local_messages_id  integer NOT NULL,
 when_deleted       char(26) NOT NULL,
 CONSTRAINT MESSAGE_DELETED_FK_87 FOREIGN KEY ( local_messages_id ) REFERENCES messages ( local_messages_id ),
 CONSTRAINT MESSAGE_DELETED_DATE_CHECK CHECK ( LENGTH(when_deleted) = 26 )
);
CREATE TABLE message_updated
(
 message_is_updated_id integer PRIMARY KEY AUTOINCREMENT,
 local_messages_id     integer NOT NULL,
 when_updated          char(26) NOT NULL,
 CONSTRAINT MESSAGE_UPDATED_FK_86_1 FOREIGN KEY ( local_messages_id ) REFERENCES messages ( local_messages_id ),
 CONSTRAINT MESSAGE_UPDATED_DATE_CHECK CHECK ( LENGTH(when_updated) = 26 )
);
CREATE TABLE users
(
 local_users_id    integer PRIMARY KEY AUTOINCREMENT,
 name              char(50) NOT NULL,
 email             char(50) NOT NULL,
 registration_date char(26) NOT NULL,
 profile_pic_link  char(50) NOT NULL,
 main_users_id     integer NOT NULL,
 CONSTRAINT USERS_REGISTRATION_DATE_CHECK CHECK ( LENGTH(registration_date) = 26 )
);
CREATE TABLE user_had_been_online
(
 user_had_been_online_id integer PRIMARY KEY AUTOINCREMENT,
 local_users_id          integer NOT NULL,
 is_online               boolean NOT NULL,
 last_time_online        char(26) NULL,
 CONSTRAINT HAD_BEEN_ONLINE_FK_85_1 FOREIGN KEY ( local_users_id ) REFERENCES users ( local_users_id ),
 CONSTRAINT HAD_BEEN_ONLINE_DATE_CHECK_2 CHECK ( LENGTH(last_time_online) = 26 )
);
 
-- INDEX
CREATE INDEX CHATS_FK_3 ON chats
(
 friend_id
);
CREATE INDEX DELETED_USER_FK_2 ON deleted_users
(
 local_users_id
);
CREATE INDEX FK_2 ON messages
(
 local_chat_id
);
CREATE INDEX HAD_BEEN_ONLINE_FK_2 ON user_had_been_online
(
 local_users_id
);
CREATE INDEX MESSAGES_FK_2 ON messages
(
 local_chat_id
);
CREATE INDEX MESSAGES_FK_3 ON messages
(
 sender_local_id
);
CREATE INDEX MESSAGE_DELETED_FK_2 ON message_deleted
(
 local_messages_id
);
CREATE INDEX MESSAGE_UPDATED_FK_2 ON message_updated
(
 local_messages_id
);
 
-- TRIGGER
 
-- VIEW
 
