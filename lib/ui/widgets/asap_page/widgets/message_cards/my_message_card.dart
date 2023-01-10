import 'package:chat_app/modules/signal_service/river/river.dart';
import 'package:chat_app/src/generated/messages/messages.pbgrpc.dart';
import 'package:chat_app/src/libraries/library_all.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
                message: message,
                textController: textController,
                marginIndex: 15)
            : Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  currentWidth > 888.8
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            PopupMenuCardWidget(
                                marginIndex: 5,
                                textController: textController,
                                message: message),
                            const Icon(
                              Icons.error,
                              //color: AppColor.colorF44336,
                            )
                          ],
                        )
                      : PopupMenuCardWidget(
                          marginIndex: 10,
                          textController: textController,
                          message: message,
                        ),
                  InkWell(
                    onTap: () => River.messagePod.notifier.select(
                        (value) => value.createMessage(message: message)),
                    child: const Text(
                      'Not Delivered',
                    ),
                    // style: AppTextStyle.s14AbelGrey
                    //     .copyWith(color: AppColor.colorF44336),
                  )
                ],
              ),
      ),
    );
  }
}
