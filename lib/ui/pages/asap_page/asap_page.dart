import '../../../modules/signal_service/river/chat_state_ref.dart';
import '../../../modules/signal_service/river/river.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../src/libraries/library_all.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        var chats;
        ref.watch(
            River.futureChatPod.selectAsync((data) => chats = data.chats));
        var chatPod = ref.watch(River.chatPod);
        var messages;
        ref.watch(River.futureMessagePod
            .selectAsync((data) => messages = data.messages));

        for (var m in messages) {
          print("messageState: $m");
        }
        return Row(
          children: [
            // Список чатов
            Expanded(
              child: chats != null
                  ? ChatListLayout(chatModel: chats!, messageModel: messages!)
                  : const Center(
                      child: CircularProgressIndicator(),
                    ),
            ),
            Expanded(
                flex: 3,
                child: chatPod.chatId == null || chatPod.chatId == -1
                    ? const DefaultUserChatLayout()
                    : messages != null
                        ? UserChatLayout(chatId: chatPod.chatId!)
                        : const Center(child: CircularProgressIndicator())),
          ],
        );
      },
    );
  }
}
