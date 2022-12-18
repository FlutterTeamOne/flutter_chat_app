import 'dart:async';

import 'package:grpc/grpc.dart';
import 'package:server/src/generated/users.pb.dart';

import 'package:server/src/library/library_server.dart';

///
///Заполняем все методы как и в Protoc файле
///
class GrpcMessage extends GrpcMessagesServiceBase {
  var messagesService = MessagesServices();
  var chatsService = ChatsServices();
  var usersService = UsersServices();
  // var _controller = <int, StreamController<MessageFromBase>>{};

  //   @override
  // Future<ConnectResponse> connecting(
  //     ServiceCall call, ConnectRequest request) async {
  //   //save to db
  //   print('Connect: id: ${request.id}  hashcode: ${request.hashCode}');

  //   return ConnectResponse(id: request.id, hashConnect: request.hashCode);
  // }

  // @override
  // Future<CreateMessageResponse> createMessage(
  //     ServiceCall call, CreateMessageRequest request) async {
  //   var src = await messagesService.addNewMessage(
  //     chatId: request.chatIdMain,
  //     senderId: request.senderMainId,
  //     content: request.content,
  //   );
  //   print('SRC: $src');
  //   var message = CreateMessageResponse();

  //   if (src['message_id'] != 0) {
  //     message.dateCreate = src['created_date'] as String;
  //     message.mainMessagesId = src['message_id'] as int;
  //   } else {
  //     message.mainMessagesId = 555; // message.ok = false;
  //   }
  //   print('SERVER MESSAGE: $message');
  //   var mes =
  //       await messagesService.getMessageById(id: src['message_id'] as int);
  //   print('MES: $mes');
  //   var messageFromBase = MessageFromBase(
  //       chatIdMain: mes[0]['chat_id'],
  //       senderMainId: mes[0]['sender_id'],
  //       content: mes[0]['content'],
  //       date: mes[0]['created_date'],
  //       mainIdMessage: mes[0]['message_id']);
  //   print('MESfrom: $messageFromBase');
  //   var receiverId = await usersService.getUserIdByChat(
  //       senderId: request.senderMainId, chatId: request.chatIdMain);
  //   print('receiverId: $receiverId');
  //   var hashConnect;
  //   try {
  //     hashConnect = await usersService.getHashCodeById(id: receiverId);
  //   } catch (e) {
  //     print(e);
  //   }
  //   print("HASH: $hashConnect");
  //   hashConnect != null
  //       ? _controller[hashConnect]?.sink.add(messageFromBase)
  //       : print("user $receiverId not connecting");
  //   return message;
  // }

  // @override
  // Stream<MessageFromBase> synchronization(
  //     ServiceCall call, LastMessage request) async* {
  //   var messages = await messagesService.getRecentMessages(message: request);
  //   MessageFromBase lastMessage = MessageFromBase();
  //   if (messages.length == 0) {
  //     yield lastMessage;
  //   } else {
  //     for (int i = 0; i < messages.length; i++) {
  //       MessageFromBase lastMessage = MessageFromBase();
  //       lastMessage.mainIdMessage = messages[i]['message_id'];
  //       lastMessage.chatIdMain = messages[i]['chat_id'];
  //       lastMessage.senderMainId = messages[i]['sender_id'];
  //       lastMessage.content = messages[i]['content'];
  //       lastMessage.date = messages[i]['created_date'];
  //       yield lastMessage;
  //     }
  //   }
  // }

  // @override
  // Future<UpdateMessageResponse> updateMessage(
  //     ServiceCall call, UpdateMessageRequest request) async {
  //   var timeUpdate = DateTime.now().toIso8601String();
  //   var src = await messagesServices.updateMessage(
  //       newValues:
  //           "content = '${request.content}', updated_date = '$timeUpdate'",
  //       condition: "message_id = ${request.idMessageMain}");
  //   print('UPD SRC:$src');
  //   var message = UpdateMessageResponse();
  //   if (src != 0) {
  //     message.idMessageMain = request.idMessageMain;
  //     message.dateUpdate = timeUpdate;
  //   }
  //   print('UPD MSG: $message');
  //   return message;
  // }

