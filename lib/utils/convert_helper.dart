Map<String, Object> userMapToDB(Map<String, dynamic> model) => {
      "id": "${model['1']}",
      "name": "${model['2']}",
      "email": "${model['3']}",
      "registration_date": "${model['4']}",
      "profile_pic_link": "${model['5']}",
      "main_users_id": "${model['6']}"
    };
Map<String, Object> messageMapToDB(Map<String, dynamic> model) => {
      "id": "${model['1']}",
      "local_chat_id": "${model['2']}",
      "msg_date": "${model['3']}",
      "sender_id": "${model['4']}",
      "is_written_to_db": "${model['5']}",
      "content": "${model['6']}"
    };
Map<String, Object> chatMapToDB(Map<String, dynamic> model) => {
      "id": "${model['1']}",
      "chat_id_main": "${model['2']}",
      "friend_id": "${model['3']}"
    };
