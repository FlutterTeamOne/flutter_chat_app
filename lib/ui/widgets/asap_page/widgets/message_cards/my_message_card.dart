import 'package:chat_app/src/libraries/library_all.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../library/library_widgets.dart';
import 'package:flutter/material.dart';

class MyMessageCardWidget extends StatelessWidget {
  const MyMessageCardWidget({
    super.key,
    this.isSuccess = 1,
    required this.message,
    required this.textController,
  });

  final MessageDto message;
  final int isSuccess;
  final TextEditingController textController;

  @override
  Widget build(BuildContext context) {
    var items = [
      PopupMenuItem(
        onTap: () {
          textController.text = message.content;
          // setState(() {
          //   widget.isEditing = true;
          // });
          context.read<MessageBloc>().add(UpdateMessageEvent(
              messageId: message.localMessageId,
              isEditing: EditState.isPreparation));

          // print('IS EDITING: ${context.read<MessageBloc>().isEditing}');
          Navigator.of(context).pop();
        },
        mouseCursor: MouseCursor.uncontrolled,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        height: 38,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Edit', style: Theme.of(context).textTheme.bodyMedium),
            const Icon(Icons.edit, size: 18),
          ],
        ),
      ),
      PopupMenuItem(
        onTap: () {
          context.read<MessageBloc>().add(
                DeleteMessageEvent(messageId: message.localMessageId!),
              );
          Navigator.of(context).pop();
        },
        mouseCursor: MouseCursor.uncontrolled,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        height: 38,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Delete', style: Theme.of(context).textTheme.bodyMedium),
            const Icon(Icons.delete, size: 18),
          ],
        ),
      ),
    ];

    final currentWidth = MediaQuery.of(context).size.width;
    return Align(
      alignment: Alignment.centerRight,
      child: ConstrainedBox(
        constraints:
            BoxConstraints(maxWidth: MediaQuery.of(context).size.width - 145),
        child: isSuccess == 1
            ? AppCardWidget(message: message.content, marginIndex: 15)
            : Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  currentWidth > 888.8
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            AppCardWidget(
                              marginIndex: 5,
                              message: message.content,
                            ),
                            const Icon(
                              Icons.error,
                              //color: AppColor.colorF44336,
                            )
                          ],
                        )
                      : AppCardWidget(
                          marginIndex: 10,
                          message: message.content,
                        ),
                  const Text(
                    'Not Delivered',
                    // style: AppTextStyle.s14AbelGrey
                    //     .copyWith(color: AppColor.colorF44336),
                  )
                ],
              ),
      ),
    );
  }
}
