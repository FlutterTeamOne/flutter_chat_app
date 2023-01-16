import 'package:chat_app/modules/storage_manager/db_helper/user_path.dart';
import 'package:chat_app/src/constants/db_constants.dart';
import 'package:chat_app/src/generated/grpc_lib/grpc_message_lib.dart';
import 'package:chat_app/src/generated/sync/grpcsynh.pbgrpc.dart';
import 'package:chat_app/src/libraries/library_all.dart';
import 'package:logger/logger.dart';

import '../../../client/rest_client.dart';

class ValidatorService {
  static final LocalMessagesServices _messagesServices =
      LocalMessagesServices();
  static final LocalChatServices _chatServices = LocalChatServices();
  static final LocalUsersServices _usersServices = LocalUsersServices();

  static Future validMessage({required SynhMessage message}) async {
    final db = await DBHelper.instanse.database;
    final ok = await db.rawQuery(
        'SELECT ${DatabaseConst.messagesColumnMessageId} FROM ${DatabaseConst.messageTable} WHERE ${DatabaseConst.messagesColumnMessageId}=?',
        [message.messageId]);
    if (ok.isEmpty) {
      final type =
          MessageDto.contType(contentTypeName: message.contentType.name);
      final msg = Message(
        messageId: message.messageId,
        chatId: message.chatId,
        senderId: message.senderId,
        content: message.content,
        dateCreate: message.createdDate,
        dateUpdate: message.updatedDate,
        dateDelete: message.deletedDate,
        contentType: type,
        attachmentId: message.attachmentId,
        isRead: message.isRead,
      );
      UserPref.setLastMessageId(
          userName: '${UserPref.getUserId}user', lastMessageId: msg.messageId);
// await LocalChatServices().
      if (msg.dateDelete == null || msg.dateDelete == '') {
        await _messagesServices.addNewMessageFromBase(message: msg);
      }
    }
  }

  static Future validUser({required SynhUser user}) async {
    final ok = await _usersServices.getUserById(id: user.userId);
    if (ok.isEmpty) {
      
      Logger().d("deleted date is empty? ${user.deletedDate} ${user.deletedDate.isNotEmpty}");
      String userAvatar = (user.deletedDate == "" || user.deletedDate.isEmpty)
          ? user.picture
          : """https://www.iconsdb.com/icons/preview/red/cancel-xxl.png""";
      await _usersServices.createUser(
          name: user.name,
          email: user.email,
          createdDate: user.createdDate,
          updatedDate: user.updateDate,
          deletedDate: user.deletedDate,
          profilePicUrl: userAvatar,
          userId: user.userId);
    }
  }

  static Future validChat({required SynhChat chat}) async {
    List<Map<String, Object?>> chatByUser =
        await _chatServices.getChatByUserId(id: chat.userId);
    final ok = await _chatServices.getChatById(id: chat.chatId);
    if (ok.isEmpty) {
      await _chatServices.createChat(
          createDate: chat.createdDate,
          userId: chat.userId,
          chatId: chat.chatId);
    }
    if (chat.deletedDate.isNotEmpty) {
      await _messagesServices.deleteAllMessagesInChat(chatID: chat.chatId);
    }
    if (chatByUser.isEmpty) {}
  }

  static Future newMessageFromBaseOnline({required Message message}) async {
    final ok = await _chatServices.getChatById(id: message.chatId);
    if (ok.isEmpty) {
      await RestClient()
          .getChatById(chatId: message.chatId, userId: message.senderId);
    }
  }
}
