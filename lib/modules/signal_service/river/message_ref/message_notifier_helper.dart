import 'package:chat_app/domain/data/dto/message_dto/message_dto.dart';
import 'package:chat_app/modules/sending_manager/library/library_sending_manager.dart';
import 'package:chat_app/modules/sending_manager/services/validator_service/validator_service.dart';
import 'package:chat_app/modules/storage_manager/db_helper/user_path.dart';
import 'package:logger/logger.dart';

import '../../../../src/generated/grpc_lib/grpc_message_lib.dart';

class MessageNotifierHelper {
  static final LocalMessagesServices _messagesService = LocalMessagesServices();
  static final LocalChatServices _chatServices = LocalChatServices();
  static final Logger _logger = Logger();
  static Future isReadMessage({required Message message}) async {
    _logger.d("READMESSAGE: $message");
    final List<MessageDto> messages = <MessageDto>[];

    await ValidatorService.newMessageFromBaseOnline(message: message);
    await _messagesService.addNewMessageFromBase(message: message);
    // final MessageDto msg =  MessageDto(
    //       chatId: message.chatId,
    //       senderId: message.senderId,
    //       messageId: message.messageId,
    //       content: message.content,
    //       createdDate: message.dateCreate,
    //       updatedDate: message.dateUpdate,
    //       attachId: message.attachmentId,
    //       contentType: message.contentType);
    final MessageDto msg = MessageDto.fromMessage(message);
    messages.add(msg);

    await _chatServices.updateChatDateUpdated(
        chatId: messages[0].chatId, dateUpdated: '${messages[0].updatedDate}');
  }

  static Future isUpdatedMessage(
      {required UpdateMessageResponse updMsg}) async {
    await _messagesService.updateMessageFromBase(
        content: updMsg.content,
        messageId: updMsg.idMessageMain,
        updateDate: updMsg.dateUpdate);

   
    _logger.d('id Message Main: ${updMsg.idMessageMain}');
    _logger.d('date update: ${updMsg.idMessageMain}');

    // var messages = await _messagesServices.getAllMessages();

    // print('IsUpdate message:$messages');

    // readMessages(messages);
  }

  static Future isDeleteMessage({required DeleteMessageResponse del}) async {
    await _messagesService.deleteMessageFromBase(
        id: del.idMessageMain, dateDelete: del.dateDelete);
    // var messages = await _messagesServices.getAllMessages();

    // print('IsDelete message:$messages');

    // readMessages(messages);
  }

  static Future isCreatedMessage({required Message msg}) async {
    _logger.d("IsCreate: $msg");

    // var newMsg = MessageDto(
    //     localMessageId: msg.localMessgaeId,
    //     messageId: msg.messageId,
    //     chatId: msg.chatId,
    //     senderId: msg.senderId,
    //     content: msg.content,
    //     createdDate: msg.dateCreate,
    //     updatedDate: msg.dateUpdate,
    //     attachId: msg.attachmentId,
    //     contentType: msg.contentType);
    final MessageDto newMsg = MessageDto.fromMessage(msg);

    UserPref.setLastMessageId(
        userName: '${UserPref.getUserId}user', lastMessageId: msg.messageId);

    await _messagesService.updateMessage(
        message: newMsg, localMessageId: msg.localMessgaeId);
    await _chatServices.updateChatDateUpdated(
        chatId: newMsg.chatId, dateUpdated: '${newMsg.updatedDate}');
  }
}
