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
    return BlocConsumer<MessageBloc, MessageState>(
      listener: (context, messageState) {
        // TODO: implement listener
      },
      builder: (context, messageState) {
        return BlocConsumer<ChatBloc, ChatState>(
          listener: (context, chatState) {
            // TODO: implement listener
          },
          builder: (context, chatState) {
            return Row(
              children: [
                // Список чатов
                Expanded(
                    child: chatState.chats == null
                        ? Text('Sorry')
                        : ChatListLayout(
                            chatModel: chatState.chats!,
                            messageModel: messageState.messages!)),
                // Чат
                Expanded(
                    flex: 3,
                    child: chatState.chatId == null
                        ? DefaultUserChatLayout()
                        : UserChatLayout(
                            chatId: chatState.chatId!,
                            localChatId: chatState.localChatId!)),
                // Профиль
                // Expanded(
                //   flex: 2,
                //   child: Container(
                //     height: MediaQuery.of(context).size.height,
                //     width: MediaQuery.of(context).size.width,
                //     decoration: BoxDecoration(
                //       color: AppColor.colorFFFFFF,
                //       border: Border.all(
                //         color: AppColor.color9E9E9E.withOpacity(0.5),
                //       ),
                //     ),
                //     child: Text(
                //       'профиль',
                //       style: AppTextStyle.s36Abel,
                //     ),
                //   ),
                // ),
              ],
            );
          },
        );
      },
    );
  }
}
