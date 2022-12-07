part of '../asap_page.dart';

class _UserChatLayout extends StatefulWidget {
  const _UserChatLayout({
    Key? key,
    required this.chatId,
    required this.localChatId,
  }) : super(key: key);
  final int chatId;
  final int localChatId;

  @override
  State<_UserChatLayout> createState() => _UserChatLayoutState();
}

class _UserChatLayoutState extends State<_UserChatLayout> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var user = context.read<UserBloc>().state.users![widget.chatId];
    return Column(
      children: [
        _ChatAppBar(
          image: user.profilePicLink,
          name: user.name,
        ),
        Expanded(
          child: context.watch<MessageBloc>().state.messages != null
              ? _Chat(messages: context.read<MessageBloc>().state.messages!)
              : const Center(child: CircularProgressIndicator()),
        ),
        _TextInput(
          onSubmitted: (text) {
            if (controller.text.isNotEmpty) {
              context.read<MessageBloc>().add(
                    CreateMessageEvent(
                      message: MessageModel(
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
