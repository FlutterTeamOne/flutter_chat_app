// ignore_for_file: use_build_context_synchronously

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
      List<UserDto>? users = ref.read(River.userPod).users;
      UserDto? userMain =
          // if (users!.isNotEmpty) {
          //   var s = users.where((element) => element.userId == UserPref.getUserId).toList();
          //   userMain = s[0];
          users?.firstWhere((user) => user.userId == UserPref.getUserId);
      // }

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
        {
          'nameField': 'Password',
          'userPod': userPod,
          'enumUserInfo': EnumUserInfo.password,
          'userMain': userMain,
          'insertText': 'password',
        }
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
    } catch (e) {
      showDialog(
          context: context,
          builder: (context) =>
              ErrorDialog(textTitle: 'Error', textContent: '$e'));
    }
    userPod.changeUser(true);
    await DBHelper.instanse.close();
    ref.invalidate(River.userPod);
    ref.invalidate(River.chatPod);
    ref.invalidate(River.messagePod);
    Navigator.of(context).pushNamed(AuthPage.routeName);
    showDialog(
        context: context,
        builder: (context) => ErrorDialog(
            textTitle: 'Success',
            textContent: 'User ${userMain.name} deleted',
            onPressed: () => Navigator.of(context).pop()));
  }
}
