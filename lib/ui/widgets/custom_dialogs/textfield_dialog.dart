import 'package:flutter/material.dart';


class TextFormDialog extends StatelessWidget {
  const TextFormDialog({
    Key? key,
    required this.controller,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  final TextEditingController controller;
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
              child: TextFormField(
                controller: controller,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                key: const Key('OkExitErrorButton'),
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
