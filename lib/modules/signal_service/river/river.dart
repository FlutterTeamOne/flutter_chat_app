import 'dart:async';

import 'package:chat_app/domain/data/dto/chat_dto/chat_dto.dart';
import 'package:chat_app/domain/data/dto/message_dto/message_dto.dart';
import 'package:chat_app/domain/data/dto/user_dto/user_dto.dart';
import 'package:chat_app/modules/client/rest_client.dart';
import 'package:chat_app/modules/signal_service/river/chat_state_ref.dart';
import 'package:chat_app/modules/signal_service/river/message_state_ref.dart';
import 'package:chat_app/modules/signal_service/river/user_state_ref.dart';
import 'package:chat_app/modules/storage_manager/db_helper/db_helper.dart';
import 'package:chat_app/modules/storage_manager/db_helper/user_path.dart';
import 'package:chat_app/src/constants/db_constants.dart';
import 'package:chat_app/src/generated/grpc_lib/grpc_message_lib.dart';
import 'package:chat_app/src/generated/grpc_lib/grpc_sync_lib.dart';
import 'package:chat_app/src/generated/grpc_lib/grpc_user_lib.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grpc/grpc.dart';

import '../../client/grpc_client.dart';
import '../../sending_manager/library/library_sending_manager.dart';

enum ConnectionStatus { isConnected, isDisconnected, isPending }

class River {
  static final connectPod =
      StateNotifierProvider<ConnectionNotifier, ConnectionStatus>(
          (ref) => ConnectionNotifier());

  static final userPod = StateNotifierProvider<UserNotifier, UserStateRef>(
      (ref) => UserNotifier());
  static final futureUserPod = FutureProvider<UserStateRef>(
      (ref) => ref.read(userPod.notifier).readUser());

