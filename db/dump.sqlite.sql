-- TABLE
CREATE TABLE friends_chat
(
 id integer PRIMARY KEY AUTOINCREMENT,
 friend1_id integer NOT NULL,
 friend2_id integer NOT NULL,
 CONSTRAINT FRIENDS_CHAT_FK_77 FOREIGN KEY ( friend1_id ) REFERENCES users ( "id" ),
 CONSTRAINT FRIENDS_CHAT_FK_78 FOREIGN KEY ( friend2_id ) REFERENCES users ( "id" )
);
CREATE TABLE messages
(
 id              integer PRIMARY KEY AUTOINCREMENT,
 friends_chat_id integer NOT NULL,
 reciever_id     integer NOT NULL,
 sender_id       integer NOT NULL,
 content         char(50) NOT NULL,
 CONSTRAINT MESSAGES_FK_79 FOREIGN KEY ( friends_chat_id ) REFERENCES friends_chat ( "id" ),
 CONSTRAINT MESSAGES_FK_80 FOREIGN KEY ( sender_id ) REFERENCES users ( "id" ),
 CONSTRAINT MESSAGES_FK_82 FOREIGN KEY ( reciever_id ) REFERENCES users ( "id" )
);
CREATE TABLE sqlite_sequence(name,seq);
CREATE TABLE users
(
 id integer PRIMARY KEY AUTOINCREMENT,
 name char(50) NOT NULL
);
 
-- INDEX
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
CREATE INDEX MESSAGES_FK_4 ON messages
(
 reciever_id
);
 
-- TRIGGER
 
-- VIEW
 
