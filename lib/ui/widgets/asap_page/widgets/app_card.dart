import 'dart:developer';
import 'dart:ui';
import 'package:custom_pop_up_menu/custom_pop_up_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../src/libraries/library_all.dart';
import '../floating_window.dart';
import 'list_tile_widget.dart';

class AppCardWidget extends StatefulWidget {
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
  State<AppCardWidget> createState() => _AppCardWidgetState();
}

class _AppCardWidgetState extends State<AppCardWidget> {
  final CustomPopupMenuController popupmenuController =
      CustomPopupMenuController();
  @override
  Widget build(BuildContext context) {
    final items = [
      // Тут находится то чо отображается в плавающем окне
      ListTileWidget(
        icon: Icons.edit,
        text: 'Edit',
        onTap: () {
          widget.textController.text = widget.message.content;
          context.read<MessageBloc>().add(
                UpdateMessageEvent(
                    messageId: widget.message.localMessageId,
                    isEditing: EditState.isPreparation),
              );
          popupmenuController.hideMenu();
        },
      ),
      const SizedBox(height: 5),
      ListTileWidget(
        icon: Icons.delete,
        text: 'Delete',
        onTap: () {
          context.read<MessageBloc>().add(
                DeleteMessageEvent(messageId: widget.message.messageId!),
              );
          popupmenuController.hideMenu();
        },
      ),
    ];
    return CustomPopupMenu(
      controller: popupmenuController,
      showArrow: false,
      position: PreferredPosition.bottom,
      barrierColor: Colors.transparent,
      enablePassEvent: false,
      verticalMargin: -2,
      pressType: PressType.singleClick,
      menuBuilder: () => FloatingWindowWidget(items: items),
      child: Card(
        color: Theme.of(context).primaryColor,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide.none,
        ),
        margin: EdgeInsets.only(
            left: 10, bottom: 5, top: 5, right: widget.marginIndex),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: SelectableText(
            widget.message.content,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    popupmenuController.dispose();
    super.dispose();
  }
}
