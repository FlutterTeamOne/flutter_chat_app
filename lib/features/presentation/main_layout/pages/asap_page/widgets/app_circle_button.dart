﻿part of '../asap_page.dart';

class _AppCircleButton extends StatelessWidget {
  const _AppCircleButton({
    Key? key,
    required this.onTap,
    required this.icon,
  }) : super(key: key);

  final Function() onTap;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: CircleAvatar(
        child: Container(
          decoration: BoxDecoration(
            color: AppColor.color7E57C2,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Center(
            child: Icon(
              icon,
              size: 22,
            ),
          ),
        ),
      ),
    );
  }
}
