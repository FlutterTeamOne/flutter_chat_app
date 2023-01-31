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
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            border: Border.all(
              color:
                  Theme.of(context).floatingActionButtonTheme.foregroundColor!,
              strokeAlign: BorderSide.strokeAlignCenter,
            ),
          ),
          child: CircleAvatar(
            radius: buttonSize,
            backgroundColor:
                Theme.of(context).floatingActionButtonTheme.backgroundColor,
            child: Icon(
              Icons.keyboard_arrow_down_rounded,
              size: iconSize,
              color:
                  Theme.of(context).floatingActionButtonTheme.foregroundColor,
            ),
          ),
        ),
      ),
    );
  }
}
