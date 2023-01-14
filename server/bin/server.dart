import 'dart:async';
import 'dart:io';

import 'package:grpc/grpc.dart';
import 'package:server/src/db_server/services/message_service.dart';
import 'package:server/src/library/library_server.dart';
import 'package:server/src/synh_helper/synh_helper.dart';

///
///Заполняем все методы как и в Protoc файле
///
class GrpcMessage extends GrpcMessagesServiceBase {
  var messagesService = MessagesDBServices();
  var chatsService = ChatsServices();
  var usersService = UsersServices();

  final _controllers = <StreamController<DynamicResponse>, void>{};

  @override
  Stream<DynamicResponse> streamMessage(
      ServiceCall call, Stream<DynamicRequest> request) async* {
    print('MSG CALL META: ${call.clientMetadata}');
    print('MSG CL HEADER: ${call.headers}');
    print('MSG CL STATUS: ${call.isCanceled}');
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
            attachmentId: req.createMessage.message.attachmentId,
            contentType: req.createMessage.message.contentType);

        req.createMessage.message.messageId = newMessage['message_id'] as int;
        req.createMessage.message.dateCreate =
            newMessage['created_date'] as String;
        req.createMessage.message.dateUpdate =
            newMessage['updated_date'] as String;
        await ChatsServices().updateChat(
            newValues:
                'updated_date = "${req.createMessage.message.dateUpdate}"',
            condition: 'chat_id = ${req.createMessage.message.chatId}');
        print('REQ message UPDATE: ${req.createMessage.message}, ');
        _controllers.forEach((controller, _) async =>
            await MessageService.onCreateMessage(
                controller: controller,
                clientController: clientController,
                req: req));
      }
      if (req.messageState == MessageStateEnum.isUpdateMessage) {
        _controllers.forEach((controller, _) async =>
            await MessageService.onUpdateMessage(
                controller: controller,
                clientController: clientController,
                req: req));
      }
      if (req.messageState == MessageStateEnum.isDeleteMesage) {
        _controllers.forEach((controller, _) async =>
            MessageService.onDeleteMessage(
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

    await for (final req in clientController.stream) {
      print('  -> piped to #${request.hashCode}');
      yield req;
    }
  }

 
}

class GrpcUsers extends GrpcUsersServiceBase {
  @override
  Future<CreateUserResponse> createUser(
      ServiceCall call, CreateUserRequest request) async {
    String date = DateTime.now().toIso8601String();
    List<Map<String, Object?>> users =
        await UsersServices().getUserByEmail(email: request.email);
    if (users.isNotEmpty) {
      throw errors[6];
    }
    var src = await UsersServices().createUser(
        name: request.name,
        email: request.email,
        createdDate: date,
        profilePicUrl: request.profilePicUrl,
        password: request.password,
        updatedDate: date);

    var createUserResponse = CreateUserResponse();
    if (src[0]['user_id'] != 0) {
      createUserResponse.dateCreated = request.dateCreated;
      createUserResponse.email = request.email;
      createUserResponse.name = request.name;
      createUserResponse.profilePicUrl = request.profilePicUrl;
      createUserResponse.id = src[0]['user_id'];
    }
    return createUserResponse;
  }

  @override
  Future<DeleteUserResponse> deleteUser(
      ServiceCall call, DeleteUserRequest request) async {
    var deleteUserResponse = DeleteUserResponse();
    var dateDeleted = DateTime.now().toIso8601String();
    var src = await UsersServices().updateUser(
        newValues:
            "deleted_date = '$dateDeleted', updated_date = '$dateDeleted'",
        condition: "user_id = '${request.id}'");
    if (src != 0) {
      deleteUserResponse.isDeleted = true;
    }
    return deleteUserResponse;
  }

  //TODO: Расписать ошибки и вынести в отдельный класс
  List<GrpcError> errors = [
    GrpcError.custom(15, "Нет пользователя с таким ID"), //0
    GrpcError.custom(16, "Нет пользователя с таким Name"), //1
    GrpcError.custom(17, "Нет пользователя с таким Email"), //2
    GrpcError.custom(18, "Пользователь удален"), //3
    GrpcError.custom(19, "Неверный старый пароль"), //4
    GrpcError.custom(20, "Произошла неизвестная ошибка"), //5
    GrpcError.custom(21, "Пользователь с таким email уже зарегистрирован"), //6
  ];

  @override
  Future<GetUserResponse> getUser(
      ServiceCall call, GetUserRequest request) async {
    print('ACTIVATE GET USER SERVER');
    var src;
    if (!request.id.isNaN) {
      print('REQUEST :');
      src = await UsersServices()
          .getUserByField(field: 'user_id', fieldValue: '${request.id}');
      print('OK: $src');
      if (src.toString().contains('user_id')) {
        print(src[0]['deleted_date']);
        if (src[0]['deleted_date'] != "" && src[0]['deleted_date'] != null) {
          throw errors[3];
        }
        print('src contains user_id');
        return GetUserResponse(id: request.id);
      } else {
        throw errors[0];
      }
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
      throw GrpcError.invalidArgument();
    }
    return GetUserResponse();
  }

  @override
  Future<UpdateUserResponse> updateUser(
      ServiceCall call, UpdateUserRequest request) async {
    var updateUserResponse = UpdateUserResponse();
    updateUserResponse.dateUpdated = DateTime.now().toIso8601String();
    Map<String, Object?> user =
        await UsersServices().getUserById(userId: request.id);
    if (request.email != user['email']) {
      List<Map<String, Object?>> users =
          await UsersServices().getUserByEmail(email: request.email);
      if (users.isNotEmpty) {
        throw errors[6];
      }
    }
    var src = await UsersServices().updateUser(
        newValues: '''name = '${request.name}', 
            email = '${request.email}', 
            profile_pic_url = "${request.profilePicUrl}",  
            updated_date = "${updateUserResponse.dateUpdated}"''',
        condition: "user_id = ${request.id}");
    if (src != 0) {
      var user = await UsersServices().getUserById(userId: request.id);
      if (user.isNotEmpty) {
        updateUserResponse = UpdateUserResponse(
            userId: user['user_id'] as int,
            name: user['name'] as String,
            email: user['email'] as String,
            profilePicUrl: user['profile_pic_url'] as String,
            dateUpdated: user['updated_date'] as String);
      }
    }
    return updateUserResponse;
  }

  @override
  Future<PasswordResponse> changePassword(
      ServiceCall call, PasswordChangeRequest request) async {
    Map<String, Object?> user =
        await UsersServices().getUserById(userId: request.userId);
    if (user.isEmpty) {
      throw errors[5];
    }
    if (request.oldPassword.compareTo(user['password'] as String) != 0) {
      throw errors[4];
    }
    try {
      await usersServices.updateUser(
          newValues: "password = '${request.newPassword}'",
          condition: "user_id = ${request.userId}");
    } catch (e) {
      throw errors[5];
    }
    return PasswordResponse(ok: true);
  }

  @override
  Future<PasswordResponse> confirmPassword(
      ServiceCall call, PasswordConfirmRequest request) async {
    Map<String, Object?> user =
        await UsersServices().getUserById(userId: request.userId);
    if (user.isEmpty) {
      throw errors[5];
    }
    if (request.password.compareTo(user['password'] as String) != 0) {
      throw errors[4];
    }
    return (PasswordResponse(ok: true));
  }
}

class GrpcSynh extends GrpcSynchronizationServiceBase {
  @override
  Future<DataDBResponse> getUsersSynh(
      ServiceCall call, MainUserRequest request) async {
    var newChats;
    var newUsers;
    var newMessages;
    var updatedUsers;
    var updatedChats;
    var updatedMessages;

    print(
        '/////////////////ЗАШЛИ НА ЮЗЕРА ${request.users.mainUser}//////////////////');

    ///
    ///Юзеры и чаты
    ///
    if (request.chats.maxChatId == 0) {
      newChats = await ChatsServices()
          .getChatsByUserId(userId: request.users.mainUser);
      newUsers = await UsersServices()
          .getAllUsersByIDfriend(userId: request.users.mainUser);
      updatedUsers = [];
      updatedChats = [];
    } else {
      newChats = await ChatsServices().getChatsByUserIdMoreChatId(
          userId: request.users.mainUser, chatId: request.chats.maxChatId);
      updatedChats = await ChatsServices()
          .getUpdatedChats(chats: request.chats.chatsForUpdate);
      updatedUsers = await UsersServices()
          .getUpdatedUsers(users: request.users.usersForUpdate);
      newUsers = await UsersServices().getAllUsersByIDfriendMoreChatId(
          id: request.users.mainUser, chatId: request.chats.maxChatId);
    }

    ///
    ///Сообщения
    ///
    if (request.messages.maxMessageId == 0) {
      newMessages = await MessagesDBServices()
          .getMessageByUserId(userId: request.users.mainUser);
      updatedMessages = [];
    } else {
      newMessages = await MessagesDBServices().getMessageByUserIdMoreMessageId(
          userId: request.users.mainUser,
          messageId: request.messages.maxMessageId);
      updatedMessages = await MessagesDBServices()
          .getUpdatedMessages(messages: request.messages.messageForUpdate);
    }

    print('USERSNEW: $newUsers');
    print('CHATSNEW: $newChats');
    print('MESSAGESNEW: $newMessages');
    print('UPDATEDUSERS: $updatedUsers');
    print('UPDATE CHATS: $updatedChats');
    print('UPDATE MESSAGES: $updatedMessages');

    //Заполняем ответ
    var dbRequest = DataDBResponse(
      users: UsersResponse(
          usersNew: SynhHelper.synhUsersResponse(users: newUsers),
          usersUpdated: SynhHelper.synhUsersResponse(users: updatedUsers)),
      chats: ChatsResponse(
          chatsNew: SynhHelper.synhChatsResponse(
              chats: newChats, mainUserId: request.users.mainUser),
          chatsUpdated: SynhHelper.synhChatsResponse(
              chats: updatedChats, mainUserId: request.users.mainUser)),
      messages: MessagesResponse(
          messagesNew: SynhHelper.synhMessagesResponse(messages: newMessages),
          messagesUpdated:
              SynhHelper.synhMessagesResponse(messages: updatedMessages)),
    );
    return dbRequest;
  }

  @override
  Future<UsersResponse> sync(ServiceCall call, UsersRequest request) async {
    var usersUpdated;
    var lastId = 0;
    if (request.usersForUpdate.isNotEmpty) {
      usersUpdated =
          await usersServices.getUpdatedUsers(users: request.usersForUpdate);
      lastId = request.usersForUpdate.last.userId;
    }
    var newUsers = await usersServices.getAllUsersMoreId(id: lastId);

    var newUserResponse = SynhHelper.synhUsersResponse(users: newUsers);
    var updatedUserResponse = SynhHelper.synhUsersResponse(users: usersUpdated);
    print('NEW USERS RESP START: $newUserResponse');
    print('UPDATED USERS RESP START: $updatedUserResponse');

    return UsersResponse(
        usersNew: newUserResponse, usersUpdated: updatedUserResponse);
  }
}

///
///Настройка
///
Future<void> main() async {
  final server = Server(
    [GrpcMessage(), GrpcUsers(), GrpcSynh()],
    // const <Interceptor>[],
    [
      Inter().intes(
          CallService(),
          MethodService(
            'check',
            () {},
            true,
            true,
            (request) {
              print('SERVER REQUEST: $request');
              return null;
            },
            (response) {
              print('SERVER RESPONSE: $response');
              return [];
            },
          )),
    ], //Перехватчик

    //Реестр кодеков, отслеживает чем будем пользоваться
    CodecRegistry(codecs: const [GzipCodec(), IdentityCodec()]),
  );
  await server.serve(port: 6000);
  await DbServerServices.instanse.openDatabase();
  print('✅ Server listening on port ${server.port}...');
}

class MethodService extends ServiceMethod {
  MethodService(
      super.name,
      super.handler,
      super.streamingRequest,
      super.streamingResponse,
      super.requestDeserializer,
      super.responseSerializer);
}

class CallService extends ServiceCall {
  @override
  // TODO: implement clientCertificate
  X509Certificate? get clientCertificate => throw UnimplementedError();

  @override
  // TODO: implement clientMetadata
  Map<String, String>? get clientMetadata => {'CL': 'metadata'};

  @override
  // TODO: implement deadline
  DateTime? get deadline => throw UnimplementedError();

  @override
  // TODO: implement headers
  Map<String, String>? get headers => throw UnimplementedError();

  @override
  // TODO: implement isCanceled
  bool get isCanceled => throw UnimplementedError();

  @override
  // TODO: implement isTimedOut
  bool get isTimedOut => throw UnimplementedError();

  @override
  void sendHeaders() {
    // TODO: implement sendHeaders
  }

  @override
  void sendTrailers({int? status, String? message}) {
    // TODO: implement sendTrailers
  }

  @override
  // TODO: implement trailers
  Map<String, String>? get trailers => throw UnimplementedError();
}

class Inter {
  FutureOr<GrpcError?> Function(ServiceCall, ServiceMethod<dynamic, dynamic>)
      intes(ServiceCall call, ServiceMethod method) {
    // final Stopwatch stopwatch = Stopwatch()..start();
    print('CL MEDATA: ${call.clientMetadata}');
    print('Handler: ${method.handler}');
    var measure = measureInterceptor(call, method, (call, method) async {
      print(
          'MEASURE META: ${call.clientMetadata} \n: METHOD ${method.handler}');
      return null;
    });
    // stopwatch.stop();
    // print("method ${method.name} took ${stopwatch.elapsedMilliseconds} ms");
    return measure;
  }
}

FutureOr<GrpcError?> Function(ServiceCall, ServiceMethod<dynamic, dynamic>)
    measureInterceptor(
        ServiceCall call,
        ServiceMethod method,
        FutureOr<GrpcError?> Function(ServiceCall call, ServiceMethod method)
            next) {
  final Stopwatch stopwatch = Stopwatch()..start();
  next(call, method);

  stopwatch.stop();
  print("method: ${method.name}, took ${stopwatch.elapsedMilliseconds} ms");
  //(ServiceCall, ServiceMethod<dynamic, dynamic>) => Future<GrpcError?>
  return next;
}

class ClInter extends ClientInterceptor {
  @override
  ResponseFuture<R> interceptUnary<Q, R>(
      ClientMethod<Q, R> method, Q request, CallOptions options, invoker) {
    var newOptions = options.mergedWith(CallOptions(metadata: <String, String>{
      'token': 'Some-Token',
    }));

    return invoker(method, request, newOptions);
  }
}
