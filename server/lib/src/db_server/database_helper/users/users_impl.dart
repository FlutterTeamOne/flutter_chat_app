import 'package:sqflite_common/sqlite_api.dart';

import '../../../library/library_server.dart';

class UsersServices implements IUsersServices {
  @override
  createUser(
      {required String name,
      required String email,
      required String createdDate,
      required String profilePicUrl,
      required String password,
      required String updatedDate}) async {
    Database db = await DbServerServices.instanse.database;

    await db.execute('''
      INSERT INTO users (name, email, created_date, profile_pic_url, password, updated_date) VALUES (
        '$name',
        '$email',
        '$createdDate',
        '$profilePicUrl',
        '$password',
        '$updatedDate'
      );
      ''');

    return await db.rawQuery('''
      SELECT * FROM users 
      WHERE (
        (name = '$name') 
        AND 
        (email = '$email')
        AND
        (created_date = '$createdDate')
        AND
        (profile_pic_url = '$profilePicUrl')
        AND
        (password = '$password')
        AND
        (updated_date = '$updatedDate')
        );
    ''');
  }

  @override
  deleteUser({required int newValues, required String condition}) async {
    Database db = await DbServerServices.instanse.database;

    return await db
        .rawDelete('''SELECT FROM users WHERE (main_users_id = id)''');
  }

  @override
  Future<List<Map<String, Object?>>> getAllUsers() async {
    Database db = await DbServerServices.instanse.database;

    //тут json
    var users = await db.rawQuery('''SELECT * FROM users''');

    return users;
    // List<User> userList = [];

    // for (var user in users) {
    //Косяк тут был)
    //   user.forEach((key, value) => userList.add(User(
    //       id: user['user_id'] as int,
    //       name: user['name'] as String,
    //       email: user['email'] as String,
    //       picture: user['profile_pic_url'] as String)));
    // }

    // return Users(users: userList);
  }

  @override
  Future<List<Map<String, Object?>>> getAllUsersMoreId(
      {required int id}) async {
    Database db = await DbServerServices.instanse.database;
    var users =
        await db.rawQuery('''SELECT * FROM users WHERE user_id > $id''');
    return users;
  }

  @override
  Future<List<Map<String, Object?>>> getUser({required int id}) async {
    Database db = await DbServerServices.instanse.database;

    return await db.rawQuery(
        '''SELECT user_id, updated_date, deleted_date FROM users WHERE (user_id = $id)''');
  }

  @override
  Future<List<Map<String, Object?>>> getUserById(
      {required String field, required Object fieldValue}) async {
    Database db = await DbServerServices.instanse.database;

    return await db
        .rawQuery('''SELECT * FROM users WHERE ($field = $fieldValue)''');
  }

  @override
  updateUser({required String newValues, required String condition}) async {
    Database db = await DbServerServices.instanse.database;

    return await db
        .rawUpdate('''UPDATE users SET $newValues WHERE ($condition)''');
  }

  @override
  getUserByField({required String field, required String fieldValue}) async {
    //user by id
    Database db = await DbServerServices.instanse.database;

    return await db
        .rawQuery('''SELECT * FROM users WHERE (user_id = $fieldValue)''');
  }

  @override
  getUserIdByChat({required int senderId, required int chatId}) async {
    Database db = await DbServerServices.instanse.database;

    var friends = await db.rawQuery('''SELECT friend1_id, friend2_id 
        FROM chats 
        WHERE chat_id = $chatId''');
    return friends[0]['friend1_id'] == senderId
        ? friends[0]['friend2_id'] as int
        : friends[0]['friend1_id'] as int;
  }

  @override
  getHashCodeById({required int id}) async {
    Database db = await DbServerServices.instanse.database;

    var hash = await db.rawQuery('''SELECT hash_connect 
        FROM users 
        WHERE user_id = $id''');
    return hash[0]['hash_connect'] as int;
  }

  getAllUsersByIDfriend({required int userId}) async {
    Database db = await DbServerServices.instanse.database;

    var idChatsFriends = await db.rawQuery(''' SELECT friend1_id, friend2_id
          FROM chats 
          WHERE (friend1_id = $userId) OR (friend2_id = $userId)''');
    List<int> idFriends = [];

    for (var idF in idChatsFriends) {
      var idFriend = (idF['friend1_id'] == userId
          ? idF['friend2_id']
          : idF['friend1_id']) as int;
      idFriends.add(idFriend);
    }
    var users = await db.rawQuery('''SELECT *
          FROM users
          WHERE user_id IN (${idFriends.join(",")})''');
    return users;
  }

  getAllUsersByIDfriendMoreChatId(
      {required int id, required int chatId}) async {
    Database db = await DbServerServices.instanse.database;

    var idChatsFriends = await db.rawQuery(''' SELECT friend1_id, friend2_id
          FROM chats 
          WHERE ((friend1_id = $id) OR (friend2_id = $id)) AND (chat_id > $chatId)''');
    List<int> idFriends = [];

    for (var idF in idChatsFriends) {
      var idFriend = (idF['friend1_id'] == id
          ? idF['friend2_id']
          : idF['friend1_id']) as int;
      idFriends.add(idFriend);
    }
    var users = await db.rawQuery('''SELECT *
          FROM users
          WHERE user_id IN (${idFriends.join(",")})''');
    return users;
  }

  @override
  getUpdatedUsers({required List<UserRequest> users}) async {
    List<Map<String, Object?>> usersUpdated = [];
    Database db = await DbServerServices.instanse.database;
    for (var user in users) {
      var userUpdated = await db.rawQuery('''SELECT *
          FROM users
          WHERE (user_id = ${user.userId} AND 
                updated_date NOT LIKE "${user.updatedDate}")''');
      if (userUpdated.length > 0) {
        usersUpdated.add(userUpdated[0]);
      }
    }
    return usersUpdated;
  }
}
