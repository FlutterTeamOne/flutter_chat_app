import 'package:custom_pop_up_menu/custom_pop_up_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../src/libraries/library_all.dart';
import '../floating_window.dart';
import 'list_tile_widget.dart';
import 'message_cards/app_card_widget.dart';

class PopupMenuCardWidget extends StatefulWidget {
  const PopupMenuCardWidget({
    Key? key,
    this.message,
    required this.marginIndex,
    this.textController,
  }) : super(key: key);

  final MessageDto? message;
  final double marginIndex;
  final TextEditingController? textController;

  @override
  State<PopupMenuCardWidget> createState() => _PopupMenuCardWidgetState();
}

class _PopupMenuCardWidgetState extends State<PopupMenuCardWidget> {
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
          widget.textController?.text = widget.message!.content;
          context.read<MessageBloc>().add(
                UpdateMessageEvent(
                    messageId: widget.message?.localMessageId,
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
                DeleteMessageEvent(messageId: widget.message!.messageId!),
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
      child: AppCardWidget(
        marginIndex: widget.marginIndex,
        text: widget.message!.content,
        bColor: Theme.of(context).primaryColor,
        textStyle: const TextStyle(
          color: Colors.white,
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
