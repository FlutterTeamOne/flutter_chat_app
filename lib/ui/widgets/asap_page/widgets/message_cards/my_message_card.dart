import 'package:chat_app/ui/widgets/library/library_widgets.dart';
import 'package:flutter/material.dart';

class MyMessageCardWidget extends StatelessWidget {
  const MyMessageCardWidget(
      {super.key, required this.message, this.isSuccess = 1});

  final String message;
  final int isSuccess;
  @override
  Widget build(BuildContext context) {
    var items = [
      PopupMenuItem(
        onTap: () {
          //
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
          //
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

    return PopupMenuButton(
      tooltip: '',
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
            topLeft: Radius.circular(10)),
      ),
      position: PopupMenuPosition.under,
      splashRadius: 0,
      itemBuilder: (context) => items,
      child: Align(
        alignment: Alignment.centerRight,
        child: ConstrainedBox(
          constraints:
              BoxConstraints(maxWidth: MediaQuery.of(context).size.width - 145),
          child: isSuccess == 1
              ? AppCardWidget(message: message, marginIndex: 15)
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    currentWidth > 888.8
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Expanded(
                                child: AppCardWidget(
                                    marginIndex: 5, message: message),
                              ),
                              Icon(
                                Icons.error,
                                color: Theme.of(context).errorColor,
                              )
                            ],
                          )
                        : AppCardWidget(
                            marginIndex: 10,
                            message: message,
                          ),
                    Text(
                      'Not Delivered',
                      style: Theme.of(context).textTheme.caption?.copyWith(
                            color: Theme.of(context).errorColor,
                          ),
                    )
                  ],
                ),
        ),
      ),
    );
  }
}
