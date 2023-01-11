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
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child: SizedBox(
                                    height: 80,
                                    width: 50,
                                    child: Column(
                                      children: [
                                        Padding(
                                            padding: const EdgeInsets.all(8.0),
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
