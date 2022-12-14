-- TABLE
CREATE TABLE deleted_users
(
 deleted_users_id integer PRIMARY KEY AUTOINCREMENT,
 when_deleted     char(26) NOT NULL,
 main_users_id    integer NOT NULL,
 CONSTRAINT DELETED_USERS_FK_88 FOREIGN KEY ( main_users_id ) REFERENCES users ( main_users_id ),
 CONSTRAINT WHEN_DELETED_CHECK CHECK ( LENGTH(when_deleted) = 26 )
);
CREATE TABLE demo (ID integer primary key, Name varchar(20), Hint text );
CREATE TABLE friends_chat
(
 main_friends_chat_id integer PRIMARY KEY AUTOINCREMENT,
 friend1_id           integer NOT NULL,
 friend2_id           integer NOT NULL,
 CONSTRAINT FRIENDS_CHAT_FK_77 FOREIGN KEY ( friend1_id ) REFERENCES users ( main_users_id ),
 CONSTRAINT FRIENDS_CHAT_FK_78 FOREIGN KEY ( friend2_id ) REFERENCES users ( main_users_id )
);
CREATE TABLE messages
(
 main_messages_id integer PRIMARY KEY AUTOINCREMENT,
 friends_chat_id  integer NOT NULL,
 sender_id        integer NOT NULL,
 content          char(50) NOT NULL,
 date             char(26) NOT NULL,
 CONSTRAINT MESSAGES_FK_79 FOREIGN KEY ( friends_chat_id ) REFERENCES friends_chat ( main_friends_chat_id ),
 CONSTRAINT MESSAGES_FK_80 FOREIGN KEY ( sender_id ) REFERENCES users ( main_users_id ),
 CONSTRAINT MESSAGE_DATE_CHECK CHECK ( LENGTH(date)  = 26 )
);
CREATE TABLE users
(
 main_users_id     integer PRIMARY KEY AUTOINCREMENT,
 name              char(50) NOT NULL,
 email             char(50) NOT NULL,
 registration_date char(26) NOT NULL,
 profile_pic_url   char(50) NOT NULL,
 CONSTRAINT USERS_REGISTRAION_DATE_CHECK CHECK ( LENGTH(registration_date) = 26 )
);
 
-- INDEX
CREATE INDEX DELETED_USERS_FK_2 ON deleted_users
(
 main_users_id
);
CREATE INDEX FRIENDS_CHAT_FK_2 ON friends_chat
(
 friend1_id
);
CREATE INDEX FRIENDS_CHAT_FK_3 ON friends_chat
(
 friend2_id
);
CREATE INDEX MESSAGES_FK_2 ON messages
(
 friends_chat_id
);
CREATE INDEX MESSAGES_FK_3 ON messages
(
 sender_id
);
 
-- TRIGGER
 
-- VIEW
 
