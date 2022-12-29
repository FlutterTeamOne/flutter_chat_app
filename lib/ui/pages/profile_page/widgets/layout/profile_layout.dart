part of '../../profile_page.dart';

class _ProfileLayout extends StatelessWidget {
  const _ProfileLayout({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserBloc, UserState>(
      listener: (context, state) {},
      builder: (context, state) {
        var userMain;
        for (var user in state.users!) {
          if (user.userId == UserPref.getUserId) {
            userMain = user;
            break;
          }
        }

        return userMain == null
            ? const Center(
                widthFactor: 100,
                heightFactor: 100,
                child: CircularProgressIndicator())
            : ListView(
                children: [
                  // Фон и аватарка
                  Stack(
                    children: [
                      const SizedBox(height: 205),
                      // Фон
                      _AppBluredImage(image: userMain.profilePicLink),
                      // Аватарка
                      _UserPic(userPic: userMain.profilePicLink),
                      // Кнопка изменение аву
                      const _ChangeUserPic(),
                      IconButton(
                        onPressed: () async {
                          // context.read<ChatBloc>().close();
                          //закрыть базу
                          context
                              .read<UserBloc>()
                              .add(ChangeUserEvent(isStartDB: true));
                          context.read<UserBloc>().add(ReadUsersEvent());
                          context.read<ChatBloc>().add(GetChatIdEvent(-1));
                          await DBHelper.instanse.close();
                          Future.delayed(const Duration(seconds: 1),
                              () => Navigator.of(context).pushNamed(AuthPage.routeName));
                        },
                        icon: const Icon(Icons.arrow_back),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Username',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        const SizedBox(height: 2),
                        Row(
                          children: [
                            Text(
                              userMain.name ?? 'unknow',
                              style: Theme.of(context).textTheme.bodyText2,
                            ),
                            // Кнопка смены имени
                            ButtonChangeName(userMain: userMain)
                          ],
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Email',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        const SizedBox(height: 2),
                        Row(
                          children: [
                            Text(
                              userMain.email ?? '???',
                              style: Theme.of(context).textTheme.bodyText2,
                            ),
                            ButtonChangeEmail(userMain: userMain)
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            ElevatedButton(
                                style: ButtonStyle(
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ))),
                                onPressed: () {
                                  context.read<UserBloc>().add(
                                      DeleteUserEvent(userId: userMain.userId));
                                  print(userMain.userId);
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        final userIsDeleted = context
                                            .watch<UserBloc>()
                                            .state
                                            .isDeleted;
                                        return Dialog(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                          ),
                                          child: SizedBox(
                                            height: 80,
                                            width: 50,
                                            child: Column(
                                              children: [
                                                Padding(
                                                    padding:
                                                        const EdgeInsets.all(8.0),
                                                    child: userIsDeleted ==
                                                            false
                                                        ? Text(
                                                            'User ${userMain.name} is not deleted')
                                                        : Text(
                                                            'User ${userMain.name} is deleted')),
                                                const DeleteDialogWidget()
                                              ],
                                            ),
                                          ),
                                        );
                                      });
                                },
                                child: const Text('Delete user')),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              );
      },
    );
  }
}

class ButtonChangeEmail extends StatelessWidget {
  const ButtonChangeEmail({
    Key? key,
    required this.userMain,
  }) : super(key: key);

  final userMain;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              TextEditingController newEmailController =
                  TextEditingController();
              return Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: SizedBox(
                  height: 150,
                  width: 300,
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Insert new email'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: newEmailController =
                              TextEditingController(),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ))),
                            onPressed: () {
                              String updatedDate =
                                  DateTime.now().toIso8601String();
                              late String newEmail = newEmailController.text;
                              UserDto user = userMain;
                              var updatedUser = UserDto(
                                  userId: user.userId,
                                  name: user.name,
                                  email: newEmail,
                                  createdDate: user.createdDate,
                                  profilePicLink: user.profilePicLink,
                                  updatedDate: updatedDate);
                              context.read<UserBloc>().add(UpdateUserEvent(
                                    user: updatedUser,
                                  ));

                              context.read<UserBloc>().add(ReadUsersEvent());
                              print(newEmail);
                              Navigator.pop(context);
                            },
                            child: const Icon(Icons.check)),
                      )
                    ],
                  ),
                ),
              );
            });
      },
      icon: const Icon(Icons.create_outlined),
      iconSize: 15,
    );
  }
}

class ButtonChangeName extends StatelessWidget {
  const ButtonChangeName({
    Key? key,
    required this.userMain,
  }) : super(key: key);

  final userMain;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              TextEditingController newNameController = TextEditingController();
              return Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: SizedBox(
                  height: 150,
                  width: 300,
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Insert new name'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: newNameController =
                              TextEditingController(),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ))),
                            onPressed: () {
                              String updatedDate =
                                  DateTime.now().toIso8601String();
                              late String newName = newNameController.text;
                              UserDto user = userMain;
                              var updatedUser = UserDto(
                                  userId: user.userId,
                                  name: newName,
                                  email: user.email,
                                  createdDate: user.createdDate,
                                  profilePicLink: user.profilePicLink,
                                  updatedDate: updatedDate);
                              context.read<UserBloc>().add(UpdateUserEvent(
                                    user: updatedUser,
                                  ));

                              context.read<UserBloc>().add(ReadUsersEvent());
                              print(newName);
                              Navigator.pop(context);
                            },
                            child: const Icon(Icons.check)),
                      )
                    ],
                  ),
                ),
              );
            });
      },
      icon: const Icon(Icons.create_outlined),
      iconSize: 15,
    );
  }
}

class DeleteDialogWidget extends StatelessWidget {
  const DeleteDialogWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ))),
        onPressed: () async {
          //закрыть базу
          context.read<UserBloc>().add(ChangeUserEvent(isStartDB: true));
          context.read<UserBloc>().add(ReadUsersEvent());
          context.read<ChatBloc>().add(GetChatIdEvent(-1));
          await DBHelper.instanse.deleteDB();
          Future.delayed(
              const Duration(seconds: 1), () => Navigator.of(context).pushNamed('/'));
        },
        child: const Icon(Icons.check));
  }
}
