import 'package:chat_app/modules/storage_manager/db_helper/user_path.dart';

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
            TimeCardWidget(date: message.createdDate!),
        groupComparator: (value1, value2) => value2,
        itemBuilder: (context, MessageDto message) {
          if (!checkSender(message.senderId)) {
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

  bool checkSender(int id) => id == UserPref.getUserId ? true : false;
}
