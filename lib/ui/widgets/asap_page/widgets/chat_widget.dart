import 'dart:developer';

import '../../../../src/libraries/library_all.dart';
import '../../library/library_widgets.dart';
import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';

class ChatWidget extends StatefulWidget {
  const ChatWidget({
    Key? key,
    required this.messages,
    required this.textController,
  }) : super(key: key);

  final List<MessageDto> messages;
  final TextEditingController textController;

  @override
  State<ChatWidget> createState() => ChatWidgetState();
}

class ChatWidgetState extends State<ChatWidget> {
  ScrollController scrollController = ScrollController();

  scrollToLastMessage() {
    scrollController.jumpTo(scrollController.position.minScrollExtent);
    // print(scrollController.offset);
  }

  @override
  void initState() {
    scrollController.addListener(() {
      log(scrollController.offset.toString());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:
          //  scrollController.offset > 50?
          AnimatedSize(
        duration: const Duration(milliseconds: 400),
        curve: Curves.slowMiddle,
        child: SizedBox(
          // height: 45,
          // width: 45,
          child: FloatingActionButton(
            onPressed: () {
              scrollToLastMessage();
            },
            tooltip: 'Scroll to last message',
            mini: true,
            backgroundColor: Colors.white.withOpacity(0.6),
            child: Icon(
              Icons.keyboard_arrow_down_rounded,
              color: Colors.black.withOpacity(0.8),
            ),
          ),
        ),
      ),
      // : const SizedBox.shrink(),
      body: GroupedListView<MessageDto, int>(
        controller: scrollController,
        padding: const EdgeInsets.all(10),
        elements: widget.messages,
        reverse: true,
        floatingHeader: true,
        groupBy: (message) => message.localMessageId!,
        groupHeaderBuilder: (MessageDto message) =>
            TimeCardWidget(date: message.createdDate),
        groupComparator: (value1, value2) => value2,
        itemBuilder: (context, MessageDto message) {
          if (message.localSendId == 2) {
            // print(message.isSentByMe);
            // print(message.message);
            return OtherMessageCardWidget(
              message: message.content,
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
    scrollController.dispose();
    super.dispose();
  }
}
