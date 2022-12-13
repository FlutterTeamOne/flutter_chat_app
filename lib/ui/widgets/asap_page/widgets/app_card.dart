import 'dart:developer';
import 'dart:ui';
import 'package:custom_pop_up_menu/custom_pop_up_menu.dart';
import 'package:flutter/material.dart';
import 'list_tile_widget.dart';

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
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(
          width: 0.1,
        ),
      ),
      margin: EdgeInsets.only(left: 320, bottom: 5, top: 5, right: marginIndex),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: SelectableText(
          message,
        ),
      ),
    );
  }
}
