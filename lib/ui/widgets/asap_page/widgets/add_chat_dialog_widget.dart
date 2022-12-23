import 'package:flutter/material.dart';

class AddChatDialogWidget extends StatefulWidget {
  const AddChatDialogWidget({super.key});

  @override
  State<AddChatDialogWidget> createState() => _AddChatDialogWidgetState();
}

class _AddChatDialogWidgetState extends State<AddChatDialogWidget> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actionsAlignment: MainAxisAlignment.center,
      title: const Text('Add Chat'),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
      content: SizedBox(
        width: 500,
        height: 500,
        child: Column(children: [
          const Text('Friend Id'),
          const SizedBox(
            height: 8,
          ),
          TextField(),
          const SizedBox(
            height: 32,
          ),
          ElevatedButton(onPressed: () {}, child: const Text('Add')),
        ]),
      ),
    );
  }
}
