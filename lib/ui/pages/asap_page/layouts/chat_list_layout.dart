import 'dart:async';

import 'package:chat_app/modules/storage_manager/db_helper/db_helper_start.dart';
import 'package:chat_app/src/generated/chats/chats.pbgrpc.dart';
import 'package:chat_app/src/generated/users/users.pbgrpc.dart';
import 'package:chat_app/ui/widgets/asap_page/widgets/add_chat_dialog_widget.dart';
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
    final chatBloc = context.watch<ChatBloc>();
    final userBloc = context.watch<UserBloc>();
    final grpcClient = GrpcClient();
    final localUserServices = LocalUsersServices();
    return Drawer(
      // shape: Border(
      //     right: BorderSide(width: 1, color: Theme.of(context).dividerColor)),
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
                                friend = context
                                    .read<UserBloc>()
                                    .state
                                    .users!
                                    .firstWhere((user) {
                                  return user.userId ==
                                      widget.chatModel[index].userIdChat;
                                });
                                var lastMessage = MessageDto(
                                    chatId: 0, senderId: 0, content: '');
                                for (var i in widget.messageModel) {
                                  if (i.chatId ==
                                      widget.chatModel[index].chatId) {
                                    lastMessage = i;
                                  }
                                }
                                // var lastMessageId = widget.chatModel.
                                // : widget.messageModel.length - 1;
                                return UserCardWidget(
                                  updatedDate: getUpdateDate(
                                      widget.chatModel[index].updatedDate),
                                  sender: !checkSender(lastMessage.senderId)
                                      ? userBloc.state.users![index].name
                                      : 'You',
                                  // checkSender(widget.messageModel[lastMessageId].senderId),
                                  // ? userBloc.state.users[index].name:'You'),
                                  selected: false,
                                  onTap: () {
                                    //TODO: GetChatId => SetChatId
                                    context.read<ChatBloc>().add(GetChatIdEvent(
                                        widget.chatModel[index].chatId!));
                                  },
                                  name: friend.name,
                                  image: friend.profilePicLink,

                                  message: lastMessage.chatId != 0
                                      ? lastMessage.content
                                      : 'Start chating',
                                );
                              },
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                child: ElevatedButton.icon(
                                  onPressed: () async {
                                    int value = 0;
                                    await showDialog(
                                            context: context,
                                            builder: (BuildContext context) =>
                                                (AddChatDialogWidget(
                                                    val: value)))
                                        .then((value) async {
                                      print('FriendId From Add Dialog: $value');
                                      print(
                                          'Current UserId: ${UserPref.getUserId}');
                                      //FriendId Validation
                                      var userFromServerDb = await grpcClient
                                          .getUser(userId: value);
                                      if (userFromServerDb.toString().isEmpty) {
                                        await showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                title: const Text('Ошибка'),
                                                content: const Text(
                                                    'Нет юзера с таким Id'),
                                                actions: [
                                                  TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              context, 'OK'),
                                                      child: const Text('OK'))
                                                ],
                                              );
                                            });
                                        print(
                                            'no id in server db: ${userFromServerDb.toString()}');
                                      } else {
                                        try {
                                          context.read<ChatBloc>().add(
                                                CreateChatEvent(
                                                  chat: ChatDto(
                                                    userIdChat: value,
                                                    createdDate: DateTime.now()
                                                        .toIso8601String(),
                                                    updatedDate: DateTime.now()
                                                        .toIso8601String(),
                                                  ),
                                                ),
                                              );
                                          Future.delayed(Duration(seconds: 1));
                                        } catch (e) {
                                          print('ADD CHAT e: $e');
                                        }
                                      }
                                    });
                                  },
                                  icon: Icon(Icons.add),
                                  label: Text('Add Chat'),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
            ]),
      ),
    );
  }

  bool checkSender(int id) => id == UserPref.getUserId ? true : false;

  getUpdateDate(String updateDate) {
    var updatedDate = DateTime.parse(updateDate);
    //день
    var today = DateTime.now().day;
    //время
    var correctMinute = updatedDate.minute.toString().length == 1
        ? '0${updatedDate.minute}'
        : updatedDate.minute;
    String? realTime = '${updatedDate.hour}:$correctMinute';
    //месяц
    List<String> months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];
    int monthNow = updatedDate.month - 1;
    //год
    var thisYear = DateTime.now().year;
    var correctUpdatedDate = updatedDate.day != today
        ? '${months[monthNow]} ${updatedDate.day}'
        : updatedDate.year != thisYear
            ? '${updatedDate.year} ${months[monthNow]} ${updatedDate.day}'
            : realTime;
    return correctUpdatedDate;
  }
}
