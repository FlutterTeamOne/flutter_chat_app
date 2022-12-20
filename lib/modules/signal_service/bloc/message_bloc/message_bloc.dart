import 'dart:async';
import 'dart:convert';
import 'package:chat_app/modules/signal_service/bloc/grpc_connection_bloc/grpc_connection_bloc.dart';
import 'package:chat_app/src/generated/grpc_lib/grpc_message_lib.dart';
import 'package:equatable/equatable.dart';

import '../../../../src/libraries/library_all.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../service_locator/locator.dart';
part 'message_event.dart';
part 'message_state.dart';

class MessageBloc extends Bloc<MessageEvent, MessageState> {
  late LocalMessagesServices _messagesServices;
  late LocalUsersServices _userServices;
  late MainUserServices _mainUserServices;
  late StreamSubscription _subscription;
  StreamController<DynamicRequest> messageController =
      StreamController.broadcast();
  // StreamController<MessageFromBase> connect = StreamController.broadcast();
  // StreamController<ReadMessageRequest> reqStream = StreamController.broadcast();
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

    ///
    ///СЛУШАЕМ ОТВЕТ ОТ СЕРВЕРА
    ///
    _subscription = GrpcMessagesClient(grpcClient.channel)
        .streamMessage(messageController.stream)
        .listen((value) async {
      if (value.messageState == MessageStateEnum.isReadMessage) {
        var messages = <MessageDto>[];
        var msg = value.readMessage.message;
        await _messagesServices.addNewMessageFromBase(message: msg);
        messages.add(MessageDto(
            chatId: msg.chatId,
            senderId: msg.senderId,
            messageId: msg.messageId,
            content: msg.content,
            createdDate: msg.dateCreate,
            updatedDate: msg.dateUpdate));

        add(ReadMessageEvent(messages: messages));
      } else if (value.messageState == MessageStateEnum.isUpdateMessage) {
        var updMsg = value.updateMessage;

        await _messagesServices.updateMessageFromBase(
            content: updMsg.content,
            messageId: updMsg.idMessageMain,
            updateDate: updMsg.dateUpdate);

        print('id Message Main: ${updMsg.idMessageMain}');
        print('date update: ${updMsg.idMessageMain}');

        var messages = await _messagesServices.getAllMessages();
        print('sort message:$messages');

        add(ReadMessageEvent(messages: messages));

      } else if (value.messageState == MessageStateEnum.isDeleteMesage) {
        var del = value.deleteMessage;
        
        await _messagesServices.deleteMessageFromBase(id: del.idMessageMain,dateDelete:del.dateDelete);
         var messages = await _messagesServices.getAllMessages();

        print('sort message:$messages');

        add(ReadMessageEvent(messages: messages));
      } else if (value.messageState == MessageStateEnum.isCreateMessage) {
        var msg = value.createMessage.message;
        var newMsg = MessageDto(
            localMessageId: msg.localMessgaeId,
            messageId: msg.messageId,
            chatId: msg.chatId,
            senderId: msg.senderId,
            content: msg.content,
            createdDate: msg.dateCreate,
            updatedDate: msg.dateUpdate);
        await _messagesServices.updateMessage(
            message: newMsg, localMessageId: msg.localMessgaeId);
      }
    });
    DBHelper.instanse.updateListenController.stream.listen((event) async {
      if (event == true) {
        var messages = await _messagesServices.getAllMessages();
        print('sort message:$messages');
        add(ReadMessageEvent(messages: messages));
        // state.copyWith(messages: messages);
      }
    });

    on<ReadMessageEvent>(_onReadMessageEvent);
    on<CreateMessageEvent>(_onCreateMessageEvent);
    on<UpdateMessageEvent>(_onUpdateMessageEvent);
    on<DeleteMessageEvent>(_onDeleteMessageEvent);
    // on<DeleteHistoryMessageEvent>(_onDeleteHistoryMessageEvent);
  }

  FutureOr<void> _onReadMessageEvent(
      ReadMessageEvent event, Emitter<MessageState> emit) async {
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
    if (message.localMessageId==null) {
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
      //reqStream.add(request);
      messageController.add(DynamicRequest(
          createMessage: request,
          messageState: MessageStateEnum.isCreateMessage));
    }
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

  ///
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

      try {
        // отправляем обновленное сообщение на сервер
        var messageUpdateRequest = UpdateMessageRequest(
            idMessageMain: event.message?.messageId,
            content: event.message!.content);
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
    emit(state.copyWith(
        deleteState: DeleteState.isDeleted, editState: EditState.isNotEditing));
    var messageDelete = DynamicRequest(
        deleteMessage: DeleteMessageRequest(idMessageMain: event.messageId),
        messageState: MessageStateEnum.isDeleteMesage);
    try {
      messageController.add(messageDelete);
      // print('DEL DATE: ${response.dateDelete}');
      // print('DEL ID: ${response.idMessageMain}');

      // await _messagesServices.updateWrittenToServer(localMessageId: localMessageId, updatedDate: updatedDate)
    } catch (e) {}
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
