import 'package:chat_app/modules/signal_service/river/river.dart';
import 'package:chat_app/ui/pages/asap_page/layouts/user_chat_layout.dart';
import 'package:chat_app/ui/widgets/custom_dialogs/error_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EditChatPopupWidget extends StatelessWidget {
  const EditChatPopupWidget({
    Key? key,
    required this.myChat,
    required this.ref,
    required this.chatId,
  }) : super(key: key);

  final bool myChat;
  final WidgetRef ref;
  final int chatId;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: myChat
          ? IconButton(onPressed: () {}, icon: const Icon(Icons.draw_outlined))
          : PopupMenuButton<int>(
              itemBuilder: (context) => [
                    PopupMenuItem(
                        value: 1,
                        child: Row(
                          children: const [
                            Icon(Icons.delete),
                            SizedBox(width: 10),
                            Text("Delete Chat")
                          ],
                        ),
                        onTap: () {
                          try {
                            ref.read(River.chatPod.notifier).deleteChat(chatId);
                            ref.read(River.chatPod.notifier).getChatId(-1);
                          } catch (e) {
                            showDialog(
                                context: context,
                                builder: (context) => ErrorDialog(
                                    textTitle: 'Error', textContent: '$e'));
                          }
                        }),
                  ]),
    );
  }
}
