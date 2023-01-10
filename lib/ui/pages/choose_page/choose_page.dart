import 'package:flutter/material.dart';

class ChoosePage extends StatelessWidget {
  const ChoosePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      key: Key('center in choose_page'),
      child: Text(
        key: Key('choose_page text'),
        'Choose',
        // style: AppTextStyle.s36Abel,
      ),
    );
  }
}
