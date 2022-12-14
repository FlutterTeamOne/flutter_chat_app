// import 'dart:async';
// import 'dart:convert';
// import 'package:chat_app/modules/client/rest_client.dart';
// import 'package:chat_app/modules/signal_service/bloc/grpc_connection_bloc/grpc_connection_bloc.dart';
// import 'package:chat_app/src/generated/grpc_lib/grpc_message_lib.dart';
// import 'package:equatable/equatable.dart';
// import 'package:grpc/grpc.dart';

// import '../../../../src/libraries/library_all.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../service_locator/locator.dart';
// part 'message_event.dart';
// part 'message_state.dart';

// class MessageBloc extends Bloc<MessageEvent, MessageState> {
//   late LocalMessagesServices _messagesServices;
//   late LocalUsersServices _userServices;
//   late MainUserServices _mainUserServices;
//   late StreamSubscription _subscription;

//   StreamController<DynamicRequest> messageController =
//       StreamController.broadcast();
//   // StreamController<MessageFromBase> connect = StreamController.broadcast();
//   // StreamController<ReadMessageRequest> reqStream = StreamController.broadcast();
//   final GrpcClient grpcClient;
//   final GrpcConnectionBloc grpcConnection;
//   var stub = GrpcMessagesClient(GrpcClient().channel);
//   MessageBloc({required this.grpcClient, required this.grpcConnection})
//       : super(const MessageState()) {
//     _messagesServices = LocalMessagesServices();
//     // _subscription = _messageService.onMessagesStream().listen((value) {
//     //   add(ReadMessageEvent(messages: value.messages));
//     //   print('MESSAGE: ${value.messages}');
//     // });
//     _userServices = LocalUsersServices();
//     _mainUserServices = MainUserServices();

//     ///
//     ///СЛУШАЕМ ОТВЕТ ОТ СЕРВЕРА
//     ///
//     _subscription = GrpcMessagesClient(grpcClient.channel,
//             options: CallOptions(metadata: {'token': 'some token'}),
//             interceptors: [ClInter()])
//         .streamMessage(messageController.stream)
//         .listen((value) async {
//       print("MESSAGE!!!!!!!!!!!!!!!");
//       print(value.messageState);
//       if (value.messageState == MessageStateEnum.isReadMessage) {
//         print("READMESSAGE: ${value}");
//         var messages = <MessageDto>[];
//         var msg = value.readMessage.message;
//         await _messagesServices.addNewMessageFromBase(message: msg);
//         messages.add(MessageDto(
//             chatId: msg.chatId,
//             senderId: msg.senderId,
//             messageId: msg.messageId,
//             content: msg.content,
//             createdDate: msg.dateCreate,
//             updatedDate: msg.dateUpdate,
//             attachId: msg.attachmentId,
//             contentType: msg.contentType));
//         LocalChatServices().updateChatDateUpdated(
//             chatId: messages[0].chatId,
//             dateUpdated: '${messages[0].updatedDate}');
//         add(ReadMessageEvent(messages: messages));
//       } else if (value.messageState == MessageStateEnum.isUpdateMessage) {
//         var updMsg = value.updateMessage;

//         await _messagesServices.updateMessageFromBase(
//             content: updMsg.content,
//             messageId: updMsg.idMessageMain,
//             updateDate: updMsg.dateUpdate);

//         print('id Message Main: ${updMsg.idMessageMain}');
//         print('date update: ${updMsg.idMessageMain}');

//         var messages = await _messagesServices.getAllMessages();

//         print('IsUpdate message:$messages');

//         add(ReadMessageEvent(messages: messages));
//       } else if (value.messageState == MessageStateEnum.isDeleteMesage) {
//         var del = value.deleteMessage;

//         await _messagesServices.deleteMessageFromBase(
//             id: del.idMessageMain, dateDelete: del.dateDelete);
//         var messages = await _messagesServices.getAllMessages();

//         print('IsDelete message:$messages');

//         add(ReadMessageEvent(messages: messages));
//       } else if (value.messageState == MessageStateEnum.isCreateMessage) {
//         print("IsCreate: ${value.createMessage.message}");
//         var msg = value.createMessage.message;
//         var newMsg = MessageDto(
//             localMessageId: msg.localMessgaeId,
//             messageId: msg.messageId,
//             chatId: msg.chatId,
//             senderId: msg.senderId,
//             content: msg.content,
//             createdDate: msg.dateCreate,
//             updatedDate: msg.dateUpdate,
//             attachId: msg.attachmentId,
//             contentType: msg.contentType);

