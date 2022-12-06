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
      // color: AppColor.colorFFFFFF,
      child: GroupedListView<MessageModel, DateTime>(
        padding: const EdgeInsets.all(10),
        elements: widget.messages,
        reverse: true,
        order: GroupedListOrder.DESC,
        floatingHeader: true,
        groupBy: (message) => DateTime(
          message.date.year,
          message.date.month,
          message.date.day,
        ),
        groupHeaderBuilder: (MessageModel message) =>
            _TimeCard(message: message),
        itemBuilder: (context, MessageModel message) {
          if (message.isSentByMe == false) {
            print(message.isSentByMe);
            print(message.message);
            return _OtherMessageCard(
              message: message.message,
            );
          } else {
            return MyMessageCard(message: message.message);
          }
        },
      ),
    );
  }
}
