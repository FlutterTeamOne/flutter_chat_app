part of '../asap_page.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextField(
      style: AppTextStyle.s17Abel.copyWith(fontSize: 14),
      controller: controller,
      cursorColor: AppColor.color7E57C2,
      decoration: InputDecoration(
        prefixIcon: const Icon(
          Icons.search_rounded,
          color: AppColor.color9E9E9E,
        ),
        isDense: true,
        hintText: 'Search',
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColor.color9E9E9E),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColor.color9E9E9E),
        ),
      ),
    );
  }
}
