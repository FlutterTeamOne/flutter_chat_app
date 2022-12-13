import 'package:flutter/material.dart';

class ListTileWidget extends StatelessWidget {
  const ListTileWidget({
    Key? key,
    required this.onTap,
    required this.text,
    this.textStyle,
    required this.icon,
    this.iconColor,
  }) : super(key: key);

  final Function() onTap;
  final String text;
  final TextStyle? textStyle;
  final IconData icon;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      //Сделать прозрачным
      // hoverColor: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(text, style: textStyle),
            Icon(icon, size: 16, color: iconColor),
          ],
        ),
      ),
    );
  }
}
