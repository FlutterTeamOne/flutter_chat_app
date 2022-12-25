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
    var user = context.read<UserBloc>().state.users![widget.chatId];
    var messageBloc = context.read<MessageBloc>();
    return Column(
      children: [
        ChatAppBarWidget(
          image: user.profilePicLink,
          name: user.name,
        ),
        Expanded(
          child: context.watch<MessageBloc>().state.messages != null
              ? ChatWidget(
                  textController: controller,
                  messages: context.watch<MessageBloc>().state.messages!,
                )
              : const Center(child: CircularProgressIndicator()),
        ),
        TextInputWidget(
          onSubmitted: (text) => _sendAndChange(messageBloc),
          controller: controller,
          onTap: () => _sendAndChange(messageBloc),
          editState: messageBloc.state.editState,
          editText: controller.text,
          cancelEdit: () {
            messageBloc
                .add(UpdateMessageEvent(isEditing: EditState.isNotEditing));
            controller.clear();
          },
        ),
      ],
    );
  }

  _sendAndChange(MessageBloc messageBloc) async {
    if (messageBloc.state.editState == EditState.isNotEditing &&
        controller.text.isNotEmpty) {
      messageBloc.add(
        CreateMessageEvent(
          message: MessageDto(
            chatId: widget.chatId,
            senderId: await MainUserServices().getUserID(),
            content: controller.text,
            createdDate: DateTime.now().toIso8601String(),
            updatedDate: DateTime.now().toIso8601String(),
          ),
        ),
      );
      FocusScope.of(context).unfocus();
      controller.clear();
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
    }
  
    if (messageBloc.state.mediaState == MediaState.isPreparation) {
      messageBloc.add(
        CreateMessageEvent(
          message: MessageDto(
            chatId: widget.chatId,
            senderId: await MainUserServices().getUserID(),
            content: controller.text,
            createdDate: DateTime.now().toIso8601String(),
            updatedDate: DateTime.now().toIso8601String(),
          ),
          mediaState: MediaState.isSending
        ),
      );
      FocusScope.of(context).unfocus();
      controller.clear();
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
