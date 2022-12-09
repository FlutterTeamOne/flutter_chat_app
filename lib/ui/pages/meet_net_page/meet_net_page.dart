import 'package:flutter/material.dart';

class MeetNetPage extends StatelessWidget {
  const MeetNetPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.background,
      child: Center(
        child: Container(
          // color: AppColor.color7E57C2,
          child: Text(
            'MeetNet',
            // style: AppTextStyle.s36Abel,
          ),
        ),
      ),
    );
  }
}
