import 'package:flutter/material.dart';
import '../../../../../themes/color/app_color.dart';
import '../../../../../themes/text_style/app_text_style.dart';

class ChoosePage extends StatelessWidget {
  const ChoosePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: AppColor.color7E57C2,
        child: Text(
          'Choose',
          style: AppTextStyle.s36Abel,
        ),
      ),
    );
  }
}
