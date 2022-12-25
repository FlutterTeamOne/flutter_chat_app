import 'dart:io';

import 'package:chat_app/domain/data/dto/message_dto/message_dto.dart';
import 'package:chat_app/modules/signal_service/library/library_signal_service.dart';
import 'package:chat_app/ui/widgets/asap_page/widgets/app_circle_button.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TextInputWidget extends StatefulWidget {
  const TextInputWidget({
    Key? key,
    required this.controller,
    required this.onTap,
    required this.onSubmitted,
    required this.cancelEdit,
    required this.editText,
    required this.editState,
  }) : super(key: key);

  final TextEditingController controller;
  final Function() onTap;
  final Function(String text) onSubmitted;
  final Function() cancelEdit;
  final String editText;
  final EditState editState;

  @override
  State<TextInputWidget> createState() => TextInputWidgetState();
}

class TextInputWidgetState extends State<TextInputWidget> {
  String filePath = '';
  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(
      //   border: Border(
      //     left: BorderSide(
      //       width: 1,
      //       color: Theme.of(context).dividerColor
      //     )
      //   )
      // ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const SizedBox(width: 10),
              AppCircleButtonWidget(
                  onTap: () async {
                    context.read<MessageBloc>().add(
                        CreateMessageEvent(mediaState: MediaState.isCanceled));
                    var result = await FilePicker.platform.pickFiles();
                    if (result == null) {
                      return;
                    }
                    var file = result.files.first;
                    print('FILE: $file');
                    filePath = file.path!;
                    _sendPath(file.path!);
                  },
                  icon: Icons.emoji_emotions_outlined),
              const SizedBox(width: 10),
              Expanded(
                flex: 9,
                child: Column(
                  children: [
                    if (context.watch<MessageBloc>().state.mediaState ==
                        MediaState.isPreparation) ...[
                      Align(
                        alignment: Alignment.centerLeft,
                        child: SizedBox(
                          height: 100,
                          width: 100,
                          child: Image.file(File(filePath)),
                        ),
                      )
                    ],
                    if (widget.editState == EditState.isPreparation)
                      Card(
                        child: ListTile(
                          leading: const Icon(Icons.edit),
                          title: const Text('Редактирование'),
                          subtitle: Text(widget.editText),
                          trailing: IconButton(
                            icon: const Icon(Icons.close),
                            onPressed: widget.cancelEdit,
                          ),
                        ),
                      ),
                    TextField(
                      cursorWidth: 1,
                      maxLength: 350,
                      minLines: 1,
                      maxLines: 5,
                      cursorColor:
                          Theme.of(context).textSelectionTheme.cursorColor,
                      onSubmitted: widget.onSubmitted,
                      controller: widget.controller,
                      // style: AppTextStyle.s17Abel.copyWith(
                      //   fontSize: 16,
                      //   overflow: TextOverflow.clip,
                      // ),
                      decoration: InputDecoration(
                        counterText: '',
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 15),
                        // hintStyle: AppTextStyle.s17Abel.copyWith(fontSize: 16),
                        hintText: 'Message',
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        // enabledBorder: OutlineInputBorder(
                        //   borderRadius: BorderRadius.circular(15),
                        // ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              AppCircleButtonWidget(
                onTap: widget.onTap,
                icon: Icons.send_rounded,
              ),
              const SizedBox(width: 10),
            ],
          ),
          const SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }

  _sendPath(String path) {
    context.read<MessageBloc>().add(CreateMessageEvent(
        mediaState: MediaState.isPreparation, mediaPath: path));
  }
}
