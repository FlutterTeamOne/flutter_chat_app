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
    context.read<ChatBloc>().add(ReadChatEvent());
    context.read<MessageBloc>().add(ReadMessageEvent());
    print("ChatBloc: ${context.read<ChatBloc>().state.chats}");
    print("MessageBloc: ${context.read<MessageBloc>().state.messages}");
    // TODO: implement listener
    return BlocConsumer<ChatBloc, ChatState>(
        listener: (context, chatState) {},
        builder: (context, chatState) {
          return BlocConsumer<MessageBloc, MessageState>(
            listener: (context, messageState) {},
            builder: (context, messageState) {
              print("chatState: ${chatState.chats}");
              print("messageState: ${messageState.messages}");
              
              return Row(
                children: [
                  // Список чатов
                  Expanded(
                      child: chatState.chats == null
                          ? const Text('Sorry')
                          : messageState.messages != null
                              ? ChatListLayout(
                                  chatModel:
                                      context.watch<ChatBloc>().state.chats!,
                                  messageModel: messageState.messages!)
                              : const Center(
                                  child: CircularProgressIndicator(),
                                )),
                  // Чат
                  Expanded(
                      flex: 3,
                      child: chatState.chatId == null || chatState.chatId == -1
                          ? const DefaultUserChatLayout()
                          : messageState.messages != null
                              ? UserChatLayout(chatId: chatState.chatId!)
                              : const Center(
                                  child: CircularProgressIndicator())),
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
        });
  }
}
