part of '../asap_page.dart';

class _UserChatLayout extends StatefulWidget {
  const _UserChatLayout({
    Key? key,
  }) : super(key: key);

  @override
  State<_UserChatLayout> createState() => _UserChatLayoutState();
}

class _UserChatLayoutState extends State<_UserChatLayout> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    List<MessageModel> messages = [
      MessageModel(
        message: 'Привет, это я Руслан',
        date: DateTime.now().subtract(const Duration(minutes: 1)),
        isSentByMe: false,
      ),
      MessageModel(
        message: 'О привет, как ты поживешь?',
        date: DateTime.now().subtract(const Duration(minutes: 1)),
        isSentByMe: true,
      ),
      MessageModel(
        message: 'Все хорошо',
        date: DateTime.now().subtract(const Duration(minutes: 1)),
        isSentByMe: false,
      ),
      MessageModel(
        message: 'Пока',
        date: DateTime.now().subtract(const Duration(minutes: 1)),
        isSentByMe: true,
      ),
    ]..toList();
    return Column(
      children: [
        const _ChatAppBar(
          image:
              'https://music.mathwatha.com/wp-content/uploads/2017/08/tonyprofile-300x300.jpg',
          name: 'Tony',
        ),
        Expanded(
          child: _Chat(messages: [...messages]),
        ),
        _TextInput(
          onSubmitted: (text) {
            if (controller.text.isNotEmpty) {
              final message = MessageModel(
                message: controller.text,
                date: DateTime.now(),
                isSentByMe: true,
              );
              setState(() => messages.add(message));
              print(controller.text);
              controller.clear();
            } else {
              return null;
            }
          },
          controller: controller,
          onTap: () {
            // if (controller.text.isNotEmpty) {
            //   final message = MessageModel(
            //     message: controller.text,
            //     date: DateTime.now(),
            //     isSentByMe: true,
            //   );
            //   setState(() => messages.add(message));
            //   print(controller.text);
            //   controller.clear();
            // } else {
            //   return null;
            // }
          },
        ),
      ],
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
