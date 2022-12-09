﻿import 'package:chat_app/ui/widgets/library/library_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../src/libraries/library_all.dart';

class ChatListLayout extends StatefulWidget {
  const ChatListLayout({
    Key? key,
    required this.chatModel,
    required this.messageModel,
  }) : super(key: key);

  final List<ChatDto> chatModel;
  final List<MessageDto> messageModel;
  @override
  State<ChatListLayout> createState() => _ChatListLayoutState();
}

class _ChatListLayoutState extends State<ChatListLayout> {
  final _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: AppColor.colorFFFFFF,
        shape: Border.all(
          color: AppColor.color9E9E9E.withOpacity(0.5),
        ),
        elevation: 0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            widget.chatModel.isEmpty || widget.chatModel == []
                ? const Center(
                    child: Text('Oops...\nno chats'),
                  )
                : SingleChildScrollView(
                    child: Column(
                      children: [
                        SearchFieldWidget(controller: _searchController),
                        const SizedBox(height: 5),
                        ListView.separated(
                          itemCount: widget.chatModel.length,
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 25),
                          itemBuilder: (context, index) {
                            var friendId = widget.chatModel[index].friendId - 1;
                            var lastMessageId = widget.messageModel.isEmpty
                                ? 0
                                : widget.messageModel.length - 1;
                            return UserCardWidget(
                              selected: false,
                              onTap: () {
                                context.read<ChatBloc>().add(GetChatIdEvent(
                                    friendId,
                                    widget.chatModel[index].localChatId));
                              },
                              name: context
                                  .read<UserBloc>()
                                  .state
                                  .users![friendId]
                                  .name,
                              image: context
                                  .read<UserBloc>()
                                  .state
                                  .users![friendId]
                                  .profilePicLink,
                              message: widget.messageModel.isNotEmpty
                                  ? widget.messageModel[lastMessageId].content
                                  : '',
                            );
                          },
                        )
                      ],
                    ),
                  ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton.icon(
                onPressed:
                    () {}, //=>context.read<ChatBloc>().add(CreateChatEvent(
                //chat: ChatModel(
                //localChatId: 1, chatIdMain: 2, friendId: 2),
                // )),
                icon: const Icon(Icons.add),
                label: const Text('Add Chat'),
              ),
            )
          ],
        ));
  }
}