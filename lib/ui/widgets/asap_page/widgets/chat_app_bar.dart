import 'package:flutter/material.dart';

class ChatAppBarWidget extends StatelessWidget {
  const ChatAppBarWidget({
    Key? key,
    required this.image,
    required this.name,
  }) : super(key: key);
  final String image;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
      height: 52,
      decoration: const BoxDecoration(
        // color: AppColor.colorFFFFFF,
        border: Border(
          left: BorderSide.none,
          right: BorderSide(
              // color: AppColor.color9E9E9E.withOpacity(0.5),
              ),
          bottom: BorderSide(
              // color: AppColor.color9E9E9E.withOpacity(0.5),
              ),
          top: BorderSide(
              // color: AppColor.color9E9E9E.withOpacity(0.5),
              ),
        ),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Image.network(
              image,
            ),
          ),
          const SizedBox(width: 15),
          Text(
            name,
            // style: AppTextStyle.s17Abel.copyWith(fontSize: 20),
          ),
        ],
      ),
    );
  }
}
