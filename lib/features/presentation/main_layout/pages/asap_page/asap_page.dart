import 'package:flutter/material.dart';

import '../../../../../themes/color/app_color.dart';
import '../../../../../themes/text_style/app_text_style.dart';

class AsapPage extends StatelessWidget {
  const AsapPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
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
        Expanded(
          flex: 1,
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: AppColor.colorFFFFFF,
            child: Text(
              'профиль',
              style: AppTextStyle.s36Abel,
            ),
          ),
        ),
      ],
    );
  }
}

class AllUsersLayout extends StatelessWidget {
  const AllUsersLayout({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      // color: AppColor.color7E57C2,
      child: Column(
        children: [
          Container(),
          TextField(
            // controller: _searchController,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.search_rounded),
              isDense: true,
              hintText: 'Search',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(color: AppColor.color9E9E9E),
              ),
            ),
          ),
          Text(
            'список чатов',
            style: AppTextStyle.s36Abel,
          ),
        ],
      ),
    );
  }
}
