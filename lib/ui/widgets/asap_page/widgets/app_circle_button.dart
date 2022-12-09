import 'package:flutter/material.dart';

class AppCircleButtonWidget extends StatelessWidget {
  const AppCircleButtonWidget({
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
