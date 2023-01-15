import '../../../../../domain/data/dto/message_dto/message_dto.dart';
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
    var correctMinute =
        time.minute.toString().length == 1 ? '0${time.minute}' : time.minute;
    String? realTime = '${time.hour}:$correctMinute';

    // print('Message: ${message.content}');
    // print("MessageCreate: ${message.createdDate}");
    // print("MessageUpdate: ${message.updatedDate}");
    // print('==? ${message.createdDate == message.updatedDate}');

    return Align(
      alignment: Alignment.centerLeft,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: currentWidth > 1150 ? 750 : 350,
        ),
        child: AppCardWidget(
          message: message,
          marginIndex: 5,
          time: realTime,
          
          textStyle: TextStyle(
            color: Theme.of(context)
                .textSelectionTheme
                .selectionHandleColor
                ?.withOpacity(0.8),
          ),
        ),
      ),
    );
  }
}