//         await _messagesServices.updateMessage(
//             message: newMsg, localMessageId: msg.localMessgaeId);
//         await LocalChatServices().updateChatDateUpdated(
//             chatId: newMsg.chatId, dateUpdated: '${newMsg.updatedDate}');
//       }
//     });
//     DBHelper.instanse.updateListenController.stream.listen((event) async {
//       if (event == true) {
//         var messages = await _messagesServices.getAllMessages();

//         // messages.sort((a, b) => a.localMessageId!.compareTo(b.localMessageId!));

//         print('sortListen message:$messages');

//         add(ReadMessageEvent(messages: messages));
//         // state.copyWith(messages: messages);
//       }
//     });

//     on<ReadMessageEvent>(_onReadMessageEvent);
//     on<CreateMessageEvent>(_onCreateMessageEvent);
//     on<UpdateMessageEvent>(_onUpdateMessageEvent);
//     on<DeleteMessageEvent>(_onDeleteMessageEvent);
//     // on<DeleteHistoryMessageEvent>(_onDeleteHistoryMessageEvent);
//   }

//   FutureOr<void> _onReadMessageEvent(
//       ReadMessageEvent event, Emitter<MessageState> emit) async {
//     if (event.messages == null || event.messages?.length == 1) {
//       var messages = await _messagesServices.getAllMessages();

//       print("MESSAGES:$messages");

//       emit(state.copyWith(messages: messages));
//     } else {
//       print('EVENT MSG: ${event.messages}');

//       emit(state.copyWith(messages: event.messages));
//     }
//   }

//   FutureOr<void> _onCreateMessageEvent(
//       CreateMessageEvent event, Emitter<MessageState> emit) async {
//     var message = event.message;
//     if (event.mediaPath != null) {
//       emit(state.copyWith(mediaPath: event.mediaPath));
//     }
//     if (event.mediaState == MediaState.isCanceled) {
//       emit(state.copyWith(mediaState: MediaState.isCanceled));
//     }
//     if (event.mediaState == MediaState.isPreparation) {
//       emit(state.copyWith(mediaState: MediaState.isPreparation));
//     }
//     print('MESSAGE: $message');
//     //отправка текстового сообщения
//     if (event.contentType == ContentType.isText && message != null) {
//       // ignore: prefer_conditional_assignment
//       if (message.localMessageId == null) {
//         message.localMessageId = await _messagesServices.addNewMessage(
//           chatId: message.chatId,
//           senderId: await _mainUserServices.getUserID(),
//           content: message.content,
//           date: message.createdDate!,
//         );
//       }
//       if (message.messageId == null) {
//         var request = CreateMessageRequest(
//             message: Message(
//                 localMessgaeId: message.localMessageId,
//                 messageId: message.messageId,
//                 chatId: message.chatId,
//                 content: message.content,
//                 senderId: message.senderId));
//         // await LocalChatServices().updateChatDateUpdated(chatId: message.chatId, dateUpdated: '${message.createdDate}');
//         messageController.add(DynamicRequest(
//             createMessage: request,
//             messageState: MessageStateEnum.isCreateMessage));
//       }
//     }
//     //отправка сообщения с медиа
//     else if (state.mediaPath != null &&
//         event.mediaState == MediaState.isSending) {
//       //запрос в рест на добавление медиа
//       var resp = await RestClient().sendImageRest(path: state.mediaPath!);

//       //получаем обратно model attach
//       //записываем всю информацию об сообщении в локальное хранилище
//       await _messagesServices.addAttach(resp);

//       //записать в локальное хранилище новое
//       if (event.contentType == ContentType.isMedia) {
//         message?.localMessageId = await _messagesServices.addNewMessage(
//             chatId: message.chatId,
//             senderId: await _mainUserServices.getUserID(),
//             content: resp.meta,
//             date: message.createdDate!,
//             attachId: resp.id,
//             contentType: event.contentType);
//         var request = CreateMessageRequest(
//             message: Message(
//                 localMessgaeId: message?.localMessageId,
//                 messageId: message?.messageId,
//                 chatId: message?.chatId,
//                 content: resp.meta,
//                 senderId: message?.senderId,
//                 attachmentId: resp.id,
//                 contentType: event.contentType));
//         await LocalChatServices().updateChatDateUpdated(
//             chatId: message!.chatId, dateUpdated: '${message.createdDate}');
//         messageController.add(DynamicRequest(
//             createMessage: request,
//             messageState: MessageStateEnum.isCreateMessage));
//       }
//       if (event.contentType == ContentType.isMediaText) {
//         message?.localMessageId = await _messagesServices.addNewMessage(
//             chatId: message.chatId,
//             senderId: await _mainUserServices.getUserID(),
//             content:
//                 {'message': message.content, 'media': resp.meta}.toString(),
//             date: message.createdDate!,
//             attachId: resp.id,
//             contentType: event.contentType);

