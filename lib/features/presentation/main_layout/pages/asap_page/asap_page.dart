import 'package:flutter/material.dart';

import '../../../../../themes/color/app_color.dart';
import '../../../../../themes/text_style/app_text_style.dart';

part 'widgets/search_field.dart';
part 'widgets/layouts/all_users_layout.dart';

class AsapPage extends StatelessWidget {
  const AsapPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          flex: 1,
          child: AllUsersLayout(),
        ),
        Expanded(
          flex: 3,
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: AppColor.color9E9E9E,
            child: Text(
              'Чат',
              style: AppTextStyle.s36Abel,
            ),
          ),
        ),
        // Expanded(
        //   flex: 1,
        //   child: Container(
        //     height: MediaQuery.of(context).size.height,
        //     width: MediaQuery.of(context).size.width,
        //     color: AppColor.colorFFFFFF,
        //     child: Text(
        //       'профиль',
        //       style: AppTextStyle.s36Abel,
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
