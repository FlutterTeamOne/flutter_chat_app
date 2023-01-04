import 'package:chat_app/domain/data/dto/chat_dto/chat_dto.dart';
import 'package:chat_app/domain/data/dto/user_dto/user_dto.dart';
import 'package:chat_app/modules/client/rest_client.dart';
import 'package:chat_app/modules/signal_service/river/chat_state.ref.dart';
import 'package:chat_app/modules/signal_service/river/user_state_ref.dart';
import 'package:chat_app/modules/storage_manager/db_helper/db_helper.dart';
import 'package:chat_app/modules/storage_manager/db_helper/user_path.dart';
import 'package:chat_app/src/constants/db_constants.dart';
import 'package:chat_app/src/generated/grpc_lib/grpc_message_lib.dart';
import 'package:chat_app/src/generated/grpc_lib/grpc_sync_lib.dart';
import 'package:chat_app/src/generated/grpc_lib/grpc_user_lib.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../client/grpc_client.dart';
import '../../sending_manager/library/library_sending_manager.dart';

class River {
  static final userPod = StateNotifierProvider<UserNotifier, UserStateRef>(
      (ref) => UserNotifier());
  static final futureUserPod = FutureProvider<UserStateRef>(
      (ref) => ref.read(userPod.notifier).readUser());
  static final chatPod =
      StateNotifierProvider<ChatNotfier, ChatStateRef>((ref) => ChatNotfier());
  static final futureChatPod = FutureProvider<ChatStateRef>(
      (ref) => ref.read(chatPod.notifier).readChat());
}

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
      var maxUserId = await _usersServices.getMaxUserId();
      var stub = GrpcSynchronizationClient(GrpcClient().channel);
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
      try {
        response = await stub.getUsersSynh(SynhMainUser(
            mainUserId: maxUserId,
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
            createDate: chat.createdDate, userId: chat.userId);
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
      }

      users = await _usersServices.getAllUsers();
    }
    for (var userServ in users) {
      print('USERS BLOCK: $userServ');
    }
    //Добавляем всех юзеров в state
    return state = state.copyWith(users: users);

    // emit(state.copyWith(users: event.users));
    // print(event.users);
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

class ChatNotfier extends StateNotifier<ChatStateRef> {
  late LocalChatServices _chatServices;
  ChatNotfier() : super(const ChatStateRef()) {
    _chatServices = LocalChatServices();
    DBHelper.instanse.updateListenController.stream.listen((event) {
      if (event) {
        readChat();
      }
    });
  }

  Future<ChatStateRef> readChat([List<ChatDto>? chats]) async {
    //TODO: Поменять getAllChats на сортированную выборку getAllChatsSortedByUpdatedDate()
    var chats = await _chatServices.getAllChatsSortedByUpdatedDate();
    //
    var restChats = await RestClient().getChats();
    print('IF CHATS is NULL - ADD CHAT FROM LOCAL DB: $restChats');
    print('IF CHATS is NULL - ADD CHAT FROM LOCAL DB: $chats');
    //сравниваем два листа и в зависимости от этого меняем стейт на нужный лист
    listEquals(chats, restChats)
        ? state = state.copyWith(chats: restChats)
        : state = state.copyWith(chats: chats);

    //если локальная база отличается от серверной,
    //то перезаписываем локальную базу
    if (!listEquals(chats, restChats)) {
      for (var chat in restChats) {
        await _chatServices.createChat(
            createDate: chat.createdDate, userId: chat.userIdChat);
      }
    } else {
      print('ADD CHAT FROM EVENT: $chats');
      state = state.copyWith(chats: chats);
    }
    return state;
  }

  createChat(ChatDto chat) async {
    var chats = await _chatServices.createChat(
        createDate: chat.createdDate, userId: chat.userIdChat);
    //TODO:запрос к restApi на создание чата
    await RestClient().createChatRest(
        creatorUserId: UserPref.getUserId, user2Id: chat.userIdChat);
    state = state.copyWith(chats: chats);
  }

  void getChatId(int chatId) {
    print('HEY');
    state = state.copyWith(chatId: chatId);
    // return state;
  }

  deleteChat(int chatId) async {
    //TODO: func delete chat
    await _chatServices.deleteChat(id: chatId);
    //запрос на удаление к рест серверу
    await RestClient().deleteChatRest(id: chatId);
    print('CHAT ID: $chatId');
    state = state.copyWith(chatId: null);
  }
}
