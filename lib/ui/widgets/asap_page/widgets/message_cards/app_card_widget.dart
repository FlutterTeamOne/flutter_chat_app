import 'package:chat_app/src/libraries/library_all.dart';
import 'package:flutter/material.dart';

class AppCardWidget extends StatelessWidget {
  const AppCardWidget({
    Key? key,
    required this.marginIndex,
    required this.message,
    this.bColor,
    this.textStyle,
    this.time,
  }) : super(key: key);

  final double marginIndex;
  final MessageDto message;
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
              child: Column(
                children: [
                  if (message.attachId != null) ...[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 200,
                        width: 200,
                        child: Placeholder(),
                      ),
                    ),
                  ],
                  SelectableText(
                    textWidthBasis: TextWidthBasis.longestLine,
                    message.content==''?'s':message.content,
                    style: textStyle,
                  ),
                ],
              ),
            ),
            Text(time ?? '', style: Theme.of(context).textTheme.bodySmall),
          ],
        ),
      ),
    );
  }
}
