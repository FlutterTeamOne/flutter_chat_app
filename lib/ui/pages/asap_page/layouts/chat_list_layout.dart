import 'package:chat_app/modules/client/custom_exception.dart';
import 'package:chat_app/modules/signal_service/river/river.dart';
import 'package:chat_app/src/generated/grpc_lib/grpc_message_lib.dart';
import 'package:chat_app/src/generated/users/users.pbgrpc.dart';
import 'package:chat_app/ui/widgets/asap_page/widgets/add_chat_dialog_widget.dart';
import 'package:chat_app/ui/widgets/asap_page/widgets/search_field.dart';
import 'package:chat_app/ui/widgets/custom_dialogs/error_dialog.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import '../../../../modules/storage_manager/db_helper/user_path.dart';
import '../../../widgets/library/library_widgets.dart';
import 'package:flutter/material.dart';
import '../../../../src/libraries/library_all.dart';

class ChatListLayout extends StatefulWidget {
  final List<MessageDto> messageModel;

  const ChatListLayout({super.key, required this.messageModel});

  @override
  State<ChatListLayout> createState() => _ChatListLayoutState();
}

class _ChatListLayoutState extends State<ChatListLayout> {
  final _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                                  key: Key('userCardWidget $index'),
                                  sender: lastMessage.chatId == 0
                                      ? ""
                                      : !checkSender(lastMessage.senderId)
                                          ? friend.name
                                          : 'You',
                                  // checkSender(widget.messageModel[lastMessageId].senderId),
                                  // ? userBloc.state.users[index].name:'You'),
                                  selected: false,
                                  onTap: () {
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
                                      : 'Start chating',
                                  isSuccess: lastMessage.messageId,
                                );
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
                        if (value == null) {
                          return;
                        }
                        try {
                          await ref
                              .read(River.userPod.notifier)
                              .getUserFromServer(userId: value);
                          Logger().v("BEFORE REST");
                          final String date = DateTime.now().toIso8601String();
                          final chatId =
                              await ref.read(River.chatPod.notifier).createChat(
                                    ChatDto(
                                      userIdChat: value,
                                      createdDate: date,
                                      updatedDate: date,
                                    ),
                                  );
                          ref.read(River.chatPod.notifier).getChatId(chatId);
                        } on CustomException catch (e) {
                          Logger().e('GET USER RESPONSE ERROR: $e');
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
