import 'package:chat_app/src/generated/grpc_lib/grpc_message_lib.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../src/libraries/library_all.dart';
import '../../../widgets/library/library_widgets.dart';

class UserChatLayout extends StatefulWidget {
  const UserChatLayout({
    Key? key,
    required this.chatId,
  }) : super(key: key);
  final int chatId;

  @override
  State<UserChatLayout> createState() => UserChatLayoutState();
}

class UserChatLayoutState extends State<UserChatLayout> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var badState;
    ChatDto? chat;
    // var chat = context.read<ChatBloc>().state.chats?.firstWhere(
    //       (chats) => chats.chatId == widget.chatId,
    //     );
    for (var c in context.read<ChatBloc>().state.chats!) {
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
    for (var u in context.read<UserBloc>().state.users!) {
      if (chat?.userIdChat == null) {
        break;
      }
      if (u.userId == chat?.userIdChat) {
        user = u;
      }
    }
    var messageBloc = context.read<MessageBloc>();
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
                                  onTap: () => context
                                      .read<ChatBloc>()
                                      .add(DeleteChatEvent(widget.chatId)),
                                ),
                              ]),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 10,
                child: context.read<MessageBloc>().state.messages != null
                    ? ChatWidget(
                        textController: controller,
                        messages: context.watch<MessageBloc>().state.messages!,
                        chatId: widget.chatId,
                      )
                    : const Center(child: CircularProgressIndicator()),
              ),
              TextInputWidget(
                onSubmitted: (text) => _sendAndChange(messageBloc),
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
                    : _sendAndChange(messageBloc),
                editState: messageBloc.state.editState,
                editText: controller.text,
                cancelEdit: () {
                  messageBloc.add(
                      UpdateMessageEvent(isEditing: EditState.isNotEditing));
                  controller.clear();
                },
              ),
            ],
          );
  }

  _sendAndChange(MessageBloc messageBloc) async {
    if (messageBloc.state.editState == EditState.isNotEditing &&
        controller.text.isNotEmpty &&
        messageBloc.state.mediaState != MediaState.isPreparation) {
      messageBloc.add(
        CreateMessageEvent(
            message: MessageDto(
                chatId: widget.chatId,
                senderId: await MainUserServices().getUserID(),
                content: controller.text,
                createdDate: DateTime.now().toIso8601String(),
                updatedDate: DateTime.now().toIso8601String(),
                contentType: ContentType.isText),
            contentType: ContentType.isText),
      );
      if (!mounted) return;
      context.read<ChatBloc>().add(ReadChatEvent());
      FocusScope.of(context).unfocus();
      controller.clear();
      return;
    }
    // print('IS EDIT F:${context.read<MessageBloc>().isEditing}');
    if (messageBloc.state.editState == EditState.isPreparation &&
        controller.text.isNotEmpty) {
      print("EDITING");
      var messageId = messageBloc.state.messageId;
      var message = messageBloc.state.messages
          ?.where((element) => element.localMessageId == messageId)
          .toList();
      messageBloc.add(
        UpdateMessageEvent(
            message: MessageDto(
                chatId: widget.chatId,
                senderId: await MainUserServices().getUserID(),
                content: controller.text,
                messageId: messageId,
                createdDate: message?[0].createdDate,
                updatedDate: DateTime.now().toIso8601String()),
            isEditing: EditState.isEditing),
      );
      controller.clear();
      return;
    }

    if (messageBloc.state.mediaState == MediaState.isPreparation &&
        controller.text.isNotEmpty) {
      messageBloc.add(
        CreateMessageEvent(
            message: MessageDto(
                chatId: widget.chatId,
                senderId: await MainUserServices().getUserID(),
                content: controller.text,
                createdDate: DateTime.now().toIso8601String(),
                updatedDate: DateTime.now().toIso8601String(),
                contentType: ContentType.isMediaText),
            contentType: ContentType.isMediaText,
            mediaState: MediaState.isSending),
      );
      if (!mounted) return;
      FocusScope.of(context).unfocus();
      controller.clear();
      return;
    } else if (messageBloc.state.mediaState == MediaState.isPreparation &&
        controller.text.isEmpty) {
      messageBloc.add(
        CreateMessageEvent(
            message: MessageDto(
                chatId: widget.chatId,
                senderId: await MainUserServices().getUserID(),
                content: controller.text,
                createdDate: DateTime.now().toIso8601String(),
                updatedDate: DateTime.now().toIso8601String(),
                contentType: ContentType.isMedia),
            contentType: ContentType.isMedia,
            mediaState: MediaState.isSending),
      );
      if (!mounted) return;
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
