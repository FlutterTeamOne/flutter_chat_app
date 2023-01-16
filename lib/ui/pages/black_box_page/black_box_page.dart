import 'package:flutter/material.dart';

class BlackBoxPage extends StatelessWidget {
  const BlackBoxPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      key: Key("Center BlackBoxPage"),
      child: Text(
        'Black box',
        // style: AppTextStyle.s36Abel,
      ),
    );
  }
}
