import 'package:chat_app/ui/widgets/library/library_widgets.dart';
import 'package:flutter/material.dart';

class MyMessageCardWidget extends StatelessWidget {
  const MyMessageCardWidget(
      {super.key, required this.message, this.isSuccess = 1});

  final String message;
  final int isSuccess;
  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;
    return Align(
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
                            AppCardWidget(
                              marginIndex: 5,
                              message: message,
                            ),
                            Icon(
                              Icons.error,
                              color: Theme.of(context)
                                  .colorScheme
                                  .error
                                  .withOpacity(0.7),

                            )
                          ],
                        )
                      : AppCardWidget(
                          marginIndex: 10,
                          message: message,
                        ),
                  Text('Not Delivered',
                      style: Theme.of(context).textTheme.caption,
                  )
                ],
              ),
      ),
    );
  }
}
