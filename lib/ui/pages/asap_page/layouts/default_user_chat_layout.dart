import 'package:flutter/material.dart';

class DefaultUserChatLayout extends StatelessWidget {
  const DefaultUserChatLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
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
            const Text(
              'Send and receive messages. Choose a chat to write a message.',
            ),
          ],
        ),
      ),
    );
  }
}
