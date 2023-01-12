// ignore_for_file: avoid_print

import 'package:chat_app/src/generated/grpc_lib/grpc_message_lib.dart';

import '../../../../modules/signal_service/river/message_ref/message_state_ref.dart';
import '../../../../modules/signal_service/river/river.dart';
import 'package:custom_pop_up_menu/custom_pop_up_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../src/libraries/library_all.dart';
import '../floating_window.dart';
import 'list_tile_widget.dart';
import 'message_cards/app_card_widget.dart';

class PopupMenuCardWidget extends ConsumerStatefulWidget {
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
  ConsumerState<PopupMenuCardWidget> createState() =>
      _PopupMenuCardWidgetState();
}

class _PopupMenuCardWidgetState extends ConsumerState<PopupMenuCardWidget> {
  final CustomPopupMenuController popupmenuController =
      CustomPopupMenuController();
  @override
  Widget build(BuildContext context) {
    var messagePod = ref.read(River.messagePod.notifier);
    final items = [
      // Тут находится то чо отображается в плавающем окне
      ListTileWidget(
        icon: Icons.edit,
        text: 'Edit',
        onTap: () {
          if (widget.message?.contentType == ContentType.isText) {
            widget.textController?.text = widget.message!.content;
          } else if (widget.message?.contentType == ContentType.isMedia) {
            // List<String>? data = widget.message?.content.split(',');
            // var msg = data![0].split(' message: ')[1];
            // print('msg popup: $msg');
            widget.textController?.text = '';
          } else {
            List<String>? data = widget.message?.content.split(',');
            var msg = data![0].split('message: ')[1];
            // image = data[4].split('url: ')[1];
            // print('image: $image');
            /// TODO refactor print
            print('msg: $msg');
            widget.textController?.text = msg;
          }
          messagePod.updateMessage(
            messageId: widget.message?.localMessageId,
            isEditing: EditState.isPreparation,
          );
          popupmenuController.hideMenu();
        },
      ),
      const SizedBox(height: 5),
      ListTileWidget(
        icon: Icons.delete,
        text: 'Delete',
        onTap: () {
          messagePod.deleteMessage(messageId: widget.message!.messageId!);
          popupmenuController.hideMenu();
        },
      ),
    ];
    var time = DateTime.parse(widget.message?.createdDate ?? '');
    var correctminute =
        time.minute.toString().length == 1 ? '0${time.minute}' : time.minute;
    String? realTime = '${time.hour}:$correctminute';

    // print('Message: ${widget.message!.content}');
    // print("MessageCreate: ${widget.message!.createdDate}");
    // print("MessageUpdate: ${widget.message!.updatedDate}");
    // print('==? ${widget.message!.createdDate == widget.message!.updatedDate}');

    var editedText = widget.message?.createdDate == widget.message?.updatedDate
        ? ''
        : 'edited ';
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
        edited: editedText,
        time: realTime,
        marginIndex: widget.marginIndex,
        message: widget.message!,
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
