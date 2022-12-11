import 'package:chat_app/src/libraries/library_all.dart';
import 'package:chat_app/ui/widgets/library/library_widgets.dart';
import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';

class ChatWidget extends StatefulWidget {
  const ChatWidget({
    Key? key,
    required this.messages,
  }) : super(key: key);

  final List<MessageDto> messages;

  @override
  State<ChatWidget> createState() => ChatWidgetState();
}

class ChatWidgetState extends State<ChatWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Theme.of(context).colorScheme.secondary,
      // decoration: BoxDecoration(
      //     border: Border(
      //         left: BorderSide(
      //             width: 1,
      //         color: Theme.of(context).dividerColor
      //         ))),
      child: GroupedListView<MessageDto, DateTime>(
        padding: const EdgeInsets.all(10),
        elements: widget.messages,
        reverse: true,
        order: GroupedListOrder.DESC,
        floatingHeader: true,
        groupBy: (message) => DateTime.parse(message.date),
        groupHeaderBuilder: (MessageDto message) =>
            TimeCardWidget(date: message.date),
        itemBuilder: (context, MessageDto message) {
          if (message.localSendId == 0) {
            // print(message.isSentByMe);
            // print(message.message);
            return OtherMessageCardWidget(
              message: message.date,
            );
          } else {
            return MyMessageCardWidget(
                message: message.content, isSuccess: message.isWrittenToDb);
          }
        },
      ),
    );
  }
}
