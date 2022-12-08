part of '../asap_page.dart';

class _DefaultUserChatLayout extends StatelessWidget {
  const _DefaultUserChatLayout();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide.none,
          right: BorderSide(),
          bottom: BorderSide(),
          top: BorderSide(),
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Sfera'.toUpperCase(),
            ),
            Text(
              'Send and receive messages. Choose a chat to write a message.',
            ),
          ],
        ),
      ),
    );
  }
}
