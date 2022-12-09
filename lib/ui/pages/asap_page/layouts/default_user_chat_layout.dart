import 'package:flutter/material.dart';

import '../../../../src/libraries/library_all.dart';

class DefaultUserChatLayout extends StatelessWidget {
  const DefaultUserChatLayout();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.colorFFFFFF,
        border: Border(
          left: BorderSide.none,
          right: BorderSide(
            color: AppColor.color9E9E9E.withOpacity(0.5),
          ),
          bottom: BorderSide(
            color: AppColor.color9E9E9E.withOpacity(0.5),
          ),
          top: BorderSide(
            color: AppColor.color9E9E9E.withOpacity(0.5),
          ),
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Sfera'.toUpperCase(), style: AppTextStyle.s36Abel),
            Text(
              'Send and receive messages. Choose a chat to write a message.',
              style: AppTextStyle.s17Abel.copyWith(color: AppColor.color9E9E9E),
            ),
          ],
        ),
      ),
    );
  }
}
