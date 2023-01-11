part of '../../profile_page.dart';

class ProfileLayout extends StatelessWidget {
  const ProfileLayout({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      UserNotifier userPod = ref.read(River.userPod.notifier);
      ChatNotifier chatPod = ref.read(River.chatPod.notifier);
      List<UserDto>? users = ref.watch(River.userPod).users;
      UserDto? userMain =
          users?.firstWhere((user) => user.userId == UserPref.getUserId);
      return userMain == null
          ? const Center(
              widthFactor: 100,
              heightFactor: 100,
              child: CircularProgressIndicator())
          : ListView(
              children: [
                // Фон и аватарка
                AvatarProfilePage(
                    userMain: userMain, userPod: userPod, chatPod: chatPod),
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
                            userMain.name,
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                          // Кнопка смены имени
                          ButtonChangeUser(userMain: userMain, isEmail: false)
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
                            userMain.email,
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                          ButtonChangeUser(userMain: userMain, isEmail: true)
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
                                userPod.deleteUser(userMain.userId!);

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
                                    }).whenComplete(() => Navigator.of(
                                        context)
                                    .pushNamed(AuthPage.routeName));
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