  // @override
  // Future<DeleteMessageResponse> deleteMessage(
  //     ServiceCall call, DeleteMessageRequest request) async {
  //   var timeDelete = DateTime.now().toIso8601String();
  //   var src = await messagesService.updateMessage(
  //       newValues: "deleted_date = '$timeDelete', updated_date = '$timeDelete'",
  //       condition: "message_id = ${request.idMessageMain}");
  //   var message = DeleteMessageResponse();
  //   if (src != 0) {
  //     message.dateDelete = timeDelete;
  //     message.idMessageMain = request.idMessageMain;
  //   }
  //   return message;
  // }

  // @override
  // Stream<MessageFromBase> connectings(
  //     ServiceCall call, Stream<ConnectRequest> request) async* {
  //   var connectController = StreamController<MessageFromBase>();

  //   late int id;
  //   request.listen((mes) async {
  //     print('listening...${mes.hashCode}');
  //     id = mes.id;
  //     _controller[mes.hashCode] = connectController;
  //     await usersService.updateUser(
  //         newValues: 'hash_connect = ${mes.hashCode}',
  //         condition: 'user_id = ${mes.id}');
  //   }).onError((dynamic e) async {
  //     print(e);
  //     _controller.remove(await usersService.getHashCodeById(id: id));
  //     connectController.close();
  //     await usersService.updateUser(
  //         newValues: 'hash_connect = null', condition: 'user_id = $id');
  //     print('Disconnected: #${request.hashCode}');
  //   });
  //   try {
  //     await for (final message in connectController.stream) {
  //       print('yield');
  //       yield message;
  //     }
  //   } on GrpcError catch (e) {
  //     print(e);
  //   } finally {
  //     _controller.remove(await usersService.getHashCodeById(id: id));
  //     connectController.close();
  //     await usersService.updateUser(
  //         newValues: 'hash_connect = null', condition: 'user_id = $id');
  //     print('Disconnected: #${request.hashCode}');
  //   }
  // }

  // @override
  // Future<Empty> connecting(ServiceCall call, Empty request) {
  //   // TODO: implement connecting
  //   throw UnimplementedError();
  // }
  // var messages = <Message>[];
  // var streamController = StreamController<Message>.broadcast();

  final _controllers = <StreamController<DynamicResponse>, void>{};
// print('stream: ${streamController.hasListener}');

  @override
  Stream<DynamicResponse> streamMessage(
      ServiceCall call, Stream<DynamicRequest> request) async* {
    var clientController = StreamController<DynamicResponse>();
    _controllers[clientController] = null;

    // yield Dynamic(readMessageRequest: ReadMessageRequest(message: Message()));
    request.listen((req) async {
      if (req.messageState == MessageStateEnum.connecting) {
        await usersService.updateUser(
            newValues: 'hash_connect = ${request.hashCode}',
            condition: 'user_id = ${req.createMessage.message.senderId}');
        print('REQ message: ${req.createMessage.message.senderId}');
      }
      if (req.messageState == MessageStateEnum.isCreateMessage) {
        var newMessage = await messagesService.addNewMessage(
          chatId: req.createMessage.message.chatId,
          senderId: req.createMessage.message.senderId,
          content: req.createMessage.message.content,
        );

        req.createMessage.message.messageId = newMessage['message_id'] as int;
        req.createMessage.message.dateCreate =
            newMessage['created_date'] as String;
        req.createMessage.message.dateUpdate =
            newMessage['updated_date'] as String;
        print('REQ message UPDATE: ${req.createMessage.message}, ');
        _controllers.forEach((controller, _) async => await _onCreateMessage(
            controller: controller,
            clientController: clientController,
            req: req));
      }
      if (req.messageState == MessageStateEnum.isUpdateMessage) {
        _controllers.forEach((controller, _) async => await _onUpdateMessage(
            controller: controller,
            clientController: clientController,
            req: req));
      }
      if (req.messageState == MessageStateEnum.isDeleteMesage) {
        _controllers.forEach((controller, _) async => _onDeleteMessage(
            controller: controller,
            clientController: clientController,
            req: req));
      }
    }).onError((dynamic e) {
      print(e);

      _controllers.remove(clientController);
      clientController.close();
      print('Disconnected: #${request.hashCode}');
    });

    // await for (var req in request) {
    //   if (req.messageState == MessageState.connecting) {
    //     print(
    //         'Request from ${req.createMessage.message.senderId} (#${request.hashCode}) message: ${req.createMessage.message.content}');
    //     await usersService.updateUser(
    //         newValues: 'hash_connect = ${request.hashCode}',
    //         condition: 'user_id = ${req.createMessage.message.senderId}');
    //     print('Sender Id');
    //     // } else if (req.messageState == MessageState.isCreateMessage) {
    //     print(
    //         'Request from ${req.createMessage.message.senderId} (#${request.hashCode}) message: ${req.createMessage.message.content}');

    //     //         var receiverId = await usersService.getUserIdByChat(
    //     //           senderId: req.createMessage.message.senderId,
    //     //            chatId: req.createMessage.message.chatId);
    //     //         var hashConnect;
    //     //         try {
    //     //           hashConnect = await usersService.getHashCodeById(id: receiverId);
    //     //         } catch (e) {
    //     //         print(e);
    //     //       }
    //     //       print("HASH: $hashConnect");
    //     //       hashConnect != null
    //     //     ? _controllers[hashConnect]?.sink.add(req.createMessage.message)
    //     //     : print("user $receiverId not connecting");
    //     // if (controller != clientController) {
    //     //   print('REQ message: ${req.createMessage.message}');
    //     //   // messages.add(req.message);
    //     //   controller[request.hashCode].sink.add(req.createMessage.message);
    //     // }

    //     // request.listen((req) {
    //     //   _controllers.forEach((userId, controller) {
    //     //     if (controller != clientController) {
    //     //       print('REQ message: ${req.message}');
    //     //       // messages.add(req.message);
    //     //       controller.sink.add(req.message);
    //     //     }
    //     //   });
    //     // }).onError((dynamic e) {
    //     //   print(e);
    //     //   _controllers.remove(clientController);

    //     //   clientController.close();
    //     //   print('Disconnected: #${request.hashCode}');
    //     // });

    await for (final req in clientController.stream) {
      print('  -> piped to #${request.hashCode}');
      yield req;
    }

    //   if (req.messageState == MessageState.isDelteMesage) {}
    //   if (req.messageState == MessageState.isUpdateMessage) {}
    // }
  }

