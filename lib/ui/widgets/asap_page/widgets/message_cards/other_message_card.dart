import 'package:chat_app/domain/data/dto/message_dto/message_dto.dart';
import 'package:flutter/material.dart';
import 'app_card_widget.dart';

class OtherMessageCardWidget extends StatelessWidget {
  const OtherMessageCardWidget({super.key, required this.message});

  final MessageDto message;
  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;
    return Align(
      alignment: Alignment.centerLeft,
      child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: currentWidth > 1150 ? 750 : 350,
          ),
          child: AppCardWidget(
            text: message.content,
            marginIndex: 5,
            textStyle: TextStyle(
              color: Theme.of(context)
                  .textSelectionTheme
                  .selectionHandleColor
                  ?.withOpacity(0.8),
            ),
          )
          //  Card(
          //   elevation: 2,
          //   shape: RoundedRectangleBorder(
          //     borderRadius: BorderRadius.circular(8),
          //     side: const BorderSide(
          //       width: 0.1,
          //       // color: AppColor.color000000.withOpacity(0.6),
          //     ),
          //   ),
          //   // color: AppColor.colorFFFFFF,
          //   margin:
          //       const EdgeInsets.only(left: 10, bottom: 5, top: 5, right: 320),
          //   child: Padding(
          //     padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          //     child: SelectableText(
          //       message,
          //       // style: AppTextStyle.s17Abel,
          //       textAlign: TextAlign.justify,
          //     ),
          //   ),
          // ),
          ),
    );
  }
}
