import 'package:sqflite_common/sqlite_api.dart';

import '../../../library/library_server.dart';

class ChatsServices implements IChatsServices {
  @override
  createChat(
      {required int friend1Id,
      required int friend2Id,
      required String date}) async {
    Database db = await DbServerServices.instanse.database;

    await db.insert(
      'chats',
      {
        "friend1_id": friend1Id,
        "friend2_id": friend2Id,
        "created_date": date,
        "updated_date": date
      },
    );

    return await db.rawQuery('''
      SELECT * FROM chats 
      WHERE (
        (friend1_id = ?) 
        AND 
        (friend2_id = ?)
        AND
        (created_date = ?)
        AND
        (updated_date = ?));
    ''', [friend1Id, friend2Id, date, date]);
  }

  @override
  Future<List<Map<String, Object?>>> getAllChats() async {
    Database db = await DbServerServices.instanse.database;

    return await db.rawQuery('''SELECT * FROM chats''');
  }

  Future<List<Map<String, Object?>>> getAllChatsSortedByUpdatedDate() async {
    Database db = await DbServerServices.instanse.database;

    return await db
        .rawQuery('''SELECT * FROM chats ORDER BY updated_date DESC''');
  }

  @override
  Future<List<Map<String, Object?>>> getChatById({required int id}) async {
    Database db = await DbServerServices.instanse.database;
    var chats = await db.rawQuery('''
      SELECT * FROM chats 
        WHERE (chat_id = $id)
    ''');
    return chats;
  }

  @override
  updateChat({required String newValues, required String condition}) async {
    Database db = await DbServerServices.instanse.database;
    return await db
        .rawUpdate('''UPDATE chats SET $newValues WHERE ($condition)''');
  }

  Future updateChatUpdatedDate(
      {required int id, required String updatedDate}) async {
    Database db = await DbServerServices.instanse.database;
    await db.transaction((txn) async {
      await txn.execute('''
      INSERT INTO chats (updated_date)
        VALUES ('$updatedDate')
        WHERE (chat_id = $id)
      ''');

      return await txn.execute('''SELECT * FROM chats
          WHERE 
          (chat_id = $id)
        ''');
    });
  }

  @override
  Future<int> deleteChat({required int id}) async {
    Database db = await DbServerServices.instanse.database;

    return await db.rawDelete('''DELETE FROM chats WHERE (chat_id = $id)''');
  }

  @override
  Future<List<Map<String, Object?>>> getChatByTwoIds(
      {required int friend1Id, required int friend2Id}) async {
    Database db = await DbServerServices.instanse.database;

    var idChat = await db.rawQuery('''
      SELECT * FROM chats f 
	      WHERE 
        (((f.friend1_id = $friend1Id) AND (f.friend2_id = $friend2Id)) 
        OR 
        ((f.friend1_id = $friend2Id) AND (f.friend2_id = $friend1Id)))''');
    return idChat;
  }

  @override
  Future<List<Map<String, Object?>>> getChatsByUserId(
      {required int userId}) async {
    Database db = await DbServerServices.instanse.database;

    return await db.rawQuery('''SELECT * FROM chats f 
	    WHERE (((f.friend1_id = $userId) OR (f.friend2_id = $userId)) AND (f.deleted_date NOT LIKE '2%'))''');
  }

  @override
  getNewChatsByUserId({required int userId, required List<int> chatIds}) async {
    Database db = await DbServerServices.instanse.database;

    return await db.rawQuery('''SELECT * FROM chats 
	    WHERE ((friend1_id = $userId) OR (friend2_id = $userId))
       AND (chat_id NOT IN (${chatIds.join(",")}))
        AND (deleted_date NOT LIKE '2%')''');
  }

  @override
  getUpdatedChats({required List<ChatRequest> chats}) async {
    List<Map<String, Object?>> chatsUpdated = [];
    Database db = await DbServerServices.instanse.database;
    print("Start take chats from base");
    print(chats);
    for (var chat in chats) {
      var chatUpdated = await db.rawQuery('''SELECT *
          FROM chats
          WHERE (chat_id = ${chat.chatId} AND 
                updated_date NOT LIKE "${chat.updatedDate}")''');
      if (chatUpdated.isNotEmpty) {
        chatsUpdated.add(chatUpdated[0]);
      }
    }
    print("End take chats from base: $chatsUpdated");
    return chatsUpdated;
  }
}
