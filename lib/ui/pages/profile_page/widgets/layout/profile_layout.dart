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

      ///TODO: Добавить проверку на userMain == null
      ///Если нулл, выйти из аккаунта

      ///Лист для Отображения информации о юзере
      final List<Map<String, dynamic>> userInfo = [
        {
          'nameField': 'Name',
          'userPod': userPod,
          'enumUserInfo': EnumUserInfo.name,
          'userMain': userMain,
          'insertText': 'name',
        },
        {
          'nameField': 'Email',
          'userPod': userPod,
          'enumUserInfo': EnumUserInfo.email,
          'userMain': userMain,
          'insertText': 'email',
        },
      ];
      return ListView(
        children: [
          // Фон и аватарка
          AvatarProfilePage(
              userMain: userMain!, userPod: userPod, chatPod: chatPod),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ///
                ///Отображение информации о юзере
                ///
                ListView.separated(
                    itemCount: userInfo.length,
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 5),
                    itemBuilder: (context, index) => FieldWithChange(
                          info: userInfo[index],
                        )),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    ElevatedButton(
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ))),
                        onPressed: () => _deleteUserLogic(
                            userPod: userPod,
                            userMain: userMain,
                            context: context,
                            ref: ref,
                            chatPod: chatPod),
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

  void _deleteUserLogic(
      {required UserNotifier userPod,
      required UserDto userMain,
      required BuildContext context,
      required WidgetRef ref,
      required ChatNotifier chatPod}) async {
    try {
      userPod.deleteUser(userMain.userId!);
      Navigator.of(context).pushNamed(AuthPage.routeName);
    } catch (e) {
      showDialog(
          context: context,
          builder: (context) =>
              ErrorDialog(textTitle: 'Error', textContent: '$e'));
    }
    showDialog(
        context: context,
        builder: (context) => ErrorDialog(
              textTitle: 'Success',
              textContent: 'User ${userMain.name} deleted',
              onPressed: () async {
                userPod.changeUser(true);
                chatPod.getChatId(-1);
                await DBHelper.instanse.deleteDB();
                userPod.readUser();

                Navigator.of(context).pushNamed(AuthPage.routeName);
              },
            ));
  }
}
