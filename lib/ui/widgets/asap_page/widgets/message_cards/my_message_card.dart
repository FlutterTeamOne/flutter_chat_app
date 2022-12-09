import 'package:chat_app/src/libraries/library_all.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../library/library_widgets.dart';
import 'package:flutter/material.dart';

class MyMessageCardWidget extends StatelessWidget {
  const MyMessageCardWidget(
      {super.key, this.isSuccess = 1, required this.message});

  final MessageDto message;
  final int isSuccess;

  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;
    
    return GestureDetector(
      onTap: () {
        context.read<MessageBloc>().add(
              DeleteMessageEvent(messageId: message.localMessageId!),
            );
      },
      child: Align(
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
      ),
    );
  }
}
