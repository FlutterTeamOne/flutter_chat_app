import '../../../modules/signal_service/river/river.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../src/libraries/library_all.dart';
import 'package:flutter/material.dart';

import 'layouts/chat_list_layout.dart';
import 'layouts/default_user_chat_layout.dart';
import 'layouts/user_chat_layout.dart';

class AsapPage extends StatelessWidget {
  const AsapPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        var chatPod = ref.watch(River.chatPod);
        var messagePod = ref.watch(River.messagePod);
        return Row(
          children: [
            // Список чатов
            chatPod.chats == null
                ? const Center(child: CircularProgressIndicator())
                : ChatListLayout(messageModel: messagePod.messages!),
            Expanded(
                flex: 3,
                child: chatPod.chatId == null || chatPod.chatId == -1
                    ? const DefaultUserChatLayout()
                    : messagePod.messages != null
                        ? UserChatLayout(chatId: chatPod.chatId!)
                        : const Center(child: CircularProgressIndicator())),
          ],
        );
      },
    );
  }
}
