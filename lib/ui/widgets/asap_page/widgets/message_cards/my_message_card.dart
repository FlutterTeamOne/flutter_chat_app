import 'package:chat_app/modules/signal_service/river/river.dart';
import 'package:chat_app/src/libraries/library_all.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../library/library_widgets.dart';
import 'package:flutter/material.dart';

class MyMessageCardWidget extends StatelessWidget {
  const MyMessageCardWidget({
    super.key,
    this.isSuccess,
    required this.message,
    required this.textController,
  });

  final MessageDto message;
  final int? isSuccess;
  final TextEditingController textController;

  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;
    return Align(
      alignment: Alignment.centerRight,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: currentWidth > 1150 ? 750 : 350,
        ),
        child: isSuccess != null
            ? PopupMenuCardWidget(
                key: const Key('messageText'),
                message: message,
                textController: textController,
                marginIndex: 15)
            : Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  PopupMenuCardWidget(
                    marginIndex: 10,
                    textController: textController,
                    message: message,
                  ),
                  Consumer(
                    builder:
                        (BuildContext context, WidgetRef ref, Widget? child) {
                      return InkWell(
                        onTap: () => ref
                            .read(River.messagePod.notifier)
                            .createMessage(
                                message: message,
                                contentType: message.contentType),
                        child: const Text(
                          'Not Delivered',
                        ),
                        // style: AppTextStyle.s14AbelGrey
                        //     .copyWith(color: AppColor.colorF44336),
                      );
                    },
                  )
                ],
              ),
      ),
    );
  }
}
