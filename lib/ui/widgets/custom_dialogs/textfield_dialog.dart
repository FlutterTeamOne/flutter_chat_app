import 'package:chat_app/modules/signal_service/river/user_ref/user_notifier.dart';
import 'package:flutter/material.dart';

import '../../../domain/data/library/library_data.dart';

class TextFieldDialog extends StatelessWidget {
  const TextFieldDialog({
    Key? key,
    required this.controller,
    required this.userMain,
    required this.userPod,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  final TextEditingController controller;
  final UserDto userMain;
  final UserNotifier userPod;
  final String text;
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: SizedBox(
        height: 150,
        width: 300,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(text),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: controller,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                )),
                onPressed: onPressed,
                child: const Icon(Icons.check),
              ),
            )
          ],
        ),
      ),
    );
  }
}
