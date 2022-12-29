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
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const SizedBox(width: 10),
          AppCircleButtonWidget(
              onTap: () async {
                context
                    .read<MessageBloc>()
                    .add(CreateMessageEvent(mediaState: MediaState.isSending));
                var result = await FilePicker.platform.pickFiles();
                if (result == null) {
                  return;
                }
                var file = result.files.first;
                print('FILE: $file');
                filePath = file.path!;
                _sendPath(file.path!);
                print('MOUNTED');
                try {
                  await showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Image'),
                          content: SizedBox(
                            height: 200,
                            width: 200,
                            child: Image.file(File(filePath)),
                          ),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  context.read<MessageBloc>().add(
                                      CreateMessageEvent(
                                          mediaState: MediaState.isCanceled));
                                  Navigator.pop(context, 'Cancel');
                                },
                                child: const Text('Cancel')),
                            TextButton(
                              onPressed: () {
                                widget.controller.text = filePath;
                                widget.onSubmitted;
                                Navigator.pop(context);
                              },
                              child: const Text('Send'),
                            ),
                          ],
                        );
                      });
                } catch (e) {
                  await showDialog(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: const Text('ERROR'),
                      content: const Text('Somethin went wrong'),
                      actions: [
                        TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('back')),
                      ],
                    ),
                  );
                }
                // if (widget.editState == EditState.isPreparation)
                //   Flexible(
                //     child: Card(
                //       child: ListTile(
                //         leading: const Icon(Icons.edit),
                //         title: const Text('Редактирование'),
                //         subtitle: Text(widget.editText),
                //         trailing: IconButton(
                //           icon: const Icon(Icons.close),
                //           onPressed: widget.cancelEdit,
                //         ),
                //       ),
                //     ),
                //   ),
              },
              icon: Icons.emoji_emotions_outlined),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              cursorWidth: 1,
              maxLength: 350,
              minLines: 1,
              maxLines: 5,
              cursorColor: Theme.of(context).textSelectionTheme.cursorColor,
              onSubmitted: widget.onSubmitted,
              controller: widget.controller,
              // style: AppTextStyle.s17Abel.copyWith(
              //   fontSize: 16,
              //   overflow: TextOverflow.clip,
              // ),
              decoration: InputDecoration(
                counterText: '',
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
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
          ),
          const SizedBox(width: 10),
          AppCircleButtonWidget(
            onTap: widget.onTap,
            icon: Icons.send_rounded,
          ),
          const SizedBox(width: 10),
        ],
      ),
    );
  }

  _sendPath(String path) {
    context.read<MessageBloc>().add(CreateMessageEvent(
        mediaState: MediaState.isPreparation, mediaPath: path));
  }
}