  _onCreateMessage(
      {required StreamController<DynamicResponse> controller,
      required StreamController<DynamicResponse> clientController,
      required DynamicRequest req}) async {
    print('for Each Create');
    var message = DynamicResponse();
    if (controller != clientController) {
      message = DynamicResponse(
          readMessage: ReadMessageResponse(message: req.createMessage.message),
          messageState: MessageStateEnum.isReadMessage);
      print(message.messageState);
      controller.sink.add(message);
    } else {
      print('CREATE MSG: ${req.createMessage.message}');
      message = DynamicResponse(
          createMessage:
              CreateMessageResponse(message: req.createMessage.message),
          messageState: MessageStateEnum.isCreateMessage);
      print(message.messageState);
      controller.sink.add(message);
    }

    ///ТУТ
    // } else {
    //   controller.sink.add(
    //     Dynamic(
    //         updateMessage: UpdateMessageRequest(
    //             idMessageMain: req.readMessageRequest.message.messageId),
    //         messageState: MessageStateEnum.isUpdateMessage),
    //   );
    // }
  }

  _onUpdateMessage(
      {required StreamController<DynamicResponse> controller,
      required StreamController<DynamicResponse> clientController,
      required DynamicRequest req}) async {
    print('for Each Update');
    var timeUpdate = DateTime.now().toIso8601String();
    await messagesService.updateMessage(
        newValues:
            "content = '${req.updateMessage.content}', updated_date = '$timeUpdate'",
        condition: "message_id = ${req.updateMessage.idMessageMain}");
    var updateMessage = DynamicResponse();
    if (controller != clientController) {
      updateMessage = DynamicResponse(
        updateMessage: UpdateMessageResponse(
            dateUpdate: timeUpdate,
            content: req.updateMessage.content,
            idMessageMain: req.updateMessage.idMessageMain),
        messageState: MessageStateEnum.isUpdateMessage,
      );
      controller.add(updateMessage);
    } else {
      updateMessage = DynamicResponse(
          updateMessage: UpdateMessageResponse(
              dateUpdate: timeUpdate,
              idMessageMain: req.updateMessage.idMessageMain),
          messageState: MessageStateEnum.isUpdateMessage);
      controller.add(updateMessage);
    }
  }

