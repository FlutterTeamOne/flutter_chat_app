part of '../asap_page.dart';

class _Chat extends StatefulWidget {
  const _Chat({
    Key? key,
    required this.messages,
  }) : super(key: key);

  final List<MessageModel> messages;

  @override
  State<_Chat> createState() => _ChatState();
}

class _ChatState extends State<_Chat> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.colorFFFFFF,
      child: GroupedListView<MessageModel, DateTime>(
        padding: const EdgeInsets.all(10),
        elements: widget.messages,
        reverse: true,
        order: GroupedListOrder.DESC,
        floatingHeader: true,
        groupBy: (message) => DateTime.parse(message.date),
        groupHeaderBuilder: (MessageModel message) =>
            _TimeCard(date: message.date),
        itemBuilder: (context, MessageModel message) {
          if (message.localSendId == 1) {
            // print(message.isSentByMe);
            // print(message.message);
            return _OtherMessageCard(
              message: message.date,
            );
          } else {
            return MyMessageCard(message: message.content);
          }
        },
      ),
    );
  }
}
