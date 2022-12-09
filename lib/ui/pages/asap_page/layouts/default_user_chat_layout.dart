import 'package:flutter/material.dart';

class DefaultUserChatLayout extends StatelessWidget {
  const DefaultUserChatLayout();

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
      child: Container(
        color: Theme.of(context).colorScheme.background,
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
      ),
    );
  }
}
