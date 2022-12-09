import '../../../../modules/style_manager/library/library_style_manager.dart';
import 'package:flutter/material.dart';

class SearchFieldWidget extends StatelessWidget {
  const SearchFieldWidget({
    Key? key,
    this.controller,
  }) : super(key: key);

  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      height: 52,
      decoration: const BoxDecoration(
        border: Border.symmetric(
          horizontal: BorderSide(
              // color: AppColor.color9E9E9E.withOpacity(0.5),
              ),
        ),
        // color: AppColor.colorFFFFFF,
      ),
      child: TextField(
        // style: AppTextStyle.s17Abel.copyWith(fontSize: 14),
        controller: controller,
        // cursorColor: AppColor.color7E57C2,
        decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.search_rounded,
            // color: AppColor.color9E9E9E,
          ),
          isDense: true,
          hintText: 'Search',
          hintStyle: AppTextStyle.s17Abel.copyWith(fontSize: 13.5),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            // borderSide: const BorderSide(color: AppColor.color9E9E9E),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            // borderSide: const BorderSide(color: AppColor.color9E9E9E),
          ),
        ),
      ),
    );
  }
}
