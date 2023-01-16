import 'package:chat_app/modules/signal_service/river/message_ref/message_notifier.dart';
import 'package:chat_app/modules/storage_manager/db_helper/user_path.dart';
import '../../../../modules/signal_service/river/message_ref/message_state_ref.dart';
import '../../../../modules/signal_service/river/river.dart';
import '../../../../src/generated/grpc_lib/grpc_message_lib.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../src/libraries/library_all.dart';
import '../../../widgets/library/library_widgets.dart';

class UserChatLayout extends ConsumerStatefulWidget {
  const UserChatLayout({
    Key? key,
    required this.chatId,
  }) : super(key: key);
  final int chatId;

  @override
  ConsumerState<UserChatLayout> createState() => UserChatLayoutState();
}

class UserChatLayoutState extends ConsumerState<UserChatLayout> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    ChatDto? chat = ref
        .read(River.chatPod)
        .chats
        ?.firstWhere((chat) => chat.chatId == widget.chatId);
    UserDto? user = ref
        .read(River.userPod)
        .users
        ?.firstWhere((user) => user.userId == chat?.userIdChat);

    // for (var u in ref.read(River.userPod).users!) {
    //   if (chat?.userIdChat == null) {
    //     break;
    //   }
    //   if (u.userId == chat?.userIdChat) {
    //     user = u;
    //   }
    // }
    var messageNotif = ref.read(River.messagePod.notifier);
    var messageRead = ref.read(River.messagePod);
    var messageWatch = ref.watch(River.messagePod);
    final myChat = chat?.userIdChat == UserPref.getUserId;
    return chat == null
        ? Container()
        : Column(
            children: <Widget>[
              //Top bar of the user_chat_layout screen part, that contains the friend's name and pic
              Container(
                height: 60,
                color: Colors.transparent.withOpacity(0.1),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: ChatAppBarWidget(
                        image: user!.deletedDate!.isEmpty
                            ? user.profilePicLink
                            : 'https://www.iconsdb.com/icons/preview/red/cancel-xxl.png',
                        // user.profilePicLink,
                        name: myChat ? 'My Favorite Chat' : user.name,
                        chatId: widget.chatId,
                        myChat: myChat,
                        ref: ref,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 10,
                child: messageWatch.messages != null
                    ? ChatWidget(
                        textController: controller,
                        messages: messageWatch.messages!,
                        chatId: widget.chatId,
                        deletedUser: user.deletedDate,
                      )
                    : const Center(child: CircularProgressIndicator()),
              ),
              if (user.deletedDate!.isEmpty || user.deletedDate == null) ...[
                TextInputWidget(
                  onSubmitted: (text) =>
                      _sendAndChange(messageRead, messageNotif),
                  controller: controller,
                  onTap: messageRead.mediaState == MediaState.isSending
                      ? () {}
                      : () => _sendAndChange(messageRead, messageNotif),
                  editState: messageRead.editState,
                  editText: controller.text,
                  cancelEdit: () {
                    messageNotif.updateMessage(
                        isEditing: EditState.isNotEditing);
                    controller.clear();
                  },
                )
              ] else ...[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text('Oops This user has deleted their account'),
                      SizedBox(width: 20),
                      Icon(
                        Icons.error_outlined,
                        // color: Colors.yellow,
                      ),
                    ],
                  ),
                )
              ],
            ],
          );
  }

  _sendAndChange(
      MessageStateRef messageRef, MessageNotifier messageNotif) async {
    final String date = DateTime.now().toIso8601String();
    final int senderId = await MainUserServices().getUserID();
    if (messageRef.editState == EditState.isNotEditing &&
        controller.text.isNotEmpty &&
        messageRef.mediaState != MediaState.isPreparation) {
    await  messageNotif.createMessage(
          message: MessageDto(
              chatId: widget.chatId,
              senderId: senderId,
              content: controller.text,
              createdDate: date,
              updatedDate: date,
              contentType: ContentType.isText),
          contentType: ContentType.isText);
      // context.read<ChatBloc>().add(ReadChatEvent());
      FocusScope.of(context).unfocus();
      controller.clear();
      return;
    }
    // print('IS EDIT F:${context.read<MessageBloc>().isEditing}');
    if (messageRef.editState == EditState.isPreparation &&
        controller.text.isNotEmpty) {
      print("EDITING");
      var localMessageId = messageRef.messageId;
      var message = messageRef.messages
          ?.firstWhere((element) => element.localMessageId == localMessageId);
      if (message?.contentType == ContentType.isText) {
        print('EDIT  TEXT');
     await   messageNotif.updateMessage(
            message: MessageDto(
                chatId: widget.chatId,
                senderId: senderId,
                content: controller.text,
                messageId: message?.messageId,
                createdDate: message?.createdDate,
                updatedDate: date),
            isEditing: EditState.isEditing);
      } else if (message?.contentType == ContentType.isMediaText) {
        print('EDIT MEDIA TEXT');
        List<String>? data = message?.content.split('media: ');
        var msg = data![1];
        print('MSG UPD: $msg');
      await  messageNotif.updateMessage(
            message: MessageDto(
                chatId: widget.chatId,
                senderId: senderId,
                content: {'message': controller.text, 'media': msg}.toString(),
                messageId: message?.messageId,
                createdDate: message?.createdDate,
                updatedDate: date),
            isEditing: EditState.isEditing);
      } else {
        print('EDIT MEDIA ');
        return;
      }
      controller.clear();
      return;
    }

    if (messageRef.mediaState == MediaState.isPreparation &&
        controller.text.isNotEmpty) {
    await  messageNotif.createMessage(
          message: MessageDto(
              chatId: widget.chatId,
              senderId: senderId,
              content: controller.text,
              createdDate: date,
              updatedDate: date,
              contentType: ContentType.isMediaText),
          contentType: ContentType.isMediaText,
          mediaState: MediaState.isSending);
      FocusScope.of(context).unfocus();
      controller.clear();
    } else if (messageRef.mediaState == MediaState.isPreparation &&
        controller.text.isEmpty) {
    await  messageNotif.createMessage(
          message: MessageDto(
              chatId: widget.chatId,
              senderId: senderId,
              content: controller.text,
              createdDate: date,
              updatedDate: date,
              contentType: ContentType.isMedia),
          contentType: ContentType.isMedia,
          mediaState: MediaState.isSending);
      FocusScope.of(context).unfocus();
      controller.clear();
      return;
    } else {
      return null;
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
