part of '../../profile_page.dart';

class _ProfileLayout extends StatelessWidget {
  const _ProfileLayout({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      var userPod = ref.read(River.userPod.notifier);
      var chatPod = ref.read(River.chatPod.notifier);
      var users = ref.watch(River.userPod).users;
      var userMain;
      for (var user in users!) {
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
                    ExitButton(userPod: userPod, chatPod: chatPod),
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
                                userPod.deleteUser(userMain.userId);

                                print(userMain.userId);
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      final userIsDeleted =
                                          ref.read(River.userPod).isDeleted;
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
                                                  child: userIsDeleted == false
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
    });
  }
}

class ExitButton extends StatelessWidget {
  const ExitButton({
    Key? key,
    required this.userPod,
    required this.chatPod,
  }) : super(key: key);

  final UserNotifier userPod;
  final ChatNotifier chatPod;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16),
      child: IconButton(
          onPressed: () async {
            // context.read<ChatBloc>().close();
            //закрыть базу
            userPod.changeUser(true);
            userPod.readUser();
            chatPod.getChatId(-1);
            await DBHelper.instanse.close();
            //await DBHelperStart.instanse.initDB();
            Future.delayed(const Duration(seconds: 1),
                () => Navigator.of(context).pushNamed(AuthPage.routeName));
          },
          icon: const Icon(Icons.exit_to_app),
          style: const ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(Colors.white),
            padding: MaterialStatePropertyAll(EdgeInsets.all(10)),
            shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
              topRight: Radius.circular(20),
              bottomLeft: Radius.circular(20),
            ))),
          )),
    );
  }
}

class ButtonChangeEmail extends ConsumerWidget {
  const ButtonChangeEmail({
    Key? key,
    required this.userMain,
  }) : super(key: key);

  final userMain;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var userPod = ref.read(River.userPod.notifier);

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
                              userPod.updateUser(updatedUser);

                              //userPod.readUser();
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

class ButtonChangeName extends ConsumerWidget {
  const ButtonChangeName({
    Key? key,
    required this.userMain,
  }) : super(key: key);

  final userMain;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var userPod = ref.read(River.userPod.notifier);

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
                              userPod.updateUser(updatedUser);
                              userPod.readUser();

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

class DeleteDialogWidget extends ConsumerWidget {
  const DeleteDialogWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var userPod = ref.read(River.userPod.notifier);
    var chatPod = ref.read(River.chatPod.notifier);

    return ElevatedButton(
        style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ))),
        onPressed: () async {
          //закрыть базу
          userPod.changeUser(true);
          userPod.readUser();
          chatPod.getChatId(-1);
          //await DBHelperStart.instanse.initDB();
          await DBHelper.instanse.deleteDB();
          Future.delayed(const Duration(seconds: 1),
              () => Navigator.of(context).pushNamed('/'));
        },
        child: const Icon(Icons.check));
  }
}
