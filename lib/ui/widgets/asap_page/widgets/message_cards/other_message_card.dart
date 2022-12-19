import 'package:chat_app/domain/data/dto/message_dto/message_dto.dart';
import 'package:chat_app/ui/widgets/asap_page/widgets/app_card.dart';
import 'package:flutter/material.dart';

class OtherMessageCardWidget extends StatelessWidget {
  const OtherMessageCardWidget({super.key, required this.message});

  final MessageDto message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: ConstrainedBox(
          constraints:
              BoxConstraints(maxWidth: MediaQuery.of(context).size.width + 145),
          child: NewCard(
            text: message.content,
            marginIndex: 5,
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
