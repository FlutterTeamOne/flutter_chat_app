--SELECT *

SELECT * FROM user_had_been_online;
SELECT * FROM message_updated;
SELECT * FROM message_deleted;

--SELECT by row id

SELECT * FROM user_had_been_online 
    WHERE(user_had_been_online_id = ?);

SELECT * FROM message_updated 
    WHERE(message_updated_id = ?);

SELECT * FROM message_deleted 
    WHERE(message_deleted_id = ?);

--SELECT by user/message id

SELECT * FROM user_had_been_online 
    WHERE(local_users_id = ?);

SELECT * FROM message_updated 
    WHERE(local_messages_id = ?);

SELECT * FROM message_deleted
    WHERE(local_messages_id = ?);

