import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../src/libraries/library_all.dart';
import '../../../widgets/library/library_widgets.dart';

class UserChatLayout extends StatefulWidget {
  const UserChatLayout({
    Key? key,
    required this.chatId,
    required this.localChatId,
  }) : super(key: key);
  final int chatId;
  final int localChatId;

  @override
  State<UserChatLayout> createState() => UserChatLayoutState();
}

class UserChatLayoutState extends State<UserChatLayout> {
  TextEditingController controller = TextEditingController();
  final bool isEditing = false;
  @override
  Widget build(BuildContext context) {
    var user = context.read<UserBloc>().state.users![widget.chatId];
    return Column(
      children: [
        ChatAppBarWidget(
          image: user.profilePicLink,
          name: user.name,
        ),
        Expanded(
          child: context.watch<MessageBloc>().state.messages != null
              ? ChatWidget(
                  textController: controller,
                  isEditing: isEditing,
                  messages: context.watch<MessageBloc>().state.messages!)
              : const Center(child: CircularProgressIndicator()),
        ),
        TextInputWidget(
            onSubmitted: (text) {
              FocusScope.of(context).unfocus();
              if (controller.text.isNotEmpty) {
                context.read<MessageBloc>().add(
                      CreateMessageEvent(
                        message: MessageDto(
                          // localMessageId: 1,
                          localChatId: widget.localChatId,
                          localSendId: 1,
                          content: text,
                          date: DateTime.now().toIso8601String(),
                        ),
                      ),
                    );
                controller.clear();
              } else {
                return null;
              }
            },
            controller: controller,
            onTap: () {
              if (context.read<MessageBloc>().state.editState ==
                      EditState.isNotEditing &&
                  controller.text.isNotEmpty) {
                context.read<MessageBloc>().add(
                      CreateMessageEvent(
                        message: MessageDto(
                          // localMessageId: 1,
                          localChatId: widget.localChatId,
                          localSendId: 1,
                          content: controller.text,
                          date: DateTime.now().toIso8601String(),
                        ),
                      ),
                    );
                FocusScope.of(context).unfocus();
                controller.clear();
              }
              // print('IS EDIT F:${context.read<MessageBloc>().isEditing}');
              if (context.read<MessageBloc>().state.editState ==
                      EditState.isPreparation &&
                  controller.text.isNotEmpty) {
                print("EDITING");

                context.read<MessageBloc>().add(
                      UpdateMessageEvent(
                          message: MessageDto(
                            localChatId: widget.localChatId,
                            localSendId: 1,
                            content: controller.text,
                            date: DateTime.now().toIso8601String(),
                          ),
                          isEditing: EditState.isEditing),
                    );
                controller.clear();
              } else {
                return null;
              }
            }),
      ],
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
