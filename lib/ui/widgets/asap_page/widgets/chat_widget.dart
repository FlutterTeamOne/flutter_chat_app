import '../../../../src/libraries/library_all.dart';
import '../../library/library_widgets.dart';
import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import '../scroll_down_button.dart';

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
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      floatingActionButton: ValueListenableBuilder(
        valueListenable: _btSize,
        builder: (context, value, child) => ScrollDownButton(
          onTap: () {
            scrollController.animateTo(
                curve: Curves.decelerate,
                duration: const Duration(milliseconds: 800),
                scrollController.position.minScrollExtent);
          },
          buttonSize: _btSize.value,
          iconSize: _icSize,
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
}
