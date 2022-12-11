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
        constraints: BoxConstraints(
          maxWidth: currentWidth > 1150 ? 750 : 350,
        ),
        child: isSuccess == 1
            ? AppCardWidget(message: message, marginIndex: 15)
            : Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  currentWidth > 888.8
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            AppCardWidget(marginIndex: 5, message: message),
                            const Icon(
                              Icons.error,
                              //color: AppColor.colorF44336,
                            )
                          ],
                        )
                      : AppCardWidget(
                          marginIndex: 10,
                          message: message,
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
