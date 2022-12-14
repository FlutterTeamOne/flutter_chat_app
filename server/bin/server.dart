import 'package:grpc/grpc.dart';
import 'package:server/src/generated/users.pbgrpc.dart';

import '../lib/src/generated/grpc_manager.pbgrpc.dart';
import '../lib/src/library/library_server.dart';

///
///Заполняем все методы как и в Protoc файле
///
class GrpcChat extends GrpcChatServiceBase {
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

class GrpcUsers extends GrpcUsersServiceBase {
  @override
  Future<CreateUserResponse> createUser(
      ServiceCall call, CreateUserRequest request) async {
    await UsersServices().createUser(
        name: request.name,
        email: request.email,
        registrationDate: request.dateCreated,
        profilePicUrl: request.profilePicUrl);
    var createUserResponse = CreateUserResponse();
    return createUserResponse;
  }

  @override
  Future<DeleteUserResponse> deleteUser(
      ServiceCall call, DeleteUserRequest request) async {
    var deleteUserResponse = DeleteUserResponse();
    return deleteUserResponse;
  }

  @override
  Future<GetUserResponse> getUser(
      ServiceCall call, GetUserRequest request) async {
    var getUserResponse = GetUserResponse();
    return getUserResponse;
  }

  @override
  Future<UpdateUserResponse> updateUser(
      ServiceCall call, UpdateUserRequest request) async {
       print('WRITE TO MAP: ${request.writeToJsonMap()}');
    // await UsersServices().updateUser(newValues: '', condition: condition);
    var updatUserResponse = UpdateUserResponse();
    return updatUserResponse;
  }
}

///
///Настройка
///
Future<void> main() async {
  final server = Server(
    [GrpcChat()], //

    const <Interceptor>[], //Перехватчик

    //Реестр кодеков, отслеживает чем будем пользоваться
    CodecRegistry(codecs: const [GzipCodec(), IdentityCodec()]),
  );

  await server.serve(port: 5000);
  await dbServerServices.openDatabase();
  print('✅ Server listening on port ${server.port}...');
}
