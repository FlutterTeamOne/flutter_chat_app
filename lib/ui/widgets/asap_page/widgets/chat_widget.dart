﻿import '../../../../modules/storage_manager/db_helper/user_path.dart';

import '../../../../src/libraries/library_all.dart';
import '../../library/library_widgets.dart';
import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import '../scroll_down_button.dart';

class ChatWidget extends StatefulWidget {
  const ChatWidget({
    Key? key,
    required this.messages,
    required this.chatId,
    required this.textController,
    required this.deletedUser
  }) : super(key: key);

  final List<MessageDto> messages;
  final int chatId;
  final TextEditingController textController;
  final String? deletedUser;

  @override
  State<ChatWidget> createState() => ChatWidgetState();
}

final _btSize = ValueNotifier<double>(0);
double _icSize = 0;
ScrollController scrollController = ScrollController();

class ChatWidgetState extends State<ChatWidget> {
  @override
  void initState() {
    scrollController.addListener(
      () {
        if (scrollController.offset >= 350) {
          _btSize.value = 20;
          _icSize = 24;
        } else {
          _btSize.value = 0;
          _icSize = 0;
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var messages = <MessageDto>[];

    for (var i in widget.messages) {
      if (i.chatId == widget.chatId) {
        messages.add(i);
      }
      messages.sort(((a, b) => a.createdDate!.compareTo(b.createdDate!)));
    }

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      floatingActionButton: ValueListenableBuilder(
        valueListenable: _btSize,
        builder: (context, value, child) => ScrollDownButton(
          onTap: () {
            scrollController.animateTo(
                curve: Curves.decelerate,
                duration: const Duration(milliseconds: 400),
                scrollController.position.minScrollExtent);
          },
          buttonSize: _btSize.value,
          iconSize: _icSize,
        ),
      ),
      body: messages.isEmpty
          ?  Center(child: Text(widget.deletedUser!.isEmpty || widget.deletedUser ==null?'Start chatting':'Oops This user has deleted their account'))
          : GroupedListView<MessageDto, DateTime>(
              controller: scrollController,
              padding: const EdgeInsets.all(10),
              elements: messages,
              reverse: true,
              order: GroupedListOrder.DESC,
              groupBy: (message) {
                final date = DateTime.parse(message.createdDate!);
                // DateTime(date.year, date.month, date.day, date.hour, date.minute, date.second, date.microsecond);
                return DateTime(date.year, date.month, date.day);
              },
              groupHeaderBuilder: (MessageDto message) =>
                  TimeCardWidget(date: message.createdDate!),
              // TODO: нужна сортировка сообщений внутри группы по дате
              itemBuilder: (context, MessageDto message) {
                if (!checkSender(message.senderId)) {
                  // print(message.isSentByMe);
                  // print(message.message);
                  return OtherMessageCardWidget(
                    message: message,
                  );
                } else {
                  return MyMessageCardWidget(
                    message: message,
                    isSuccess: message.messageId,
                    textController: widget.textController,
                  );
                }
              },
            ),
    );
  }

  @override
  void dispose() {
    scrollController.removeListener;
    super.dispose();
  }

  bool checkSender(int id) => id == UserPref.getUserId ? true : false;
}
