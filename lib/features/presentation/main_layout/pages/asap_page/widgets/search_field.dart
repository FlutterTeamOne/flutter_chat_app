part of '../asap_page.dart';

class _SearchField extends StatelessWidget {
  const _SearchField({
    Key? key,
    this.controller,
  }) : super(key: key);

  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      width: MediaQuery.of(context).size.width * 0.25,
      height: MediaQuery.of(context).size.height * 0.077,
      decoration: BoxDecoration(
        border: Border.symmetric(
          horizontal: BorderSide(
            color: AppColor.color9E9E9E.withOpacity(0.5),
          ),
        ),
        color: AppColor.colorFFFFFF,
      ),
      child: TextField(
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
      ),
    );
  }
}
