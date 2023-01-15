import 'package:chat_app/ui/widgets/custom_widgets/cached_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../pages/asap_page/layouts/edit_chat_popup_widget.dart';

class ChatAppBarWidget extends StatelessWidget {
  const ChatAppBarWidget({
    Key? key,
    required this.image,
    required this.name,
    required this.chatId,
    required this.ref,
    required this.myChat,
  }) : super(key: key);
  final String image;
  final String name;
  final int chatId;
  final WidgetRef ref;
  final bool myChat;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
      child: Row(
        children: <Widget>[
          CircleAvatar(
            radius: 45,
            child: ClipOval(
              child: CachedImageWidget(
                url: image,
                width: 50,
                height: 50,
                errorText: 'Oops',
              ),
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Text(
              name,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(width: 15),
          Text(name),
          const Spacer(),
          EditChatPopupWidget(myChat: myChat, ref: ref, chatId: chatId),
        ],
      ),
    );
  }
}
