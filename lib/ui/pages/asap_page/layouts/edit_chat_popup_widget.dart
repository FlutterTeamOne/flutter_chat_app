import 'package:chat_app/modules/client/custom_exception.dart';
import 'package:chat_app/modules/signal_service/river/river.dart';
import 'package:chat_app/src/libraries/library_all.dart';
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
    return myChat
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
                      onTap: () async {
                        try {
                          await ref
                              .read(River.chatPod.notifier)
                              .deleteChat(chatId);

                          int friendId = await LocalChatServices()
                              .getUserIdByChatId(id: chatId);
                          print("FRIEND ID FOR DELETE $friendId");
                          ref.read(River.chatPod.notifier).getChatId(-1);
                          await LocalChatServices().deleteChat(id: chatId);
                          await LocalMessagesServices()
                              .deleteAllMessagesInChat(chatID: chatId);
                          await LocalUsersServices().deleteUser(id: friendId);
                        } on CustomException catch (e) {
                          print("POPUP DELETE Custom $e");
                          String textContent = e.message == 'null'
                              ? "Rest Server Not Found"
                              : e.message;
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return ErrorDialog(
                                  textTitle: 'Error',
                                  textContent: textContent,
                                );
                              });
                        }
                      }),
                ]);
  }
}
