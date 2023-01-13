import 'package:chat_app/modules/sending_manager/library/library_sending_manager.dart';
import 'package:chat_app/modules/storage_manager/db_helper/db_helper.dart';
import 'package:chat_app/src/constants/db_constants.dart';
import 'package:chat_app/src/generated/grpc_lib/grpc_message_lib.dart';
import 'package:chat_app/src/generated/sync/grpcsynh.pbgrpc.dart';

class ValidatorService {
  static Future validMessage({required SynhMessage message}) async {
    final db = await DBHelper.instanse.database;
    final ok = await db.rawQuery(
        'SELECT ${DatabaseConst.messagesColumnMessageId} FROM ${DatabaseConst.messageTable} WHERE ${DatabaseConst.messagesColumnMessageId}=?',
        [message.messageId]);
    if (ok.isEmpty) {
      final type = ContentType.isText.name == message.contentType.name
          ? ContentType.isText
          : ContentType.isMedia.name == message.contentType.name
              ? ContentType.isMedia
              : ContentType.isMediaText.name == message.contentType.name
                  ? ContentType.isMediaText
                  : ContentType.isText;
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
// await LocalChatServices().
      if (msg.dateDelete == null || msg.dateDelete == '') {
        await LocalMessagesServices().addNewMessageFromBase(message: msg);
      }
    }
  }

  static Future validUser({required SynhUser user}) async {
    final ok = await LocalUsersServices().getUserById(id: user.userId);
    if (ok.isEmpty) {
      print(
          "deleted date is empty? ${user.deletedDate} ${user.deletedDate.isNotEmpty}");
      String userAvatar = (user.deletedDate == "" || user.deletedDate.isEmpty)
          ? user.picture
          : """https://www.iconsdb.com/icons/preview/red/cancel-xxl.png""";
      await LocalUsersServices().createUser(
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
    // final okAll = await LocalChatServices().getAllChats();
    // if (okAll.isEmpty) {
    //   await LocalChatServices().createChat(
    //       createDate: chat.createdDate,
    //       userId: chat.userId,
    //       chatId: chat.chatId);
    // }
    //делаем запроc в локалку на совпадение чата с таким же юзер ид

    List<Map<String, Object?>> chatByUser =
        await LocalChatServices().getChatByUserId(id: chat.userId);
    final ok = await LocalChatServices().getChatById(id: chat.chatId);
    if (ok.isEmpty) {
      await LocalChatServices().createChat(
          createDate: chat.createdDate,
          userId: chat.userId,
          chatId: chat.chatId);
    }
    if (chatByUser.isEmpty) {}
  }
}
