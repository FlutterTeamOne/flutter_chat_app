import 'package:chat_app/ui/widgets/asap_page/widgets/search_field.dart';

import '../../../../modules/storage_manager/db_helper/user_path.dart';
import '../../../widgets/library/library_widgets.dart';
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
    final chatBloc = context.read<ChatBloc>();
    final userBloc = context.read<UserBloc>();
    return Drawer(
        shape: Border(
            right: BorderSide(width: 1, color: Theme.of(context).dividerColor)),
        elevation: 0,
        child: Flexible(
          flex: 1,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              widget.chatModel.isEmpty || widget.chatModel == []
                  ? const Center(
                      child: Text('Oops...\nno chats'),
                    )
                  : Expanded(
                    flex: 1,
                    child: SingleChildScrollView(
                      child: Column(
                          children: [
                            SearchFieldWidget(controller: _searchController),
                            const SizedBox(height: 5),
                            ListView.separated(
                              itemCount: widget.chatModel.length,
                              physics: const BouncingScrollPhysics(),
                              shrinkWrap: true,
                              separatorBuilder: (context, index) =>
                                  const SizedBox(height: 25),
                              itemBuilder: (context, index) {
                                var friend;
                                for (var user
                                    in context.read<UserBloc>().state.users!) {
                                  if (user.userId ==
                                      widget.chatModel[index].userIdChat) {
                                    friend = user;
                                    break;
                                  }
                                }
                                var lastMessage = MessageDto(chatId: 0, senderId: 0, content: '');
                                for (var i in widget.messageModel) {
                                  if (i.chatId == widget.chatModel[index].chatId) {
                                    lastMessage = i;
                                  }
                                }
                                // var lastMessageId = widget.chatModel.
                                    // : widget.messageModel.length - 1;
                                return UserCardWidget(
                                  sender: !checkSender(lastMessage.senderId)
                                      ? userBloc.state.users![index].name
                                      : 'You',
                                  // checkSender(widget.messageModel[lastMessageId].senderId),
                                  // ? userBloc.state.users[index].name:'You'),
                                  selected: false,
                                  onTap: () {
                                    //TODO: GetChatId => SetChatId
                                    context.read<ChatBloc>().add(GetChatIdEvent(
                                        widget.chatModel[index].chatId));
                                  },
                                  name: friend.name,
                                  image: friend.profilePicLink,
                              
                                  message: lastMessage.chatId != 0
                                      ? lastMessage.content
                                      : 'Start chating',
                                );
                              },
                            )
                          ],
                        ),
                    ),
                  ),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    // decoration: BoxDecoration(
                    //   borderRadius: BorderRadius.circular(50)
                    // ),
                    child: ElevatedButton.icon(
                      onPressed:
                          () {}, //=>context.read<ChatBloc>().add(CreateChatEvent(
                      //chat: ChatModel(
                      //localChatId: 1, chatIdMain: 2, friendId: 2),
                      // )),
                      icon: Icon(Icons.add),
                      label: Text('Add Chat'),
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      )),
                    ),
                  ))
            ],
          ),
        )
      );
  }

  bool checkSender(int id) => id == UserPref.getUserId ? true : false;
}
