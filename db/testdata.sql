INSERT INTO users (name) VALUES ("John Doe");
INSERT INTO users (name) VALUES ("Jane Doe");
INSERT INTO users (name) VALUES ("James Doe");


INSERT Into friends_chat (friend1_id, friend2_id) VALUES(
	(SELECT id FROM users WHERE (name = "John Doe")),
  	(SELECT id FROM users WHERE (name = "Jane Doe"))
);
INSERT Into friends_chat (friend1_id, friend2_id) VALUES(
	(SELECT id FROM users WHERE (name = "John Doe")),
  	(SELECT id FROM users WHERE (name = "James Doe"))
);

INSERT INTO messages (friends_chat_id, reciever_id, sender_id, content) Values (
	(SELECT id From friends_chat WHERE ((friend1_id = 2) AND (friend2_id = 3))),
  	2,
  	3,
  	"hi"
);
INSERT INTO messages (friends_chat_id, reciever_id, sender_id, content) Values (
	(SELECT id From friends_chat WHERE ((friend1_id = 2) AND (friend2_id = 3))),
  	2,
  	3,
  	"how are you?"
);
INSERT INTO messages (friends_chat_id, reciever_id, sender_id, content) Values (
	(SELECT id From friends_chat WHERE ((friend1_id = 2) AND (friend2_id = 3))),
  	3,
  	2,
  	"fine"
);
INSERT INTO messages (friends_chat_id, reciever_id, sender_id, content) Values (
	(SELECT id From friends_chat WHERE ((friend1_id = 3) AND (friend2_id = 4))),
  	3,
  	2,
  	"hi there!"
);















