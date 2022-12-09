import 'package:chat_app/modules/style_manager/library/library_style_manager.dart';
import 'package:flutter/material.dart';
=======
﻿import 'package:flutter/material.dart';
>>>>>>> fdeb7e0085405b0aaa6cb4d4857474c0fe562954

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
          horizontal: BorderSide(),
        ),
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.search_rounded,
          ),
          isDense: true,
          hintText: 'Search',
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
