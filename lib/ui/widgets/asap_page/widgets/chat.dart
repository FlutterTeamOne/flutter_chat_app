import '../../../../src/libraries/library_all.dart';
import '../../library/library_widgets.dart';
import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';

class ChatWidget extends StatefulWidget {
  ChatWidget({
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
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: AppColor.colorFFFFFF,
      child: GroupedListView<MessageDto, int>(
        padding: const EdgeInsets.all(10),
        elements: widget.messages,
        reverse: true,
        floatingHeader: true,
        groupBy: (message) => message.localMessageId!,
        groupHeaderBuilder: (MessageDto message) =>
            TimeCardWidget(date: message.date),
        groupComparator: (value1, value2) => value2,
        itemBuilder: (context, MessageDto message) {
          if (message.localSendId == 0) {
            // print(message.isSentByMe);
            // print(message.message);
            return OtherMessageCardWidget(
              message: message.date,
            );
          } else {
            return MyMessageCardWidget(
              message: message,
              isSuccess: message.isWrittenToDb,
              textController: widget.textController,
            );
          }
        },
      ),
    );
  }
}