  static final chatPod = StateNotifierProvider<ChatNotifier, ChatStateRef>(
      (ref) => ChatNotifier());
  static final futureChatPod = FutureProvider<ChatStateRef>(
      (ref) => ref.read(chatPod.notifier).readChat());
  static final messagePod =
      StateNotifierProvider<MessageNotifier, MessageStateRef>(
          (ref) => MessageNotifier());
  static final futureMessagePod = FutureProvider<MessageStateRef>(
      (ref) => ref.read(messagePod.notifier).readMessages());
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

class ChatNotifier extends StateNotifier<ChatStateRef> {
  late LocalChatServices _chatServices;
  ChatNotifier() : super(const ChatStateRef()) {
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

class MessageNotifier extends StateNotifier<MessageStateRef> {
  late LocalMessagesServices _messagesServices;
  late LocalUsersServices _userServices;
  late MainUserServices _mainUserServices;
  late StreamSubscription _subscription;
  StreamController<DynamicRequest> messageController =
      StreamController.broadcast();

  var stub = GrpcMessagesClient(GrpcClient().channel,
      options: CallOptions(metadata: {'token': 'some token'}),
      interceptors: []);
  MessageNotifier() : super(const MessageStateRef()) {
    _messagesServices = LocalMessagesServices();

    _userServices = LocalUsersServices();
    _mainUserServices = MainUserServices();

    _subscription =
        stub.streamMessage(messageController.stream).listen((value) async {
      print("MESSAGE!!!!!!!!!!!!!!!");
      print(value.messageState);
      if (value.messageState == MessageStateEnum.isReadMessage) {
        print("READMESSAGE: ${value}");
        var messages = <MessageDto>[];
        var msg = value.readMessage.message;
        await _messagesServices.addNewMessageFromBase(message: msg);
        messages.add(MessageDto(
            chatId: msg.chatId,
            senderId: msg.senderId,
            messageId: msg.messageId,
            content: msg.content,
            createdDate: msg.dateCreate,
            updatedDate: msg.dateUpdate,
            attachId: msg.attachmentId,
            contentType: msg.contentType));
        LocalChatServices().updateChatDateUpdated(
            chatId: messages[0].chatId,
            dateUpdated: '${messages[0].updatedDate}');
        readMessages(messages);
      } else if (value.messageState == MessageStateEnum.isUpdateMessage) {
        var updMsg = value.updateMessage;

        await _messagesServices.updateMessageFromBase(
            content: updMsg.content,
            messageId: updMsg.idMessageMain,
            updateDate: updMsg.dateUpdate);

        print('id Message Main: ${updMsg.idMessageMain}');
        print('date update: ${updMsg.idMessageMain}');

        var messages = await _messagesServices.getAllMessages();

        print('IsUpdate message:$messages');

        readMessages(messages);
      } else if (value.messageState == MessageStateEnum.isDeleteMesage) {
        var del = value.deleteMessage;

        await _messagesServices.deleteMessageFromBase(
            id: del.idMessageMain, dateDelete: del.dateDelete);
        var messages = await _messagesServices.getAllMessages();

        print('IsDelete message:$messages');

        readMessages(messages);
      } else if (value.messageState == MessageStateEnum.isCreateMessage) {
        print("IsCreate: ${value.createMessage.message}");
        var msg = value.createMessage.message;
        var newMsg = MessageDto(
            localMessageId: msg.localMessgaeId,
            messageId: msg.messageId,
            chatId: msg.chatId,
            senderId: msg.senderId,
            content: msg.content,
            createdDate: msg.dateCreate,
            updatedDate: msg.dateUpdate,
            attachId: msg.attachmentId,
            contentType: msg.contentType);

        await _messagesServices.updateMessage(
            message: newMsg, localMessageId: msg.localMessgaeId);
        await LocalChatServices().updateChatDateUpdated(
            chatId: newMsg.chatId, dateUpdated: '${newMsg.updatedDate}');
      }
    });
    DBHelper.instanse.updateListenController.stream.listen((event) async {
      if (event == true) {
        var messages = await _messagesServices.getAllMessages();

        // messages.sort((a, b) => a.localMessageId!.compareTo(b.localMessageId!));

        print('sortListen message:$messages');

        readMessages();
        // state.copyWith(messages: messages);
      }
    });
  }
  Future<MessageStateRef> readMessages([List<MessageDto>? messageList]) async {
    if (messageList == null || messageList.length == 1) {
      var messages = await _messagesServices.getAllMessages();

      print("MESSAGES:$messages");

      state = state.copyWith(messages: messages);
    } else {
      print('EVENT MSG: $messageList');

      state = state.copyWith(messages: messageList);
    }
    return state;
  }

  createMessage(
      {MessageDto? message,
      String? mediaPath,
      MediaState? mediaState,
      ContentType? contentType}) async {
    if (mediaPath != null) {
      state = state.copyWith(mediaPath: mediaPath);
    }
    if (mediaState == MediaState.isCanceled) {
      state = state.copyWith(mediaState: MediaState.isCanceled);
    }
    if (mediaState == MediaState.isPreparation) {
      state = state.copyWith(mediaState: MediaState.isPreparation);
    }
    print('MESSAGE: $message');
    //отправка текстового сообщения
    if (contentType == ContentType.isText && message != null) {
      // ignore: prefer_conditional_assignment
      if (message.localMessageId == null) {
        message.localMessageId = await _messagesServices.addNewMessage(
          chatId: message.chatId,
          senderId: await _mainUserServices.getUserID(),
          content: message.content,
          date: message.createdDate!,
        );
      }
      if (message.messageId == null) {
        var request = CreateMessageRequest(
            message: Message(
                localMessgaeId: message.localMessageId,
                messageId: message.messageId,
                chatId: message.chatId,
                content: message.content,
                senderId: message.senderId));
        // await LocalChatServices().updateChatDateUpdated(chatId: message.chatId, dateUpdated: '${message.createdDate}');
        messageController.add(DynamicRequest(
            createMessage: request,
            messageState: MessageStateEnum.isCreateMessage));
      }
    }
    //отправка сообщения с медиа
    else if (state.mediaPath != null && mediaState == MediaState.isSending) {
      //запрос в рест на добавление медиа
      var resp = await RestClient().sendImageRest(path: state.mediaPath!);

      //получаем обратно model attach
      //записываем всю информацию об сообщении в локальное хранилище
      await _messagesServices.addAttach(resp);

      //записать в локальное хранилище новое
      if (contentType == ContentType.isMedia) {
        message?.localMessageId = await _messagesServices.addNewMessage(
            chatId: message.chatId,
            senderId: await _mainUserServices.getUserID(),
            content: resp.meta,
            date: message.createdDate!,
            attachId: resp.id,
            contentType: contentType);
        var request = CreateMessageRequest(
            message: Message(
                localMessgaeId: message?.localMessageId,
                messageId: message?.messageId,
                chatId: message?.chatId,
                content: resp.meta,
                senderId: message?.senderId,
                attachmentId: resp.id,
                contentType: contentType));
        await LocalChatServices().updateChatDateUpdated(
            chatId: message!.chatId, dateUpdated: '${message.createdDate}');
        messageController.add(DynamicRequest(
            createMessage: request,
            messageState: MessageStateEnum.isCreateMessage));
      }
      if (contentType == ContentType.isMediaText) {
        message?.localMessageId = await _messagesServices.addNewMessage(
            chatId: message.chatId,
            senderId: await _mainUserServices.getUserID(),
            content:
                {'message': message.content, 'media': resp.meta}.toString(),
            date: message.createdDate!,
            attachId: resp.id,
            contentType: contentType);

        //и отправляем через grpc второму клиенту
        var request = CreateMessageRequest(
            message: Message(
                localMessgaeId: message?.localMessageId,
                messageId: message?.messageId,
                chatId: message?.chatId,
                content: {'message': message?.content, 'media': resp.meta}
                    .toString(),
                senderId: message?.senderId,
                attachmentId: message?.attachId,
                contentType: contentType));
        await LocalChatServices().updateChatDateUpdated(
            chatId: message!.chatId, dateUpdated: '${message.createdDate}');
        messageController.add(DynamicRequest(
            createMessage: request,
            messageState: MessageStateEnum.isCreateMessage));
      }
      //обнуляем состояния
      state =
          state.copyWith(mediaState: MediaState.isCanceled, mediaPath: null);
    }
  }

  updateMessage(
      {MessageDto? message, int? messageId, EditState? isEditing}) async {
    if (isEditing == EditState.isPreparation) {
      state = state.copyWith(
          editState: EditState.isPreparation, messageId: messageId);
    }
    if (isEditing == EditState.isEditing) {
      //Обновляем сообщение в локальном хранилище
      await _messagesServices.updateMessage(
          message: message!, localMessageId: state.messageId!);
      state = state.copyWith(editState: EditState.isNotEditing);

      try {
        // отправляем обновленное сообщение на сервер
        var messageUpdateRequest = UpdateMessageRequest(
            idMessageMain: message.messageId, content: message.content);
        messageController.add(
          DynamicRequest(
              updateMessage: messageUpdateRequest,
              messageState: MessageStateEnum.isUpdateMessage),
        );
        //получаем от сервера ответ
//         var messageUpdateResponse =
//             await stub.updateMessage(messageUpdateRequest);
// //записываем в локальную бд полученные данные от сервера
//         if (messageUpdateResponse.idMessageMain == state.messageId) {
//           await _messagesServices.updateWrittenToServer(
//               localMessageId: state.messageId!,
//               messagesId: messageUpdateResponse.idMessageMain,
//               updatedDate: messageUpdateResponse.dateUpdate);
//           print('id Message Main: ${messageUpdateResponse.idMessageMain}');
//           print('date update: ${messageUpdateResponse.dateUpdate}');
//         }
      } catch (e) {}
    }
    if (isEditing == EditState.isNotEditing) {
      state = state.copyWith(editState: EditState.isNotEditing);
    }
  }

  deleteMessage({required int messageId}) async {
    await _messagesServices.deleteMessage(id: messageId);
    // add(ReadMessageEvent());
    print('message ID: $messageId');
    state = state.copyWith(
        deleteState: DeleteState.isDeleted, editState: EditState.isNotEditing);
    var messageDelete = DynamicRequest(
        deleteMessage: DeleteMessageRequest(idMessageMain: messageId),
        messageState: MessageStateEnum.isDeleteMesage);
    try {
      messageController.add(messageDelete);
      // print('DEL DATE: ${response.dateDelete}');
      // print('DEL ID: ${response.idMessageMain}');

      // await _messagesServices.updateWrittenToServer(localMessageId: localMessageId, updatedDate: updatedDate)
    } catch (e) {}
  }
}

class ConnectionNotifier extends StateNotifier<ConnectionStatus> {
  StreamSubscription<ConnectivityResult>? connectStream;
  final _connectivity = Connectivity();
  ConnectionStatus? lastState;
  ConnectionStatus? newState;
  ConnectionNotifier() : super(ConnectionStatus.isPending) {
    if (state == ConnectionStatus.isConnected) {
      lastState = ConnectionStatus.isConnected;
    } else {
      lastState = ConnectionStatus.isDisconnected;
    }
    lastState = ConnectionStatus.isPending;
    connectStream =
        _connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
      switch (result) {
        case ConnectivityResult.wifi:
        case ConnectivityResult.mobile:
        case ConnectivityResult.ethernet:
          newState = ConnectionStatus.isConnected;
          break;
        case ConnectivityResult.none:
          newState = ConnectionStatus.isDisconnected;
          break;
        default:
      }
      if (newState != state) {
        state = newState!;
        lastState = newState;
      }
    });
  }
  @override
  void dispose() {
    connectStream?.cancel();
    super.dispose();
  }
}
