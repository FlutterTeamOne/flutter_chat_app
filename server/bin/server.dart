import 'package:grpc/grpc.dart';

import '../lib/src/library/library_server.dart';

///
///Заполняем все методы как и в Protoc файле
///
class GrpcMessage extends GrpcMessagesServiceBase {
  var messagesService = MessagesServices();
  var chatsService = ChatsServices();
  var usersService = UsersServices();

  @override
  Future<Empty> connecting(ServiceCall call, Empty request) async {
    return request;
  }

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

    var src = await UsersServices().getUser(id: request.id);

    if (src[0]['user_id'] != 0 && src[0]['user_id'] != null) {
      getUserResponse.id = src[0]['user_id'] as int;
      getUserResponse.dateUpdated = src[0]['updated_date'] as String;
      getUserResponse.dateDeleted = src[0]['deleted_date'] as String;
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
}

///
///Настройка
///
Future<void> main() async {
  final server = Server(
    [GrpcMessage(), GrpcUsers(), GrpcChats()], //

    const <Interceptor>[], //Перехватчик

    //Реестр кодеков, отслеживает чем будем пользоваться
    CodecRegistry(codecs: const [GzipCodec(), IdentityCodec()]),
  );

  await server.serve(port: 5000);
  await DbServerServices.instanse.openDatabase();

  print('✅ Server listening on port ${server.port}...');
}
