import 'package:chat_app/domain/data/dto/message_dto/message_dto.dart';
import 'package:flutter/material.dart';
import 'app_card_widget.dart';

class OtherMessageCardWidget extends StatelessWidget {
  const OtherMessageCardWidget({
    super.key,
    required this.message,
  });

  final MessageDto message;

  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;
    var time = DateTime.parse(message.createdDate ?? '');
    String? realTime = '${time.hour}:${time.minute}';
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
          time: realTime,
        ),
      ),
    );
  }
}
