import 'dart:async';
import 'package:chat_app/modules/signal_service/bloc/grpc_connection_bloc/grpc_connection_bloc.dart';
import 'package:chat_app/src/generated/grpc_lib/grpc_message_lib.dart';
import 'package:equatable/equatable.dart';
import 'package:grpc/service_api.dart';

import '../../../../src/libraries/library_all.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stream_transform/stream_transform.dart';
import '../../service_locator/locator.dart';
part 'message_event.dart';
part 'message_state.dart';

class MessageBloc extends Bloc<MessageEvent, MessageState> {
  late LocalMessagesServices _messagesServices;
  late LocalUsersServices _userServices;
  late MainUserServices _mainUserServices;
  late StreamSubscription _subscription;
  StreamController<Dynamic> messageController = StreamController.broadcast();
  // StreamController<MessageFromBase> connect = StreamController.broadcast();
  StreamController<ReadMessageRequest> reqStream = StreamController.broadcast();
  final GrpcClient grpcClient;
  final GrpcConnectionBloc grpcConnection;
  var stub = GrpcMessagesClient(Locator.getIt<GrpcClient>().channel);
  MessageBloc({required this.grpcClient, required this.grpcConnection})
      : super(const MessageState()) {
    _messagesServices = LocalMessagesServices();
    // _subscription = _messageService.onMessagesStream().listen((value) {
    //   add(ReadMessageEvent(messages: value.messages));
    //   print('MESSAGE: ${value.messages}');
    // });
    _userServices = LocalUsersServices();
    _mainUserServices = MainUserServices();

    _subscription = GrpcMessagesClient(grpcClient.channel)
        .streamMessage(messageController.stream)
        .listen((value) {
      var messages = <MessageDto>[];
      var msg = value.readMessage.message;
      _messagesServices.addNewMessageFromBase(message: msg);
      messages.add(MessageDto(
          localChatId: msg.chatId,
          localSendId: msg.senderId,
          messageId: msg.messageId,
          content: msg.content,
          createdDate: msg.dateCreate,
          updatedDate: msg.dateUpdate));

      add(ReadMessageEvent(messages: messages));
    });
    DBHelper.instanse.updateListenController.stream.listen((event) async {
      if (event == true) {
        var messages = await _messagesServices.getAllMessages();
        // messages.sort((a, b) => a.localMessageId!.compareTo(b.localMessageId!));
        print('sort message:$messages');
        add(ReadMessageEvent(messages: messages));
        // state.copyWith(messages: messages);
      }
    });
    // on<MessageStreamEvent>(_onMessageStreamEvent,
    //     transformer: (events, mapper) => events
    //         .debounce(const Duration(milliseconds: 100))
    //         .asyncExpand(mapper));
    on<ReadMessageEvent>(_onReadMessageEvent);
    on<CreateMessageEvent>(_onCreateMessageEvent);
    on<UpdateMessageEvent>(_onUpdateMessageEvent);
    // on<DeleteMessageEvent>(_onDeleteMessageEvent);
    // on<DeleteHistoryMessageEvent>(_onDeleteHistoryMessageEvent);
  }
  // FutureOr<void> _onMessageStreamEvent(
  //     MessageStreamEvent event, Emitter<MessageState> emit) async {
  //   // var lastMSG = LastMessage(
  //   //     mainIdMessage: 0, mainIdUser: await _mainUserServices.getUserID());
  //   var lst = await _messagesServices.getAllMessagesNotNull();
  //   ///
  //   ///
  //   ///
  //   // if (lst.isNotEmpty) {
  //   //   lastMSG.mainIdMessage = lst.last.messageId!;
  //   // }
  //   var stub = GrpcMessagesClient(grpcClient.channel);
  //   // var syncList = stub.synchronization(lastMSG);
  //   // Stream<ConnectRequest> enter(int id) async* {
  //   //   yield ConnectRequest(id: id);
  //   // }
  //   // stub.connectings(enter(1));
  //   // stub.asBroadcastStream(
  //   //   onListen: (subscription) {
  //   //     print('sub: $subscription');
  //   //   },
  //   // );
  //   // await emit.forEach(stub, onData: (data) {
  //   //   print('EMIT DATA:$data');
  //   //   return MessageState(messages: [
  //   //     MessageDto(
  //   //         localChatId: data.chatIdMain,
  //   //         localSendId: data.senderMainId,
  //   //         content: data.content,
  //   //         createdDate: data.date,
  //   //         updatedDate: data.date)
  //   //   ]);
  //   // });
  //   // var list = <MessageFromBase>[];
  //   // await for (var mes in syncList) {
  //   //   print('MES CHAT ID ${mes.chatIdMain}');
  //   //   print('MES CONTENT: ${mes.content}');
  //   //   print('MES MAIN ID MSG: ${mes.mainIdMessage}');
  //   //   print('MES SENDER ID: ${mes.senderMainId}');
  //   //   print('MES DATE CREATE: ${mes.date}');
  //   //   list.add(mes);
  //   //   connect.add(mes);
  //   // }
  //   // if (list[0].chatIdMain != 0) {
  //   //   await _messagesServices.addNewMessageFromBase(messages: list);
  //   // }
  //   // streamMessageFromBase.sink.add(list);
  //   add(ReadMessageEvent());
  // }

