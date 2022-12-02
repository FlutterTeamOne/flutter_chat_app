-- USERS

INSERT INTO users (name, email, registration_date, profile_pic_link, main_users_id) VALUES (
  "name1",
  "name@example.com",
  20221111230121,
  "../pics/name1.png",
  1
);

INSERT INTO users (name, email, registration_date, profile_pic_link, main_users_id) VALUES (
  "name2",
  "name2@example.com",
  20221111124326,
  "../pics/name2.png",SS
  2
);

INSERT INTO users (name, email, registration_date, profile_pic_link, main_users_id) VALUES (
  "name3",
  "name3@example.com",
  20221112085610,
  "../pics/name3.png",
  98
);

INSERT INTO users (name, email, registration_date, profile_pic_link, main_users_id) VALUES (
  "name4",
  "name4@example.com",
  20220304130817,
  "../pics/name4.png",
  8
);

INSERT INTO users (name, email, registration_date, profile_pic_link, main_users_id) VALUES (
  "name5",
  "name5@example.com",
  20201130113759,
  "../pics/name5.png",
  4
);

INSERT INTO users (name, email, registration_date, profile_pic_link, main_users_id) VALUES (
  "name6",
  "name6@example.com",
  20220905154112,
  "../pics/name6.png",
  123
);

INSERT INTO users (name, email, registration_date, profile_pic_link, main_users_id) VALUES (
  "name7",
  "name7@example.com",
  20211111202021,
  "../pics/name7.png",
  11
);

-- CHATS

INSERT INTO chats (chat_id_main, friend_id) VALUES (
  1,
  2
);

INSERT INTO chats (chat_id_main, friend_id) VALUES (
  3,
  123
);

INSERT INTO chats (chat_id_main, friend_id) VALUES (
  41,
  98
);

-- MESSAGES

INSERT INTO messages (local_chat_id, sender_is_user, date, is_written_to_db, content) VALUES (
  1,
  1,
  20220801220907,
  1,
  "content1 user to friend"
);



INSERT INTO messages (local_chat_id, sender_is_user, date, is_written_to_db, content) VALUES (
  1,
  0,
  202208012209045,
  1,
  "content2 friend to user"
);


INSERT INTO messages (local_chat_id, sender_is_user, date, is_written_to_db, content) VALUES (
  2,
  0,
  20220801211045,
  0,
  "content3 friend to user"
);

--MESSAGE_ID_IN_MAIN

INSERT INTO message_id_in_main (local_messages_id) VALUES (1);
INSERT INTO message_id_in_main (local_messages_id) VALUES (2);


