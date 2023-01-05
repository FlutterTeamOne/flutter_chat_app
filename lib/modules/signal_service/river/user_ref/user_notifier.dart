import 'package:chat_app/modules/client/grpc_client.dart';
import 'package:chat_app/modules/signal_service/river/user_ref/user_state_ref.dart';
import 'package:chat_app/modules/storage_manager/db_helper/user_path.dart';
import 'package:chat_app/src/constants/db_constants.dart';
import 'package:chat_app/src/generated/grpc_lib/grpc_message_lib.dart';
import 'package:chat_app/src/generated/grpc_lib/grpc_sync_lib.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../domain/data/library/library_data.dart';
import '../../../../src/generated/grpc_lib/grpc_user_lib.dart';
import '../../../sending_manager/library/library_sending_manager.dart';

class UserNotifier extends StateNotifier<UserStateRef> {
  late MainUserServices _mainUserServices;

  late LocalUsersServices _usersServices;
  late LocalChatServices _chatServices;
  late LocalMessagesServices _messagesServices;
  UserNotifier() : super(const UserStateRef()) {
    _usersServices = LocalUsersServices();
    _mainUserServices = MainUserServices();
    _messagesServices = LocalMessagesServices();
    _chatServices = LocalChatServices();
  }

  Future<UserStateRef> readUser() async {
    //Получаем всех юзеров из локальной базы
    var users = <UserDto>[];
    //проверяем состояние загруженного пользователя
    if (state.userDbthis) {
      List<Map<String, Object?>> usersForUpdate =
          await _usersServices.getAllUserIdAndUpdatedStarted();
      List<UserRequest> usersRequest = [];
      if (usersForUpdate.isNotEmpty) {
        print("lastID ${usersForUpdate.last['user_id']}");
        for (var user in usersForUpdate) {
          usersRequest.add(UserRequest(
              userId: user['user_id'] as int,
              updatedDate: user['updated_date'] as String));
        }
      }
      //подключаемся к серверу
      var stub = GrpcSynchronizationClient(GrpcClient().channel);
      var usersResponse = UsersResponse();
      //отправляем запрос на сервер и получаем всех юзеров
      try {
        usersResponse = await stub.sync(UsersRequest(users: usersRequest));
      } catch (e) {
        print(e);
      }
      print("UsersServ $usersResponse");
      for (var user in usersResponse.usersNew) {
        //парсим всех юзеров и записываем их в локальное дб
        await _usersServices.createUserStart(
            userId: user.userId,
            name: user.name,
            email: user.email,
            createdDate: user.createdDate,
            updatedDate: user.updateDate,
            deletedDate: user.deletedDate,
            profilePicUrl: user.picture);
      }
      for (var user in usersResponse.usersUpdated) {
        await _usersServices.updateUserStart(
            newValues: '''name = "${user.name}",
                          email = "${user.email}",
                          created_date = "${user.createdDate}",
                          updated_date = "${user.updateDate}",
                          deleted_date = "${user.deletedDate}",
                          profile_pic_link = "${user.picture}"''',
            condition: 'user_id = ${user.userId}');
      }
//получаем всех начальных юзеров
      users = await _usersServices.getAllUsersStart();
    } else {
//делаем синхронизацию
      var maxChatId = await _chatServices.getMaxId();
      var maxMessageId = await _messagesServices.getMaxMessageId();
      var stub = GrpcSynchronizationClient(GrpcClient().channel);
      var mainUserId = await _usersServices.getMainUserId();
      //Юзера для обновления данных
      var usersUp = await _usersServices.getAllUserIdAndUpdated();
      var usersRequestA = <UserRequest>[];
      if (usersUp.isNotEmpty) {
        print("lastID ${usersUp.last['user_id']}");
        for (var user in usersUp) {
          usersRequestA.add(UserRequest(
              userId: user['user_id'] as int,
              updatedDate: user['updated_date'] as String));
        }
      }
      //запрос на сервер
      var response = DataDBResponse();
      print('maxUserId: $mainUserId');
      print('chatId: $maxChatId');
      print('messageId: $maxMessageId');
      try {
        response = await stub.getUsersSynh(SynhMainUser(
            mainUserId: mainUserId,
            chatId: maxChatId,
            messageId: maxMessageId,
            users: UsersRequest(users: usersRequestA)));
      } catch (e) {
        print(e);
      }
      print("NEWUSERS: ${response.newUsers}");
      //добавление новых юзеров для новых чатов
      for (var user in response.newUsers) {
        print(
            "deleted date is empty? ${user.deletedDate} ${user.deletedDate.isNotEmpty}");
        if (user.deletedDate.isNotEmpty) {
          const String deletedUserAvatar =
              """https://www.iconsdb.com/icons/preview/red/cancel-xxl.png""";
          await _usersServices.createUser(
              name: user.name,
              email: user.email,
              createdDate: user.createdDate,
              updatedDate: user.updateDate,
              deletedDate: user.deletedDate,
              profilePicUrl: deletedUserAvatar,
              userId: user.userId);
        } else
        //парсим всех юзеров и записываем их в локальное дб
        {
          await _usersServices.createUser(
              name: user.name,
              email: user.email,
              createdDate: user.createdDate,
              updatedDate: user.updateDate,
              deletedDate: user.deletedDate,
              profilePicUrl: user.picture,
              userId: user.userId);
        }
      }
      print('RESPONSE_CHATS: ${response.chats}');
      for (var chat in response.chats) {
        print('USER BLOC CHAT: $chat');
        await _chatServices.createChat(
            createDate: chat.createdDate,
            userId: chat.userId,
            chatId: chat.chatId);
      }
      print('REPSONSE_UPDATEUSERS: ${response.updatedUsers}');
      for (var user in response.updatedUsers) {
        print(
            "deleted date is empty? ${user.deletedDate} ${user.deletedDate.isEmpty}");
        if (user.deletedDate.isNotEmpty) {
          const String deletedUserAvatar =
              """https://www.iconsdb.com/icons/preview/red/cancel-xxl.png""";
          await _usersServices.updateUser(
              newValues: '''name = "${user.name}",
                          email = "${user.email}",
                          created_date = "${user.createdDate}",
                          updated_date = "${user.updateDate}",
                          deleted_date = "${user.deletedDate}",
                          profile_pic_link = "$deletedUserAvatar"''',
              condition: 'user_id = ${user.userId}');
        } else
        //парсим всех юзеров и записываем их в локальное дб
        {
          await _usersServices.updateUser(
              newValues: '''name = "${user.name}",
                          email = "${user.email}",
                          created_date = "${user.createdDate}",
                          updated_date = "${user.updateDate}",
                          deleted_date = "${user.deletedDate}",
                          profile_pic_link = "${user.picture}"''',
              condition: 'user_id = ${user.userId}');
        }
      }
      print("RESPONSE_MESSAGES: ${response.messages}");
      for (var message in response.messages) {
        var type = ContentType.isText.name == message.contentType.name
            ? ContentType.isText
            : ContentType.isMedia.name == message.contentType.name
                ? ContentType.isMedia
                : ContentType.isMediaText.name == message.contentType.name
                    ? ContentType.isMediaText
                    : ContentType.isText;
        var msg = Message(
          messageId: message.messageId,
          chatId: message.chatId,
          senderId: message.senderId,
          content: message.content,
          dateCreate: message.createdDate,
          dateUpdate: message.updatedDate,
          dateDelete: message.deletedDate,
          contentType: type,
          attachmentId: message.attachmentId,
          isRead: message.isRead,
        );
        await _messagesServices.addNewMessageFromBase(message: msg);
        await _chatServices.updateChatDateUpdated(
            chatId: message.chatId, dateUpdated: message.updatedDate);
      }

      users = await _usersServices.getAllUsers();
    }
    for (var userServ in users) {
      print('USERS BLOCK: $userServ');
    }
    //Добавляем всех юзеров в state
    return state = state.copyWith(users: users);

    // emit(state.copyWith(users: users));
    // print(users);
    // }
  }