  FutureOr<void> _onReadMessageEvent(
      ReadMessageEvent event, Emitter<MessageState> emit) async {
    // var stub = GrpcMessagesClient(grpcClient.channel);
    // var dyn = Stream<Dynamic>.value(
    //   Dynamic(
    //     messageState: MessageStateEnum.connecting,
    //     createMessage: CreateMessageRequest(message: Message(senderId:1))
    //   ),
    // );
    // var resp = stub.streamMessage(dyn);
    // resp.listen((mes) async {
    //   print(mes.readMessageRequest.message);
    //   var e = mes.readMessageRequest.message;
    //   event.messages?.add(MessageDto(
    //       content: e.content,
    //       localChatId: e.chatId,
    //       localMessageId: e.messageId,
    //       localSendId: e.senderId,
    //       createdDate: e.dateCreate,
    //       updatedDate: e.dateUpdate));
    //   emit(state.copyWith(messages: event.messages));
    //   messageController.add(mes);
    // });

    if (event.messages == null || event.messages?.length == 1) {
      var messages = await _messagesServices.getAllMessages();
      print("MESSAGES:$messages");

      emit(state.copyWith(messages: messages));
    } else {
      print('EVENT MSG: ${event.messages}');
      emit(state.copyWith(messages: event.messages));
    }
  }

