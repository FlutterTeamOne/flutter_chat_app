import 'dart:developer';

import 'package:flutter/material.dart';

import '../../../../../domain/data/dto/message_dto/message_dto.dart';

class AppCardWidget extends StatelessWidget {
  const AppCardWidget({
    Key? key,
    required this.marginIndex,
    required this.text,
    this.bColor,
    this.textStyle,
    this.time,
  }) : super(key: key);

  final double marginIndex;
  final String text;
  final Color? bColor;
  final TextStyle? textStyle;
  final String? time;
  @override
  Widget build(BuildContext context) {
    // final dateTime = DateTime.parse(message?.createdDate ?? '');
    // final timeNow = '${dateTime.hour} : ${dateTime.minute}';

    return Card(
      color: bColor,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide.none,
      ),
      margin: EdgeInsets.only(
        left: 10,
        bottom: 5,
        top: 5,
        right: marginIndex,
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 3, right: 5),
        child: Wrap(
          crossAxisAlignment: WrapCrossAlignment.end,
          alignment: WrapAlignment.end,
          runSpacing: -2,
          spacing: 2,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 6,
                bottom: 5,
                top: 5,
              ),
              child: SelectableText(
                textWidthBasis: TextWidthBasis.longestLine,
                text,
                style: textStyle,
              ),
            ),
            Text(time ?? '', style: Theme.of(context).textTheme.bodySmall),
          ],
        ),
      ),
    );
  }
}
