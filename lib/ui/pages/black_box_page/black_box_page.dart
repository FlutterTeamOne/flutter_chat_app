import 'package:flutter/material.dart';

class BlackBoxPage extends StatelessWidget {
  const BlackBoxPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        key: const Key("Center BlackBoxPage"),
        child: Container(
          // color: AppColor.color7E57C2,
          child: const Text(
            'Black box',
            // style: AppTextStyle.s36Abel,
          ),
        ),
      ),
    );
  }
}
