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
  double _bSize = 0;
  double _iSize = 0;

  @override
  void initState() {
    scrollController.addListener(() {
      if (scrollController.offset >= 350) {
        _bSize = 20;
        _iSize = 24;
        // setState(() {});
      } else {
        _bSize = 0;
        _iSize = 0;
        // setState(() {});
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      floatingActionButton: AnimatedSize(
        duration: const Duration(milliseconds: 500),
        reverseDuration: const Duration(milliseconds: 500),
        child: InkWell(
          borderRadius: BorderRadius.circular(100),
          onTap: () {
            scrollController.jumpTo(scrollController.position.minScrollExtent);
          },
          child: CircleAvatar(
            backgroundColor: Colors.white.withOpacity(0.6),
            radius: _bSize,
            child: Icon(
              Icons.keyboard_arrow_down_rounded,
              size: _iSize,
              color: Colors.black.withOpacity(0.8),
            ),
          ),
        ),
      ),
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
            print(scrollController.offset);
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