  FutureOr<void> _onCreateMessageEvent(
      CreateMessageEvent event, Emitter<MessageState> emit) async {
    var message = event.message;
    // var model = message.writeToJsonMap();
    var chats = LocalChatServices();
    print('MESSAGE: $message');
    // DBHelper.instanse
    //     .onAdd(tableName: 'messages', model: messageMapToDB(model));
    message.localMessageId = await _messagesServices.addNewMessage(
      chatId: message.localChatId,
      senderId: 1,
      content: message.content,
      date: message.createdDate,
    );
    var stub = GrpcMessagesClient(grpcClient.channel);
    var request = ReadMessageRequest(
        message: Message(
            messageId: message.messageId,
            chatId: message.localChatId,
            content: message.content,
            senderId: message.localSendId));
    reqStream.add(request);
    messageController.add(Dynamic(
        readMessage: request,
        messageState: MessageStateEnum.isCreateMessage));
    // var messageToServer = CreateMessageRequest(
    //     chatIdMain:
    //         await chats.getMainIdChatByMessage(localId: message.localChatId),
    //     content: message.content,
    //     senderMainId:
    //         await localUsersServices.getMainIdUserByLocalId(localId: 1));

    // messageToServer.chatIdMain =
    //     await chats.getMainIdChatByMessage(localId: message.localChatId);
    // messageToServer.content = message.content;
    // messageToServer.senderMainId = await localUsersServices
    //     .getMainIdUserByLocalId(localId: 1); ////поменять запрос на mainUserTabl
    // print('message to server \n $messageToServer');

    // var messageResponse = await GrpcMessagesClient(grpcClient.channel)
    //     .createMessage(messageToServer);
    // messageResponse.mainMessagesId;
    // print("messageOK:/n $messageResponse");
    // grpcConnection.add(const GrpcConnectionStarted());
    // await for (var grpcState in grpcConnection.stream) {
    // print('get grpc State');
    // // print('grpc message state2:${grpcState.connectState}');
    // // if (grpcState.connectState == GrpcConnectState.ready) {
    // // print('grpc message state3:${grpcState.connectState}');
    // try {
    //   print("messageOK:/n $messageResponse");
    //   if (messageResponse.mainMessagesId != 0) {
    //     await _messagesServices.updateWrittenToServer(
    //         localMessageId: message.localMessageId!,
    //         messagesId: messageResponse.mainMessagesId,
    //         updatedDate: messageResponse.dateCreate);

    //     emit(
    //         state.copyWith(messages: await _messagesServices.getAllMessages()));
    //   }
    // } catch (e) {
    //   print(e);
    // }
    // Stream<ConnectRequest> enter(int id) async* {
    //   yield ConnectRequest(id: id);
    // }

    // stub.connectings(enter(1));
    // // }
    // // }
    // // );
  }

  ///Обновление сообщения
  ///
  FutureOr<void> _onUpdateMessageEvent(
      UpdateMessageEvent event, Emitter<MessageState> emit) async {
    if (event.isEditing == EditState.isPreparation) {
      emit(state.copyWith(
          editState: EditState.isPreparation, messageId: event.messageId));
    }
    if (event.isEditing == EditState.isEditing) {
      //Обновляем сообщение в локальном хранилище
      await _messagesServices.updateMessage(
          message: event.message!, localMessageId: state.messageId!);
      emit(state.copyWith(editState: EditState.isNotEditing));
    }
      // try {
      //отправляем обновленное сообщение на сервер
//         var messageUpdateRequest = UpdateMessageRequest(
//             idMessageMain: state.messageId, content: event.message!.content);
//         //получаем от сервера ответ
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
//       } catch (e) {}
//     }
    if (event.isEditing == EditState.isNotEditing) {
      emit(state.copyWith(editState: EditState.isNotEditing));
    }
    }

    ///Удаление сообщения по ид
    FutureOr<void> _onDeleteMessageEvent(
        DeleteMessageEvent event, Emitter<MessageState> emit) async {
      await _messagesServices.deleteMessage(id: event.messageId);
      add(ReadMessageEvent());
      print('message ID: ${event.messageId}');
      // emit(state.copyWith(
      //     deleteState: DeleteState.isDeleted, editState: EditState.isNotEditing));
      // var messageDelete = DeleteMessageRequest(idMessageMain: event.messageId);
      // try {
      //   var response = await stub.deleteMessage(messageDelete);
      //   await _messagesServices.deleteWrittenToServer(
      //       localMessageId: response.idMessageMain,
      //       deletedDate: response.dateDelete);
      //   print('DEL DATE: ${response.dateDelete}');
      //   print('DEL ID: ${response.idMessageMain}');

      //   // await _messagesServices.updateWrittenToServer(localMessageId: localMessageId, updatedDate: updatedDate)
      // } catch (e) {}
    }

    ///Очистка истории в определенном чате
    FutureOr<void> _onDeleteHistoryMessageEvent(
        DeleteHistoryMessageEvent event, Emitter<MessageState> emit) async {
      await _messagesServices.deleteAllMessagesInChat(chatID: event.chatID);
      print('CHAT ID: ${event.chatID}');
      add(ReadMessageEvent());
    }

    @override
    Future<void> close() {
      _subscription.cancel();
      return super.close();
    }
  }

