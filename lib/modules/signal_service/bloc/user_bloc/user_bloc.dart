import 'dart:async';
import 'package:chat_app/modules/client/grpc_client.dart';
import 'package:chat_app/modules/signal_service/service_locator/locator.dart';
import 'package:chat_app/modules/storage_manager/db_helper/user_path.dart';
import 'package:chat_app/src/generated/grpc_lib/grpc_message_lib.dart';
import 'package:chat_app/src/generated/grpc_lib/grpc_user_lib.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../domain/data/library/library_data.dart';
import '../../../../src/generated/grpc_lib/grpc_sync_lib.dart';
import '../../../sending_manager/library/library_sending_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  late LocalUsersServices _usersServices;
  late LocalChatServices _chatServices;
  late LocalMessagesServices _messagesServices;
  late MainUserServices _mainUserServices;
  late StreamSubscription _subscription;
  // final GrpcClient grpcClient;
  UserBloc() : super(const UserState()) {
    _usersServices = LocalUsersServices();
    _mainUserServices = MainUserServices();
    _messagesServices = LocalMessagesServices();
    _chatServices = LocalChatServices();
    on<ReadUsersEvent>(_onReadUsersEvent);
    on<CreateUserEvent>(_onCreateUserEvent);
    on<ChangeUserEvent>(_onChangeUserEvent);
    on<DeleteUserEvent>(_onDeleleUserEvent);
  }

  FutureOr<void> _onReadUsersEvent(
      ReadUsersEvent event, Emitter<UserState> emit) async {
    //Получаем всех юзеров из локальной базы
    var users = <UserDto>[];
    //проверяем состояние загруженного пользователя
    if (state.userDbthis) {
      List<Map<String, Object?>> usersForUpdate =
          await _usersServices.getAllUserIdAndUpdated();
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
      var stub = GrpcUsersClient(GrpcClient().channel);
      //отправляем запрос на сервер и получаем всех юзеров
      var usersResponse =
          await stub.usersSync(UsersRequest(users: usersRequest));
      print("UsersServ $usersResponse");
      for (var user in usersResponse.usersNew) {
        //парсим всех юзеров и записываем их в локальное дб
        await _usersServices.createUserStart(
            userId: user.userId,
            name: user.name,
            email: user.email,
            createdDate: user.dateCreate,
            updatedDate: user.dateUpdate,
            deletedDate: user.dateDelete,
            profilePicUrl: user.profilePicUrl);
      }
      for (var user in usersResponse.usersUpdated) {
        //парсим всех юзеров и записываем их в локальное дб
        await _usersServices.updateUserStart(
            newValues: '''name = "${user.name}",
                          email = "${user.email}",
                          created_date = "${user.dateCreate}",
                          updated_date = "${user.dateUpdate}",
                          deleted_date = "${user.dateDelete}",
                          profile_pic_link = "${user.profilePicUrl}"''',
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
      var response = await stub.getUsersSynh(SynhMainUser(
          id: maxUserId, chatId: maxChatId, messageId: maxMessageId));
      for (var user in response.users) {
        await _usersServices.createUser(
            userId: user.userId,
            name: user.name,
            email: user.email,
            createdDate: user.createdDate,
            profilePicUrl: user.picture,
            updatedDate: user.updateDate,
            deletedDate: user.deletedDate);
      }
      print('RESPONSE_CHATS: ${response.chats}');
      for (var chat in response.chats) {
        print('USER BLOC CHAT: $chat');
        await _chatServices.createChat(
            chatId: chat.chatId,
            createDate: chat.createdDate,
            userId: chat.userId);
      }
      for (var message in response.messages) {
        var msg = Message(
          messageId: message.messageId,
          chatId: message.chatId,
          senderId: message.senderId,
          content: message.content,
          dateCreate: message.createdDate,
          dateUpdate: message.updatedDate,
          dateDelete: message.deletedDate,
          isRead: message.isRead,
        );
        await _messagesServices.addNewMessageFromBase(message: msg);
      }

      users = await _usersServices.getAllUsers();
    }

    print('USERS: $users');
    //Добавляем всех юзеров в state
    emit(state.copyWith(users: users));

    // emit(state.copyWith(users: event.users));
    // print(event.users);
    // }
  }

  FutureOr<void> _onCreateUserEvent(
      CreateUserEvent event, Emitter<UserState> emit) async {
    //Принимаем данные юзера во время создания по ивенту
    var user = event.user;
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

  FutureOr<void> _onChangeUserEvent(
      ChangeUserEvent event, Emitter<UserState> emit) {
    print('GET USER PREF: ${UserPref.getUserDbPref} ');
    UserPref.setUserDbPref = event.userDb;
  }

  FutureOr<void> _onDeleleUserEvent(
      DeleteUserEvent event, Emitter<UserState> emit) async {
    var result;
    try {
      result = await GrpcClient().deleteUser(userId: event.userId!);
    } catch (e) {
      print(e);
    }
    print('event: ${event.userId}');
    print(result.isDeleted);
    emit(state.copyWith(isDeleted: result.isDeleted));
  }
}
