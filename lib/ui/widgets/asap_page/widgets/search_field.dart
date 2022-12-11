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
      // decoration: const BoxDecoration(
      //   border: Border.symmetric(
      //     horizontal: BorderSide(),
      //   ),
      // ),
      child: TextField(
        cursorWidth: 1,
        cursorColor: Theme.of(context).textSelectionTheme.cursorColor,
        controller: controller,
        decoration: InputDecoration(
          // filled: true,
          // fillColor: Theme.of(context).colorScheme.outline.withOpacity(0.3),
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
