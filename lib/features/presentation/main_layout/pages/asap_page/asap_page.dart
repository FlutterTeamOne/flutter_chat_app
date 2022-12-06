import 'package:flutter/material.dart';
import 'package:flutter_chat_app/features/data/models/message_model/message_model.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';
import '../../../../../themes/color/app_color.dart';
import '../../../../../themes/text_style/app_text_style.dart';

part 'widgets/search_field.dart';
part 'widgets/message_cards/my_message_card.dart';
part 'widgets/message_cards/other_message_card.dart';
part 'layouts/chat_list_layout.dart';
part 'layouts/user_chat_layout.dart';
part 'widgets/user_card.dart';
part 'widgets/chat_app_bar.dart';
part 'widgets/text_input.dart';
part 'widgets/chat.dart';
part 'widgets/message_cards/time_card.dart';

class AsapPage extends StatelessWidget {
  const AsapPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        // Список чатов
        Expanded(child: _ChatListLayout()),
        // Чат
        Expanded(flex: 3, child: _UserChatLayout()),
        // Профиль
        // Expanded(
        //   flex: 2,
        //   child: Container(
        //     height: MediaQuery.of(context).size.height,
        //     width: MediaQuery.of(context).size.width,
        //     decoration: BoxDecoration(
        //       color: AppColor.colorFFFFFF,
        //       border: Border.all(
        //         color: AppColor.color9E9E9E.withOpacity(0.5),
        //       ),
        //     ),
        //     child: Text(
        //       'профиль',
        //       style: AppTextStyle.s36Abel,
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
