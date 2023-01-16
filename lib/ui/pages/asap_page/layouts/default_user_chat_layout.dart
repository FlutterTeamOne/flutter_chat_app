﻿import 'package:flutter/material.dart';

class DefaultUserChatLayout extends StatelessWidget {
  const DefaultUserChatLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          left: BorderSide.none,
          right: BorderSide.none,
          bottom: BorderSide.none,
          top: BorderSide.none,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'Send and receive messages. Choose a chat to write a message.',
            ),
          ],
        ),
      ),
    );
  }
}
