import 'package:flutter/material.dart';

class ErrorDialog extends StatelessWidget {
  const ErrorDialog(
      {Key? key,
      required this.textTitle,
      required this.textContent,
      this.onPressed})
      : super(key: key);

  final String textTitle;
  final String textContent;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(textTitle),
      content: Text(textContent),
      actions: [
        TextButton(
            onPressed: onPressed ?? () => Navigator.pop(context, 'OK'),
            child: const Text('OK'))
      ],
    );
  }
}