  _onDeleteMessage(
      {required StreamController<DynamicResponse> controller,
      required StreamController<DynamicResponse> clientController,
      required DynamicRequest req}) async {
    var dateDelete = DateTime.now().toIso8601String();
    await messagesService.updateMessage(
        newValues: 'deleted_date = $dateDelete',
        condition: 'message_id=${req.deleteMessage.idMessageMain}');
    if (controller != clientController) {
      var delMsg = DynamicResponse(
          deleteMessage: DeleteMessageResponse(
            idMessageMain: req.deleteMessage.idMessageMain,
            dateDelete: dateDelete,
          ),
          messageState: MessageStateEnum.isDeleteMesage);
      controller.add(delMsg);
    } else {}
  }
}

class GrpcChats extends GrpcChatsServiceBase {
  @override
  Future<CreateChatResponse> createChat(
      ServiceCall call, CreateChatRequest request) async {
    var src = await ChatsServices().createChat(
        friend1_id: request.friend1Id, friend2_id: request.friend1Id);
    var createChatResponse = CreateChatResponse();
    if (src[0]['chat_id'] != 0) {
      createChatResponse.id = src[0]['chat_id'];
      createChatResponse.createdDate = DateTime.now().toIso8601String();
    }
    return createChatResponse;
  }

  @override
  Future<DeleteChatResponse> deleteChat(
      ServiceCall call, DeleteChatRequest request) async {
    var deleteResponse = DeleteChatResponse();
    var src = await ChatsServices().deleteChat(id: request.id);
    if (src != 0) {
      deleteResponse.dateDeleted = DateTime.now().toIso8601String();
    }
    return deleteResponse;
  }

  @override
  Future<GetChatResponse> getChat(
      ServiceCall call, GetChatRequest request) async {
    var getChatResp = GetChatResponse();
    var src = await ChatsServices().getChatById(id: request.id);

    if (src[0]['user_id'] != 0 && src[0]['user_id'] != null) {
      getChatResp.friend1Id = src[0]['friend1_id'];
      getChatResp.friend2Id = src[0]['friend2_id'];
      getChatResp.createdDate = DateTime.now().toIso8601String();
    }
    return getChatResp;
  }

  @override
  Future<UpdateChatResponse> updateChat(
      ServiceCall call, UpdateChatRequest request) async {
    var updateChatResp = UpdateChatResponse();

    return updateChatResp;
  }
}

class GrpcUsers extends GrpcUsersServiceBase {
  @override
  Future<CreateUserResponse> createUser(
      ServiceCall call, CreateUserRequest request) async {
    var src = await UsersServices().createUser(
        name: request.name,
        email: request.email,
        registrationDate: request.dateCreated,
        profilePicUrl: request.profilePicUrl,
        password: request.password);
    var createUserResponse = CreateUserResponse();
    if (src['main_users_id'] != 0) {
      createUserResponse.dateCreated = request.dateCreated;
      createUserResponse.email = request.email;
      createUserResponse.name = request.name;
      createUserResponse.profilePicUrl = request.profilePicUrl;
      createUserResponse.id = src['main_users_id'];
    }
    return createUserResponse;
  }

  @override
  Future<DeleteUserResponse> deleteUser(
      ServiceCall call, DeleteUserRequest request) async {
    var deleteUserResponse = DeleteUserResponse();
    var dateDeleted = DateTime.now().toIso8601String();
    var src = await UsersServices().updateUser(
        newValues: 'deleted_date = $dateDeleted',
        condition: 'user_id = ${request.id}');
    if (src != 0) {
      deleteUserResponse.isDeleted = true;
    }
    return deleteUserResponse;
  }

  @override
  Future<GetUserResponse> getUser(
      ServiceCall call, GetUserRequest request) async {
    var getUserResponse = GetUserResponse();
    var src;
    if (!request.id.isNaN) {
      src = await UsersServices()
          .getUserByField(field: 'user_id', fieldValue: request.id);
    } else if (request.name.isNotEmpty) {
      src = await UsersServices()
          .getUserByField(field: 'name', fieldValue: request.name);
    } else if (request.email.isNotEmpty) {
      src = await UsersServices()
          .getUserByField(field: 'email', fieldValue: request.email);
    } else if (request.dateCreation.isNotEmpty) {
      src = await UsersServices().getUserByField(
          field: 'created_date', fieldValue: request.dateCreation);
    } else {
      // // return GrpcError.invalidArgument()
    }
    return getUserResponse;
  }

