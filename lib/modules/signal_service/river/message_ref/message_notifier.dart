import 'dart:async';

import 'package:chat_app/modules/client/grpc_client.dart';
import 'package:chat_app/modules/client/rest_client.dart';
import 'package:chat_app/modules/signal_service/river/message_ref/message_state_ref.dart';
import 'package:chat_app/modules/storage_manager/db_helper/db_helper.dart';
import 'package:chat_app/src/generated/grpc_lib/grpc_message_lib.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grpc/grpc.dart';

import '../../../../domain/data/library/library_data.dart';
import '../../../sending_manager/library/library_sending_manager.dart';

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

        // var messages = await _messagesServices.getAllMessages();

        // print('IsUpdate message:$messages');

        // readMessages(messages);
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

        readMessages(messages);
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
    //???????????????? ???????????????????? ??????????????????
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
    //???????????????? ?????????????????? ?? ??????????
    else if (state.mediaPath != null && mediaState == MediaState.isSending) {
      //???????????? ?? ???????? ???? ???????????????????? ??????????
      var resp = await RestClient().sendImageRest(path: state.mediaPath!);

      //???????????????? ?????????????? model attach
      //???????????????????? ?????? ???????????????????? ???? ?????????????????? ?? ?????????????????? ??????????????????
      await _messagesServices.addAttach(resp);

      //???????????????? ?? ?????????????????? ?????????????????? ??????????
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

        //?? ???????????????????? ?????????? grpc ?????????????? ??????????????
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
      //???????????????? ??????????????????
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
      //?????????????????? ?????????????????? ?? ?????????????????? ??????????????????
      await _messagesServices.updateMessage(
          message: message!, localMessageId: state.messageId!);
      state = state.copyWith(editState: EditState.isNotEditing);

      try {
        // ???????????????????? ?????????????????????? ?????????????????? ???? ????????????
        var messageUpdateRequest = UpdateMessageRequest(
            idMessageMain: message.messageId, content: message.content);
        messageController.add(
          DynamicRequest(
              updateMessage: messageUpdateRequest,
              messageState: MessageStateEnum.isUpdateMessage),
        );
        //???????????????? ???? ?????????????? ??????????
//         var messageUpdateResponse =
//             await stub.updateMessage(messageUpdateRequest);
// //???????????????????? ?? ?????????????????? ???? ???????????????????? ???????????? ???? ??????????????
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
    DBHelper.instanse.updateListenController.add(true);
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