//         //и отправляем через grpc второму клиенту
//         var request = CreateMessageRequest(
//             message: Message(
//                 localMessgaeId: message?.localMessageId,
//                 messageId: message?.messageId,
//                 chatId: message?.chatId,
//                 content: {'message': message?.content, 'media': resp.meta}
//                     .toString(),
//                 senderId: message?.senderId,
//                 attachmentId: message?.attachId,
//                 contentType: event.contentType));
//         await LocalChatServices().updateChatDateUpdated(
//             chatId: message!.chatId, dateUpdated: '${message.createdDate}');
//         messageController.add(DynamicRequest(
//             createMessage: request,
//             messageState: MessageStateEnum.isCreateMessage));
//       }
//       //обнуляем состояния
//       emit(state.copyWith(mediaState: MediaState.isCanceled, mediaPath: null));
//     }
//   }

//   ///
//   ///Обновление сообщения
//   ///
//   FutureOr<void> _onUpdateMessageEvent(
//       UpdateMessageEvent event, Emitter<MessageState> emit) async {
//     if (event.isEditing == EditState.isPreparation) {
//       emit(state.copyWith(
//           editState: EditState.isPreparation, messageId: event.messageId));
//     }
//     if (event.isEditing == EditState.isEditing) {
//       //Обновляем сообщение в локальном хранилище
//       await _messagesServices.updateMessage(
//           message: event.message!, localMessageId: state.messageId!);
//       emit(state.copyWith(editState: EditState.isNotEditing));

//       try {
//         // отправляем обновленное сообщение на сервер
//         var messageUpdateRequest = UpdateMessageRequest(
//             idMessageMain: event.message?.messageId,
//             content: event.message!.content);
//         messageController.add(
//           DynamicRequest(
//               updateMessage: messageUpdateRequest,
//               messageState: MessageStateEnum.isUpdateMessage),
//         );
//         //получаем от сервера ответ
// //         var messageUpdateResponse =
// //             await stub.updateMessage(messageUpdateRequest);
// // //записываем в локальную бд полученные данные от сервера
// //         if (messageUpdateResponse.idMessageMain == state.messageId) {
// //           await _messagesServices.updateWrittenToServer(
// //               localMessageId: state.messageId!,
// //               messagesId: messageUpdateResponse.idMessageMain,
// //               updatedDate: messageUpdateResponse.dateUpdate);
// //           print('id Message Main: ${messageUpdateResponse.idMessageMain}');
// //           print('date update: ${messageUpdateResponse.dateUpdate}');
// //         }
//       } catch (e) {}
//     }
//     if (event.isEditing == EditState.isNotEditing) {
//       emit(state.copyWith(editState: EditState.isNotEditing));
//     }
//   }

//   ///Удаление сообщения по ид
//   FutureOr<void> _onDeleteMessageEvent(
//       DeleteMessageEvent event, Emitter<MessageState> emit) async {
//     await _messagesServices.deleteMessage(id: event.messageId);
//     add(ReadMessageEvent());
//     print('message ID: ${event.messageId}');
//     emit(state.copyWith(
//         deleteState: DeleteState.isDeleted, editState: EditState.isNotEditing));
//     var messageDelete = DynamicRequest(
//         deleteMessage: DeleteMessageRequest(idMessageMain: event.messageId),
//         messageState: MessageStateEnum.isDeleteMesage);
//     try {
//       messageController.add(messageDelete);
//       // print('DEL DATE: ${response.dateDelete}');
//       // print('DEL ID: ${response.idMessageMain}');

//       // await _messagesServices.updateWrittenToServer(localMessageId: localMessageId, updatedDate: updatedDate)
//     } catch (e) {}
//   }

//   ///Очистка истории в определенном чате
//   FutureOr<void> _onDeleteHistoryMessageEvent(
//       DeleteHistoryMessageEvent event, Emitter<MessageState> emit) async {
//     await _messagesServices.deleteAllMessagesInChat(chatID: event.chatID);
//     print('CHAT ID: ${event.chatID}');
//     add(ReadMessageEvent());
//   }

//   @override
//   Future<void> close() {
//     _subscription.cancel();
//     return super.close();
//   }
// }

// class ClInter extends ClientInterceptor {
//   @override
//   ResponseFuture<R> interceptUnary<Q, R>(
//       ClientMethod<Q, R> method, Q request, CallOptions options, invoker) {
//     var newOptions = options.mergedWith(CallOptions(metadata: <String, String>{
//       'token': 'Some-Token',
//     }));

//     return super.interceptUnary(method, request, options, invoker);
//   }
// }
