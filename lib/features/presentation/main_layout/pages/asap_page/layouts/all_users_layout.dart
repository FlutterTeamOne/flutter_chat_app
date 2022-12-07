part of '../asap_page.dart';

class _AllUsersLayout extends StatefulWidget {
  const _AllUsersLayout({
    Key? key,
  }) : super(key: key);

  @override
  State<_AllUsersLayout> createState() => _AllUsersLayoutState();
}

class _AllUsersLayoutState extends State<_AllUsersLayout> {
  final _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColor.colorFFFFFF,
      shape: Border.all(
        color: AppColor.color9E9E9E.withOpacity(0.5),
      ),
      elevation: 0,
      child: BlocConsumer<MessageBloc, MessageState>(
        listener: (context, messageState) {
          // TODO: implement listener
        },
        builder: (context, messageState) {
          return BlocConsumer<ChatBloc, ChatState>(
            listener: (context, chatState) {
              // if (state.chats == null) {}
            },
            builder: (context, chatState) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  chatState.chats == null || chatState.chats == []
                      ? const Center(
                          child: Text('Oops...\nno chats'),
                        )
                      : SingleChildScrollView(
                          child: Column(
                            children: [
                              _SearchField(controller: _searchController),
                              const SizedBox(height: 5),
                              ListView.separated(
                                itemCount: chatState.chats!.length,
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                separatorBuilder: (context, index) =>
                                    const SizedBox(height: 25),
                                itemBuilder: (context, index) {
                                  var friendId =
                                      chatState.chats![index].friendId - 1;
                                  var lastMessageId =
                                      messageState.messages!.isEmpty
                                          ? 0
                                          : messageState.messages!.length - 1;
                                  return UserCard(
                                    selected: false,
                                    onTap: () {},
                                    name: context
                                        .read<UserBloc>()
                                        .state
                                        .users![friendId]
                                        .name,
                                    image: context
                                        .read<UserBloc>()
                                        .state
                                        .users![friendId]
                                        .profilePicLink,
                                    message: messageState.messages!.isNotEmpty
                                        ? messageState
                                            .messages![lastMessageId].content
                                        : '',
                                  );
                                },
                              )
                            ],
                          ),
                        ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton.icon(
                      onPressed:
                          () {}, //=>context.read<ChatBloc>().add(CreateChatEvent(
                      //chat: ChatModel(
                      //localChatId: 1, chatIdMain: 2, friendId: 2),
                      // )),
                      icon: const Icon(Icons.add),
                      label: const Text('Add Chat'),
                    ),
                  )
                ],
              );
            },
          );
        },
      ),
    );
  }
}
