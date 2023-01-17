import 'package:logger/logger.dart';

import '../../../../../src/generated/grpc_lib/grpc_message_lib.dart';
import '../../../../../src/libraries/library_all.dart';
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
    late String image;
    late String msg;
    if (message.contentType == ContentType.isMedia) {
      List<String> data = message.content.split(',');
      image = data[3].split('url: ')[1];
      Logger().d('image: $image');
    } else if (message.contentType == ContentType.isMediaText) {
      List<String> data = message.content.split(',');
      msg = data[0].split('message: ')[1];
      image = data[4].split('url: ')[1];

      Logger().d('image: $image');
      Logger().d('msg: $msg');
    } else {
      msg = message.content;
    }
    // if (message.attachId != null && message.attachId != 0) {
    //   List<String> data = message.content.split(',');
    //   msg = data[0].split('message: ')[1];
    //   image = data[4].split('url: ')[1];
    //   print('image: $image');
    //   print('msg: $msg');
    // } else {
    //   msg = message.content;
    // }

    return Card(
      color: bColor,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide.none,
      ),
      margin: EdgeInsets.only(left: 10, bottom: 5, top: 5, right: marginIndex),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 3, right: 5),
        child: Wrap(
          crossAxisAlignment: WrapCrossAlignment.end,
          alignment: WrapAlignment.end,
          runSpacing: -2,
          spacing: 2,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 6, bottom: 5, top: 5),
              child: Column(
                children: [
                  if (message.contentType == ContentType.isMedia) ...[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 200,
                        width: 200,
                        child: Image.network(image),
                      ),
                    ),
                  ] else if (message.contentType ==
                      ContentType.isMediaText) ...[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 200,
                        width: 200,
                        child: Image.network(image),
                      ),
                    ),
                    // Text(msg)
                    SelectableText(
                      textWidthBasis: TextWidthBasis.longestLine,
                      msg.toString(),
                      style: textStyle,
                    ),
                  ] else ...[
                    SelectableText(
                      textWidthBasis: TextWidthBasis.longestLine,
                      msg.toString(),
                      style: textStyle,
                    ),
                  ]
                ],
              ),
            ),
            if (message.createdDate != message.updatedDate) ...[
              Text(
                'edited ',
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(fontStyle: FontStyle.italic),
              ),
            ],
            Text(time ?? '', style: Theme.of(context).textTheme.bodySmall),
            if (message.messageId == null || message.messageId == 0) ...[
              const Icon(
                Icons.error,
                //color: AppColor.colorF44336,
              ),
            ]
          ],
        ),
      ),
    );
  }
}
