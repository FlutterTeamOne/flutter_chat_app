import 'dart:async';

import 'package:grpc/grpc.dart';
import '../lib/src/generated/users.pbgrpc.dart';
import '../lib/src/generated/grpc_manager.pbgrpc.dart';
import '../lib/src/library/library_server.dart';

///
///Заполняем все методы как и в Protoc файле
///
class GrpcChat extends GrpcChatServiceBase {
  var messagesService = MessagesServices();
  var chatsService = ChatsServices();
  var usersService = UsersServices();
  var _controller = <int, StreamController<MessageFromBase>>{};

  //   @override
  // Future<ConnectResponse> connecting(
  //     ServiceCall call, ConnectRequest request) async {
  //   //save to db
  //   print('Connect: id: ${request.id}  hashcode: ${request.hashCode}');

  //   return ConnectResponse(id: request.id, hashConnect: request.hashCode);
  // }

  @override
  Future<CreateMessageResponse> createMessage(
      ServiceCall call, CreateMessageRequest request) async {
    var src = await messagesService.addNewMessage(
      chatId: request.chatIdMain,
      senderId: request.senderMainId,
      content: request.content,
    );
    print('SRC: $src');
    var message = CreateMessageResponse();

    if (src['message_id'] != 0) {
      message.dateCreate = src['created_date'] as String;
      message.mainMessagesId = src['message_id'] as int;
    } else {
      message.mainMessagesId = 555; // message.ok = false;
    }
    print('SERVER MESSAGE: $message');
    var mes =
        await messagesService.getMessageById(id: src['message_id'] as int);
    print('MES: $mes');
    var messageFromBase = MessageFromBase(
        chatIdMain: mes[0]['chat_id'],
        senderMainId: mes[0]['sender_id'],
        content: mes[0]['content'],
        date: mes[0]['created_date'],
        mainIdMessage: mes[0]['message_id']);
    print('MESfrom: $messageFromBase');
    var receiverId = await usersService.getUserIdByChat(
        senderId: request.senderMainId, chatId: request.chatIdMain);
    print('receiverId: $receiverId');
    var hashConnect = await usersService.getHashCodeById(id: receiverId);
    print("HASH: $hashConnect");
    hashConnect != null
        ? _controller[hashConnect]?.sink.add(messageFromBase)
        : print("user $receiverId not connecting");
    return message;
  }

  @override
  Stream<MessageFromBase> synchronization(
      ServiceCall call, LastMessage request) async* {
    if (request.mainIdMessage == 0) {
      MessageFromBase lastMessage = MessageFromBase();
      yield lastMessage;
    } else {
      var messages = await messagesService.getRecentMessages(message: request);
      MessageFromBase lastMessage = MessageFromBase();
      if (messages.length == 0) {
        MessageFromBase lastMessage = MessageFromBase();
        yield lastMessage;
      } else {
        for (int i = 0; i < messages.length; i++) {
          MessageFromBase lastMessage = MessageFromBase();
          lastMessage.mainIdMessage = messages[i]['main_messages_id'];
          lastMessage.chatIdMain = messages[i]['friends_chat_id'];
          lastMessage.senderMainId = messages[i]['sender_id'];
          lastMessage.content = messages[i]['content'];
          lastMessage.date = messages[i]['date'];
          yield lastMessage;
        }
      }
    }
  }

  @override
  Future<UpdateMessageResponse> updateMessage(
      ServiceCall call, UpdateMessageRequest request) async {
    var timeUpdate = DateTime.now().toIso8601String();
    var src = await messagesServices.updateMessage(
        newValues:
            "content = '${request.content}', updated_date = '$timeUpdate'",
        condition: "message_id = ${request.idMessageMain}");
    print('UPD SRC:$src');
    var message = UpdateMessageResponse();
    if (src != 0) {
      message.idMessageMain = request.idMessageMain;
      message.dateUpdate = timeUpdate;
    }
    print('UPD MSG: $message');
    return message;
  }

  @override
  Future<DeleteMessageResponse> deleteMessage(
      ServiceCall call, DeleteMessageRequest request) async {
    var timeDelete = DateTime.now().toIso8601String();
    var src = await messagesService.updateMessage(
        newValues: "deleted_date = '$timeDelete', updated_date = '$timeDelete'",
        condition: "message_id = ${request.idMessageMain}");
    var message = DeleteMessageResponse();
    if (src != 0) {
      message.dateDelete = timeDelete;
      message.idMessageMain = request.idMessageMain;
    }
    return message;
  }

  @override
  Stream<MessageFromBase> connectings(
      ServiceCall call, Stream<ConnectRequest> request) async* {
    var connectController = StreamController<MessageFromBase>();
    _controller[request.hashCode] = connectController;
    late int id;
    request.listen((mes) {
      print('listening...${request.hashCode}');
      // print('Request ${req.id} (#${request.hashCode})');
      id = mes.id;
      // var userId = req.id;
      usersService.updateUser(
          newValues: 'hash_connect = ${request.hashCode}',
          condition: 'user_id = ${mes.id}');

      // _controller.forEach((nowController, _) {
      //   if (nowController != connectController) {
      //     nowController.sink.add(req);
      //   }

      // });
    }).onError((dynamic e) {
      print(e);
      _controller.remove(request.hashCode);
      connectController.close();
      usersService.updateUser(
          newValues: 'hash_connect = null', condition: 'user_id = $id');
      print('Disconnected: #${request.hashCode}');
    });

    await for (final message in connectController.stream) {
      print('yield');
      yield message;
    }
  }

  @override
  Future<Empty> connecting(ServiceCall call, Empty request) {
    // TODO: implement connecting
    throw UnimplementedError();
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
    // if (src[]) {}
    // request.dateCreation;
    // request.email;
    // request.id;
    // request.name;
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
}

///
///Настройка
///
Future<void> main() async {
  final server = Server(
    [GrpcChat(), GrpcUsers()], //

    const <Interceptor>[], //Перехватчик

    //Реестр кодеков, отслеживает чем будем пользоваться
    CodecRegistry(codecs: const [GzipCodec(), IdentityCodec()]),
  );

  await server.serve(port: 50000);
  await DbServerServices.instanse.openDatabase();
  print('✅ Server listening on port ${server.port}...');
}
