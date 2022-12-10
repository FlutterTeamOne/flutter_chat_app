import 'package:chat_app/src/libraries/library_all.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../library/library_widgets.dart';
import 'package:flutter/material.dart';

class MyMessageCardWidget extends StatefulWidget {
  MyMessageCardWidget(
      {super.key,
      this.isSuccess = 1,
      required this.message,
      required this.textController,
      required this.isEditing});

  final MessageDto message;
  final int isSuccess;
  final TextEditingController textController;
  bool isEditing;

  @override
  State<MyMessageCardWidget> createState() => _MyMessageCardWidgetState();
}

class _MyMessageCardWidgetState extends State<MyMessageCardWidget> {
  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;

    var items = [
      PopupMenuItem(
          child: ListTile(
        mouseCursor: MouseCursor.uncontrolled,
        leading: const Icon(Icons.edit),
        title: const Text('Edit'),
        onTap: () {
          widget.textController.text = widget.message.content;
          // setState(() {
          //   widget.isEditing = true;
          // });
          context.read<MessageBloc>().add(UpdateMessageEvent(
              messageId: widget.message.localMessageId,
              isEditing: EditState.isPreparation));

          // print('IS EDITING: ${context.read<MessageBloc>().isEditing}');
          Navigator.of(context).pop();
        },
      )),
      PopupMenuItem(
          child: ListTile(
        leading: Icon(Icons.delete),
        title: Text('Delete'),
        onTap: () {
          context.read<MessageBloc>().add(
                DeleteMessageEvent(messageId: widget.message.localMessageId!),
              );
          Navigator.of(context).pop();
        },
      )),
    ];

    return PopupMenuButton(
      position: PopupMenuPosition.under,
      splashRadius: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      tooltip: null,
      itemBuilder: (context) {
        return items;
      },
      child: Align(
        alignment: Alignment.centerRight,
        child: ConstrainedBox(
          constraints:
              BoxConstraints(maxWidth: MediaQuery.of(context).size.width - 145),
          child: widget.isSuccess == 1
              ? AppCardWidget(message: widget.message.content, marginIndex: 15)
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    currentWidth > 888.8
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              AppCardWidget(
                                marginIndex: 5,
                                message: widget.message.content,
                              ),
                              const Icon(
                                Icons.error,
                                //color: AppColor.colorF44336,
                              )
                            ],
                          )
                        : AppCardWidget(
                            marginIndex: 10,
                            message: widget.message.content,
                          ),
                    const Text(
                      'Not Delivered',
                      // style: AppTextStyle.s14AbelGrey
                      //     .copyWith(color: AppColor.colorF44336),
                    )
                  ],
                ),
        ),
      ),
    );
  }
}