  Future<void> createUser(UserDto user) async {
    //Принимаем данные юзера во время создания по ивенту

    //отправляем запрос на создание юзера на сервер
//после успешного создания юзера на сервере
    //создаем юзера на локальном бд

    await _usersServices.createUser(
      userId: user.userId!,
      name: user.name,
      email: user.email,
      createdDate: user.createdDate,
      updatedDate: user.updatedDate,
      profilePicUrl: user.profilePicLink,
    );
//Добавляем в main_user table main_id, date_sync and key

    // var stub = await GrpcUsersClient(Locator.getIt<GrpcClient>().channel)
    //     .createUser(user.mainUsersId);
  }

  void changeUser(bool isStartDB) {
    print('GET USER PREF: ${UserPref.getUserDbPref} ');
    UserPref.setUserDbPref = isStartDB;
    print('GET USER PREF: ${UserPref.getUserDbPref} ');
  }

  void deleteUser(int userId) async {
    var result;
    try {
      result = await GrpcClient().deleteUser(userId: userId);
    } catch (e) {
      print(e);
    }
    print('event: $userId');
    print(result.isDeleted);
    state = state.copyWith(isDeleted: result.isDeleted);
  }

  Future<void> updateUser(UserDto user) async {
    var result = UpdateUserResponse();
    try {
      result = await GrpcClient().updateUser(updatedUser: user);
      print('RESULT: $result');
    } catch (e) {
      print(e);
    }
    await _usersServices.updateUser(
        newValues: '''${DatabaseConst.usersColumnName} = "${result.name}",
            ${DatabaseConst.usersColumnEmail} = "${result.email}",
            ${DatabaseConst.usersColumnProfilePicLink} = "${result.profilePicUrl}",
            ${DatabaseConst.usersColumnUpdatedDate} = "${result.dateUpdated}"''',
        condition: '${DatabaseConst.usersColumnUserId} = ${result.userId}');
    var users = await _usersServices.getAllUsers();
    state = state.copyWith(users: users);
  }
}