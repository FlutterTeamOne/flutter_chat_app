// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../src/libraries/library_all.dart';

class AddChatDialogWidget extends StatefulWidget {
  int val;
  AddChatDialogWidget({
    Key? key,
    required this.val,
  }) : super(key: key);

  @override
  State<AddChatDialogWidget> createState() => _AddChatDialogWidgetState();
}

class _AddChatDialogWidgetState extends State<AddChatDialogWidget> {
  var _friendIdFieldController = TextEditingController();
  var _friendId;

  void _updateText() {
    setState(() {
      _friendId = _friendIdFieldController.text;
    });
  }

  @override
  void initState() {
    super.initState();
    _friendIdFieldController.addListener(() {
      _updateText();
    });
  }

  @override
  void dispose() {
    _friendIdFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actionsAlignment: MainAxisAlignment.center,
      title: const Text('Add Chat'),
      content: SizedBox(
        width: 500,
        height: 500,
        child: Column(children: [
          Text('Friend Id: ${_friendIdFieldController.text}'),
          const SizedBox(
            height: 8,
          ),
          TextField(
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
            ],
            maxLines: 1,
            controller: _friendIdFieldController,
            decoration: const InputDecoration(
                prefixIcon: Icon(Icons.person),
                hintText: 'Enter your friend ID'),
          ),
          const SizedBox(
            height: 32,
          ),
          ElevatedButton(
              onPressed: () async {
                widget.val = int.tryParse(_friendId)!;
                Navigator.pop(context, widget.val);
              },
              child: const Text('Add')),
        ]),
      ),
    );
  }
}
