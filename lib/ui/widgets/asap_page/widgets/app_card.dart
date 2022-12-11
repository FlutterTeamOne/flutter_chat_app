import 'package:flutter/material.dart';

class AppCardWidget extends StatelessWidget {
  const AppCardWidget({
    Key? key,
    required this.message,
    required this.marginIndex,
  }) : super(key: key);

  final String message;
  final double marginIndex;

  @override
  Widget build(BuildContext context) {
    return Card(
color: Theme.of(context).primaryColor,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide.none
      ),
      margin: EdgeInsets.only(left: 320, bottom: 5, top: 5, right: marginIndex),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: SelectableText(
          message,
style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
