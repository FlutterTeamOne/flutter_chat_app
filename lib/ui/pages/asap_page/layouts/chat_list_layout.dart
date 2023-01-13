import 'dart:async';
import 'package:chat_app/modules/client/custom_exception.dart';
import 'package:chat_app/modules/signal_service/river/river.dart';
import 'package:chat_app/modules/storage_manager/db_helper/db_helper_start.dart';
import 'package:chat_app/src/generated/chats/chats.pbgrpc.dart';
import 'package:chat_app/src/generated/grpc_lib/grpc_message_lib.dart';
import 'package:chat_app/src/generated/users/users.pbgrpc.dart';
import 'package:chat_app/ui/widgets/asap_page/widgets/add_chat_dialog_widget.dart';
import 'package:chat_app/ui/widgets/asap_page/widgets/search_field.dart';
import 'package:chat_app/ui/widgets/custom_dialogs/error_dialog.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../modules/storage_manager/db_helper/user_path.dart';
import '../../../widgets/library/library_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../src/libraries/library_all.dart';

class ChatListLayout extends StatefulWidget {
  final List<MessageDto> messageModel;

  const ChatListLayout({super.key, required this.messageModel});

  @override
  State<ChatListLayout> createState() => _ChatListLayoutState();
}

class _ChatListLayoutState extends State<ChatListLayout> {
  final _searchController = TextEditingController();

  bool _isLoading = false;

  void _loadScreen() async {
    setState(() {
      _isLoading = true;
    });
    await Future.delayed(const Duration(milliseconds: 1000));
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    var grpcClient = GrpcClient();
    return Drawer(
      width: 300,
      elevation: 0,
      child: Consumer(builder: (context, ref, child) {
        var users = ref.watch(River.userPod).users;
        var chatModel = ref.watch(River.chatPod).chats;
        return Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              chatModel == null || chatModel.isEmpty || users == null
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
                              itemCount: chatModel.length,
                              physics: const BouncingScrollPhysics(),
                              shrinkWrap: true,
                              separatorBuilder: (context, index) =>
                                  const SizedBox(height: 25),
                              itemBuilder: (context, index) {
                                UserDto friend = users.firstWhere((user) =>
                                    chatModel[index].userIdChat == user.userId);
                                MessageDto lastMessage = MessageDto(
                                    chatId: 0, senderId: 0, content: '');
                                for (var i in widget.messageModel) {
                                  if (i.chatId == chatModel[index].chatId) {
                                    lastMessage = i;
                                  }
                                }
                                return UserCardWidget(
                                    sender: lastMessage.chatId == 0
                                        ? ""
                                        : !checkSender(lastMessage.senderId)
                                            ? friend.name
                                            : 'You',
                                    // checkSender(widget.messageModel[lastMessageId].senderId),
                                    // ? userBloc.state.users[index].name:'You'),
                                    selected: false,
                                    onTap: () {
                                      //TODO: GetChatId => SetChatId
                                      ref
                                          .watch(River.chatPod.notifier)
                                          .getChatId(chatModel[index].chatId!);
                                    },
                                    name: chatModel[index].userIdChat ==
                                            UserPref.getUserId
                                        ? "My favorite chat"
                                        : friend.name,
                                    image: friend.profilePicLink,
                                    updatedDate: getUpdateDate(
                                        chatModel[index].updatedDate),
                                    message: lastMessage.chatId != 0
                                        ? lastMessage.contentType ==
                                                ContentType.isText
                                            ? lastMessage.content
                                            : 'Image msg'
                                        : 'Start chating');
                              },
                            )
                          ],
                        ),
                      ),
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
                                  (AddChatDialogWidget(val: value)))
                          .then((value) async {
                        //FriendId Validation
                        if (value == null) {
                          return;
                        }
                        GetUserResponse userFromServerDb;
                        try {
                          userFromServerDb =
                              await grpcClient.getUser(userId: value);
                          print("BEFORE REST");
                          final chatId = await ref
                              .read(River.chatPod.notifier)
                              .createChat(
                                ChatDto(
                                  userIdChat: value,
                                  createdDate: DateTime.now().toIso8601String(),
                                  updatedDate: DateTime.now().toIso8601String(),
                                ),
                              );
                          ref.read(River.chatPod.notifier).getChatId(chatId);
                        } on CustomException catch (e) {
                          print('GET USER RESPONSE ERROR: $e');
                          String textContent = e.message == 'null'
                              ? "Rest Server Not Found"
                              : e.message;
                          await showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return ErrorDialog(
                                  textTitle: 'Error',
                                  textContent: textContent,
                                );
                              });
                        }
                      });
                      // .whenComplete(() async {
                      //     await showDialog(
                      //       barrierDismissible: false,
                      //       context: context,
                      //       builder: (context) {
                      //         return Dialog(
                      //           backgroundColor:
                      //               Theme.of(context).backgroundColor,
                      //           child: const Padding(
                      //             padding: EdgeInsets.all(8.0),
                      //             child: Center(
                      //               child: CircularProgressIndicator(),
                      //             ),
                      //           ),
                      //         );
                      //       },
                      //     ).timeout(const Duration(seconds: 2),
                      //         onTimeout: () => Navigator.pop(context, 'OK'));

                      // await Future.delayed(const Duration(seconds: 2));
                      // Navigator.pop(context, 'OK');
                      // });
                    },
                    icon: const Icon(Icons.add),
                    label: const Text('Add Chat'),
                  ),
                ),
              ),
            ]);
      }),
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
