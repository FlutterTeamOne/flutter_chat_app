import '../../../../modules/signal_service/river/message_state_ref.dart';
import '../../../../modules/signal_service/river/river.dart';
import '../../../../src/generated/grpc_lib/grpc_message_lib.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    var badState;
    ChatDto? chat;
    // var chat = context.read<ChatBloc>().state.chats?.firstWhere(
    //       (chats) => chats.chatId == widget.chatId,
    //     );
    for (var c in ref.read(River.chatPod).chats!) {
      if (c.chatId == widget.chatId) {
        chat = c;
      }
    }
    var user;
    // = context
    //     .read<UserBloc>()
    //     .state
    //     .users
    //     ?.firstWhere((user) => user.userId == chat?.userIdChat);
    for (var u in ref.read(River.userPod).users!) {
      if (chat?.userIdChat == null) {
        break;
      }
      if (u.userId == chat?.userIdChat) {
        user = u;
      }
    }
    var messageNotif = ref.read(River.messagePod.notifier);
    var messageRead = ref.read(River.messagePod);
    var messageWatch = ref.watch(River.messagePod);
    return chat == null
        ? Container()
        : Column(
            children: <Widget>[
              //Top bar of the user_chat_layout screen part, that contains the friend's name and pic
              Flexible(
                flex: 1,
                child: Container(
                  height: 60,
                  color: Colors.transparent.withOpacity(0.1),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Flexible(
                        child: ChatAppBarWidget(
                          image: user!.deletedDate!.isEmpty
                              ? user.profilePicLink
                              : 'https://www.iconsdb.com/icons/preview/red/cancel-xxl.png',
                          // user.profilePicLink,
                          name: user.name,
                        ),
                      ),
                      Flexible(
                        child: PopupMenuButton<int>(
                            itemBuilder: (context) => [
                                  PopupMenuItem(
                                      value: 1,
                                      child: Row(
                                        children: const [
                                          Icon(Icons.delete),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text("Delete Chat")
                                        ],
                                      ),
                                      onTap: () => ref
                                          .read(River.chatPod.notifier)
                                          .deleteChat(widget.chatId)),
                                ]),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 10,
                child: messageWatch.messages != null
                    ? ChatWidget(
                        textController: controller,
                        messages: messageWatch.messages!,
                        chatId: widget.chatId,
                      )
                    : const Center(child: CircularProgressIndicator()),
              ),
              TextInputWidget(
                onSubmitted: (text) =>
                    _sendAndChange(messageRead, messageNotif),
                controller: controller,
                onTap: () => user.deletedDate!.isNotEmpty
                    ? showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return Dialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: SizedBox(
                              height: 80,
                              width: 80,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('User ${user.name} is deleted'),
                                  ),
                                  ElevatedButton(
                                      style: ButtonStyle(
                                          shape: MaterialStateProperty.all<
                                                  RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ))),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Icon(
                                        Icons.close_rounded,
                                      ))
                                ],
                              ),
                            ),
                          );
                        })
                    : _sendAndChange(messageRead, messageNotif),
                editState: messageRead.editState,
                editText: controller.text,
                cancelEdit: () {
                  messageNotif.updateMessage(isEditing: EditState.isNotEditing);
                  controller.clear();
                },
              ),
            ],
          );
  }

  _sendAndChange(
      MessageStateRef messageRef, MessageNotifier messageNotif) async {
    if (messageRef.editState == EditState.isNotEditing &&
        controller.text.isNotEmpty &&
        messageRef.mediaState != MediaState.isPreparation) {
      messageNotif.createMessage(
          message: MessageDto(
              chatId: widget.chatId,
              senderId: await MainUserServices().getUserID(),
              content: controller.text,
              createdDate: DateTime.now().toIso8601String(),
              updatedDate: DateTime.now().toIso8601String(),
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
      var messageId = messageRef.messageId;
      var message = messageRef.messages
          ?.where((element) => element.localMessageId == messageId)
          .toList();
      messageNotif.updateMessage(
          message: MessageDto(
              chatId: widget.chatId,
              senderId: await MainUserServices().getUserID(),
              content: controller.text,
              messageId: messageId,
              createdDate: message?[0].createdDate,
              updatedDate: DateTime.now().toIso8601String()),
          isEditing: EditState.isEditing);
      controller.clear();
      return;
    }

    if (messageRef.mediaState == MediaState.isPreparation &&
        controller.text.isNotEmpty) {
      messageNotif.createMessage(
          message: MessageDto(
              chatId: widget.chatId,
              senderId: await MainUserServices().getUserID(),
              content: controller.text,
              createdDate: DateTime.now().toIso8601String(),
              updatedDate: DateTime.now().toIso8601String(),
              contentType: ContentType.isMediaText),
          contentType: ContentType.isMediaText,
          mediaState: MediaState.isSending);
      FocusScope.of(context).unfocus();
      controller.clear();
    } else if (messageRef.mediaState == MediaState.isPreparation &&
        controller.text.isEmpty) {
      messageNotif.createMessage(
          message: MessageDto(
              chatId: widget.chatId,
              senderId: await MainUserServices().getUserID(),
              content: controller.text,
              createdDate: DateTime.now().toIso8601String(),
              updatedDate: DateTime.now().toIso8601String(),
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
