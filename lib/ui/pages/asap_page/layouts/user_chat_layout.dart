import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../src/libraries/library_all.dart';
import '../../../widgets/asap_page/widgets/chat_widget.dart';
import '../../../widgets/library/library_widgets.dart';

class UserChatLayout extends StatefulWidget {
  const UserChatLayout({
    Key? key,
    required this.chatId,
    required this.localChatId,
  }) : super(key: key);
  final int chatId;
  final int localChatId;

  @override
  State<UserChatLayout> createState() => UserChatLayoutState();
}

class UserChatLayoutState extends State<UserChatLayout> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var user = context.read<UserBloc>().state.users![widget.chatId];
    return Column(
      children: [
        ChatAppBarWidget(
          image: user.profilePicLink,
          name: user.name,
        ),
        Expanded(
          child: context.watch<MessageBloc>().state.messages != null
              ? ChatWidget(
                  messages: context.watch<MessageBloc>().state.messages!)
              : const Center(child: CircularProgressIndicator()),
        ),
        TextInputWidget(
          onSubmitted: (text) {
            if (controller.text.isNotEmpty) {
              context.read<MessageBloc>().add(
                    CreateMessageEvent(
                      message: MessageDto(
                        // localMessageId: 1,
                        localChatId: widget.localChatId,
                        localSendId: 1,
                        content: text,
                        date: DateTime.now().toIso8601String(),
                      ),
                    ),
                  );
              controller.clear();
            } else {
              return null;
            }
          },
          controller: controller,
          onTap: () {
            // if (controller.text.isNotEmpty) {
            //   final message = MessageModel(
            //     message: controller.text,
            //     date: DateTime.now(),
            //     isSentByMe: true,
            //   );
            //   setState(() => messages.add(message));
            //   print(controller.text);
            //   controller.clear();
            // } else {
            //   return null;
            // }
          },
        ),
      ],
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
