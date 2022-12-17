import 'package:flutter/material.dart';

class ScrollDownButton extends StatelessWidget {
  const ScrollDownButton({
    Key? key,
    required this.onTap,
    required this.buttonSize,
    required this.iconSize,
  }) : super(key: key);
  final Function() onTap;
  final double buttonSize;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: const Duration(milliseconds: 500),
      reverseDuration: const Duration(milliseconds: 500),
      child: InkWell(
        borderRadius: BorderRadius.circular(100),
        onTap: onTap,
        child: CircleAvatar(
          backgroundColor: Colors.white.withOpacity(0.6),
          radius: buttonSize,
          child: Icon(
            Icons.keyboard_arrow_down_rounded,
            size: iconSize,
            color: Colors.black.withOpacity(0.8),
          ),
        ),
      ),
    );
  }
}