  @override
  Future<UpdateUserResponse> updateUser(
      ServiceCall call, UpdateUserRequest request) async {
    var updateUserResponse = UpdateUserResponse();
    updateUserResponse.dateUpdated = DateTime.now().toIso8601String();
    var src = await UsersServices().updateUser(
        newValues:
            'name = ${request.name}, email = ${request.email}, profile_pic_url = ${request.profilePicUrl}, password = ${request.password}, updated_date = ${updateUserResponse.dateUpdated}',
        condition: 'user_id = ${request.id}');
    if (src != 0) {
      updateUserResponse.isUpdated = true;
    }
    return updateUserResponse;
  }

  @override
  Future<Users> getAllUsers(ServiceCall call, EmptyUser request) async {
    var usersList = <User>[];
    var users;
    if (request.lastId == 0) {
      users = await usersServices.getAllUsers();
    } else {
      users = await usersServices.getAllUsersMoreId(id: request.lastId);
    }
    for (int i = 0; i < users.length; i++) {
      var userForList = User();
      userForList.userId = users[i]['user_id'] as int;
      userForList.name = users[i]['name'] as String;
      userForList.email = users[i]['email'] as String;
      userForList.profilePicUrl = users[i]['profile_pic_url'] as String;
      userForList.dateCreate = users[i]['created_date'] as String;
      userForList.dateUpdate = users[i]['updated_date'] as String;
      userForList.dateDelete = users[i]['deleted_date'] ?? '';
      usersList.add(userForList);
    }
    return Users(users: usersList);
  }
}

class GrpcSynh extends GrpcSynchronizationServiceBase {
  @override
  Future<DataDBRequest> getUsersSynh(
      ServiceCall call, SynhMainUser request) async {
    var chats = await ChatsServices().getChatsByUserId(userID: request.id);
    var users = await UsersServices().getAllUsersByIDfriend(id: request.id);
    var messages =
        await MessagesServices().getMessageByUserId(idUser: request.id);
    print('USERS: $users');
    print('MESSAGES: $messages');
    List<SynhUser> userList = [];
    List<SynhChat> chatList = [];
    List<SynhMessage> messageList = [];

    for (int i = 0; i < chats.length; i++) {
      var chatForList = SynhChat();
      chatForList.chatId = chats[i]['chat_id'] as int;
      chatForList.userId = chats[i]['friend1_id'] == request.id
          ? chats[i]['friend2_id'] as int
          : chats[i]['friend1_id'] as int;
      chatForList.createdDate = chats[i]['created_date'] as String;
      chatForList.updateDate = chats[i]['updated_date'] as String;
      chatForList.deletedDate = chats[i]['deleted_date'] ?? '';
      chatList.add(chatForList);
    }

    for (int i = 0; i < users.length; i++) {
      var userForList = SynhUser();
      userForList.userId = users[i]['user_id'] as int;
      userForList.name = users[i]['name'] as String;
      userForList.email = users[i]['email'] as String;
      userForList.picture = users[i]['profile_pic_url'] as String;
      userForList.createdDate = users[i]['created_date'] as String;
      userForList.updateDate = users[i]['updated_date'] as String;
      userForList.deletedDate = users[i]['deleted_date'] ?? '';
      userList.add(userForList);
    }

    for (int i = 0; i < messages.length; i++) {
      var messageForList = SynhMessage();
      messageForList.senderId = messages[i]['sender_id'] as int;
      messageForList.chatId = messages[i]['chat_id'] as int;
      messageForList.createdDate = messages[i]['created_date'] as String;
      messageForList.messageId = messages[i]['message_id'] as int;
      messageForList.content = messages[i]['content'] as String;
      messageForList.updatedDate = messages[i]['updated_date'] as String;
      messageForList.deletedDate = messages[i]['deleted_date'] ?? '';
      //Параметра нету в базе
      //messageForList.isRead = messages[i]['is_read'].toInt() ?? 0;
      messageList.add(messageForList);
    }

    var dbRequest = DataDBRequest(
      users: userList,
      chats: chatList,
      messages: messageList,
    );
    return dbRequest;
  }
}

///
///Настройка
///
Future<void> main() async {
  final server = Server(
    [GrpcMessage(), GrpcUsers(), GrpcChats(), GrpcSynh()],

    const <Interceptor>[], //Перехватчик

    //Реестр кодеков, отслеживает чем будем пользоваться
    CodecRegistry(codecs: const [GzipCodec(), IdentityCodec()]),
  );

  await server.serve(port: 6000);
  await DbServerServices.instanse.openDatabase();
  print('✅ Server listening on port ${server.port}...');
}
