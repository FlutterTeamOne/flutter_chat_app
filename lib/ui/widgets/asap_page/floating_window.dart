import 'package:flutter/material.dart';

class FloatingWindowWidget extends StatelessWidget {
  const FloatingWindowWidget({
    Key? key,
    required this.items,
  }) : super(key: key);

  final List<Widget> items;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Theme.of(context).dialogBackgroundColor,
border: Border.all(width: 0.3),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(8),
          bottomRight: Radius.circular(8),
          topLeft: Radius.circular(8),
        ),
      ),
      child: Column(children: items),
    );
  }
}
