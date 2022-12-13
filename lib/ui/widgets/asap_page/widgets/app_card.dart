import 'dart:developer';
import 'dart:ui';
import 'package:custom_pop_up_menu/custom_pop_up_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../src/libraries/library_all.dart';
import 'list_tile_widget.dart';

class AppCardWidget extends StatelessWidget {
  const AppCardWidget({
    Key? key,
    required this.message,
    required this.marginIndex,
    required this.textController,
  }) : super(key: key);

  final MessageDto message;
  final double marginIndex;
  final TextEditingController textController;

  @override
  Widget build(BuildContext context) {
    final items = [
      // Тут находится то чо отображается в плавающем окне
      ListTileWidget(
        icon: Icons.edit,
        text: 'Edit',
        onTap: () {
          textController.text = message.content;
          context.read<MessageBloc>().add(
                UpdateMessageEvent(
                    messageId: message.localMessageId,
                    isEditing: EditState.isPreparation),
              );
        },
      ),
      const SizedBox(height: 5),
      ListTileWidget(
        icon: Icons.delete,
        text: 'Delete',
        onTap: () {
          context.read<MessageBloc>().add(
                DeleteMessageEvent(messageId: message.localMessageId!),
              );
        },
      ),
    ];
    return CustomPopupMenu(
      // controller: ,
      showArrow: false,
      position: PreferredPosition.bottom,
      barrierColor: Colors.transparent,
      enablePassEvent: false,
      verticalMargin: -2,
      pressType: PressType.singleClick,
      menuBuilder: () => Container(
        width: 160,
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          color: Color(0xFF4C4C4C),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(8),
            bottomRight: Radius.circular(8),
            topLeft: Radius.circular(8),
          ),
        ),
        child: Column(children: items),
      ),
      child: Card(
        color: Theme.of(context).primaryColor,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide.none,
        ),
        margin:
            EdgeInsets.only(left: 10, bottom: 5, top: 5, right: marginIndex),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: SelectableText(
            message.content,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
