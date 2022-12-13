﻿import 'package:chat_app/modules/signal_service/library/library_signal_service.dart';
import 'package:flutter/material.dart';

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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(width: 10),
              InkWell(
                onTap: () {},
                child: CircleAvatar(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.emoji_emotions_outlined,
                        size: 22,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                flex: 9,
                child: Column(
                  children: [
                    if (widget.editState == EditState.isPreparation)
                      Row(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.565,
                            child: Card(
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
                          )
                        ],
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
              InkWell(
                onTap: widget.onTap,
                child: CircleAvatar(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.send_rounded,
                        size: 22,
                      ),
                    ),
                  ),
                ),
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
}
