import 'package:chat_app/modules/client/custom_exception.dart';
import 'package:chat_app/modules/sending_manager/services/validator_service/validator_service.dart';
import 'package:chat_app/modules/signal_service/river/user_ref/user_state_ref.dart';
import 'package:chat_app/modules/storage_manager/db_helper/db_helper_start.dart';
import 'package:chat_app/modules/storage_manager/db_helper/user_path.dart';
import 'package:chat_app/src/constants/db_constants.dart';
import 'package:chat_app/src/generated/grpc_lib/grpc_message_lib.dart';
import 'package:chat_app/src/generated/grpc_lib/grpc_sync_lib.dart';
import 'package:chat_app/src/libraries/library_all.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grpc/grpc.dart';

import '../../../../src/generated/grpc_lib/grpc_user_lib.dart';

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
    DBHelper.instanse.updateListenController.stream.listen((event) {
      if (event == DbListener.isUser) {
        localReadUser();
      }
    });
    DBHelperStart.instanse.updateListenController.stream.listen((event) {
      if (event) {
        localReadUser();
      }
    });
  }

  Future<UserStateRef> setUsers(List<UserDto>? users) async {
    return state = state.copyWith(users: users);
  }

  Future<UserStateRef> localReadUser() async {
    var users;
    if (state.userDbthis) {
      //TODO: Брать юзеров без dateDelete
      users = await _usersServices.getAllUsersStart();
    } else {
      users = await _usersServices.getAllUsers();
    }
    return state = state.copyWith(users: users);
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
        usersResponse = await stub.sync(UsersRequest(
            mainUser: UserPref.getUserId, usersForUpdate: usersRequest));
      } catch (e) {
        print(e);
      }
      print("UsersServ NEW ${usersResponse.usersNew}");
      print("UsersServ UPDATED ${usersResponse.usersUpdated}");
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
      ///
      ///Юзеры
      ///
      var mainUserId = await _usersServices.getMainUserId();
      //Юзера для обновления данных
      var usersUp = await _usersServices.getAllUserIdAndUpdated();
      var usersRequest = <UserRequest>[];
      if (usersUp.isNotEmpty) {
        print("lastID ${usersUp.last['user_id']}");
        for (var user in usersUp) {
          usersRequest.add(UserRequest(
              userId: user['user_id'] as int,
              updatedDate: user['updated_date'] as String));
        }
      }

      ///
      ///Чаты
      ///
      var maxChatId = await _chatServices.getMaxId();
      var chatsForUpdate = await _chatServices.getAllChats();
      var chatsRequest = <ChatRequest>[];
      if (chatsForUpdate.isNotEmpty) {
        for (var chat in chatsForUpdate) {
          chatsRequest.add(
              ChatRequest(chatId: chat.chatId, updatedDate: chat.updatedDate));
        }
      }

      ///
      ///Сообщения
      ///
      var maxMessageId = await _messagesServices.getMaxMessageId();
      var messagesForUpdate = await _messagesServices.getAllMessagesNotNull();
      var messagesRequest = <MessageRequest>[];
      if (messagesForUpdate.isNotEmpty) {
        for (var message in messagesForUpdate) {
          messagesRequest.add(MessageRequest(
              messageId: message.messageId, updatedDate: message.updatedDate));
        }
      }

      var stub = GrpcSynchronizationClient(GrpcClient().channel);

      //запрос на сервер
      var response = DataDBResponse();
      print('maxUserId: $mainUserId');
      print('chatId: $maxChatId');
      print('messageId: $maxMessageId');
      try {
        response = await stub.getUsersSynh(MainUserRequest(
          users:
              UsersRequest(mainUser: mainUserId, usersForUpdate: usersRequest),
          chats:
              ChatsRequest(maxChatId: maxChatId, chatsForUpdate: chatsRequest),
          messages: MessagesRequest(
              maxMessageId: maxMessageId, messageForUpdate: messagesRequest),
        ));
      } catch (e) {
        print(e);
      }
      print("NEWUSERS: ${response.users.usersNew}");

      ///
      ///ДОБАВЛЯЕМ НОВЫХ ЮЗЕРОВ
      ///
      for (var user in response.users.usersNew) {
        await ValidatorService.validUser(user: user);
      }

      ///
      ///ДОБАВЛЯЕМ НОВЫЕ ЧАТЫ
      ///
      print('NEW_CHATS: ${response.chats.chatsNew}');
      for (var chat in response.chats.chatsNew) {
        await _chatServices.createChat(
            createDate: chat.createdDate,
            userId: chat.userId,
            chatId: chat.chatId);
      }

      ///
      ///ОБНОВЛЯЕМ СТАРЫХ ЮЗЕРОВ
      ///
      print('REPSONSE_UPDATEUSERS: ${response.users.usersUpdated}');
      for (var user in response.users.usersUpdated) {
        print(
            "deleted date is empty? ${user.deletedDate} ${user.deletedDate.isEmpty}");
        String userAvatar = (user.deletedDate == "" || user.deletedDate.isEmpty)
            ? user.picture
            : """https://www.iconsdb.com/icons/preview/red/cancel-xxl.png""";
        await _usersServices.updateUser(
            newValues: '''name = "${user.name}",
                          email = "${user.email}",
                          created_date = "${user.createdDate}",
                          updated_date = "${user.updateDate}",
                          deleted_date = "${user.deletedDate}",
                          profile_pic_link = "$userAvatar"''',
            condition: 'user_id = ${user.userId}');
      }

      ///
      ///ДОБАВЛЯЕМ НОВЫЕ СООБЩЕНИЯ
      ///
      print("RESPONSE_MESSAGES NEW: ${response.messages.messagesNew}");
      for (var message in response.messages.messagesNew) {
        await ValidatorService.validMessage(message: message);
        // await _messagesServices.addNewMessageFromBase(message: msg);
        await _chatServices.updateChatDateUpdated(
            chatId: message.chatId, dateUpdated: message.updatedDate);
      }

      ///
      ///ОБНОВЛЯЕМ ЧАТЫ
      ///
      print("RESPONSE_UPDATED_CHATS: ${response.chats.chatsUpdated}");
      for (var chats in response.chats.chatsUpdated) {}

      ///
      ///ОБНОВЛЯЕМ СООБЩЕНИЯ
      ///
      print("RESPONSE_UPDATED_MESSAGE: ${response.messages.messagesUpdated}");
      for (var message in response.messages.messagesUpdated) {
        final type = ContentType.isText.name == message.contentType.name
            ? ContentType.isText
            : ContentType.isMedia.name == message.contentType.name
                ? ContentType.isMedia
                : ContentType.isMediaText.name == message.contentType.name
                    ? ContentType.isMediaText
                    : ContentType.isText;
        final msg = MessageDto(
          messageId: message.messageId,
          chatId: message.chatId,
          senderId: message.senderId,
          content: message.content,
          createdDate: message.createdDate,
          updatedDate: message.updatedDate,
          deletedDate: message.deletedDate,
          contentType: type,
          attachId: message.attachmentId,
          isRead: message.isRead,
        );
        print("UPDATEMESSAGE START");
        if (msg.deletedDate != null && msg.deletedDate != '') {
          await _messagesServices.deleteMessage(id: msg.messageId!);
        } else {
          await _messagesServices.updateMessageSynh(msg: msg);
        }
        print("UPDATEMESSAGE END");
      }
      users = await _usersServices.getAllUsers();
    }
    for (var userServ in users) {
      print('USERS IN Base: $userServ');
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
      throw CustomException(e.toString());
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
    //TODO:Артур добавил стрим на изменения состояний при изменении локальной базы у себя в ветке
    var users = await _usersServices.getAllUsers();
    state = state.copyWith(users: users);
  }

  Future<bool> confirmPassword(
      {required int userId, required String password}) async {
    PasswordResponse response;
    GrpcUsersClient stub = GrpcUsersClient(GrpcClient().channel);
    try {
      response = await stub.confirmPassword(
          PasswordConfirmRequest(userId: userId, password: password));
      print('RESULT: $response');
    } on GrpcError catch (e) {
      print('ERROR CONFIRM PASSWORD GRPC_CLIENT: $e');
      throw CustomException(e.message.toString());
    }
    return response.ok;
  }

  Future<bool> changePassword(
      {required int userId,
      required String newPassword,
      required String oldPassword}) async {
    PasswordResponse response = PasswordResponse();
    GrpcUsersClient stub = GrpcUsersClient(GrpcClient().channel);
    try {
      response = await stub.changePassword(PasswordChangeRequest(
          userId: userId, oldPassword: oldPassword, newPassword: newPassword));
      //TODO: Убрать принт
      print('RESULT CHANGE PASSWORD: $response');
    } on GrpcError catch (e) {
      //TODO: Убрать принт
      print('ERROR CHANGE PASSWORD GRPC_CLIENT: $e');
      throw CustomException(e.message.toString());
    }
    return response.ok;
  }
}
