part of '../../profile_page.dart';

class _ProfileLayout extends StatelessWidget {
  const _ProfileLayout({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        var userMain;
        for (var user in state.users!) {
          if (user.userId == UserPref.getUserId) {
            userMain = user;
            break;
          }
        }
        return ListView(
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
                    context.read<UserBloc>().add(ChangeUserEvent(userDb: true));
                    context.read<UserBloc>().add(ReadUsersEvent());
                    //закрыть базу
                    await DBHelper.instanse.close();
                    Navigator.of(context).pop();
                  },
                  icon: Icon(Icons.arrow_back),
                ),
              ],
            ),
            // Остальное
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Username',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  const SizedBox(height: 2),
                  Text(
                    userMain.name ?? 'unknow',
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Email',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  const SizedBox(height: 2),
                  Text(
                    userMain.email ?? '???',
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ))),
                      onPressed: () {
                        context
                            .read<UserBloc>()
                            .add(DeleteUserEvent(userId: userMain.userId));
                        print(userMain.userId);
                      },
                      child: Text('Delete user')),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
