part of '../../profile_page.dart';

class _ProfileLayout extends StatelessWidget {
  const _ProfileLayout({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        late UserDto userMain;
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
                    // context.read<ChatBloc>().close();
                    //закрыть базу
                    await DBHelper.instanse.close();
                    Navigator.of(context).pop();
                    context.read<UserBloc>().add(ChangeUserEvent(userDb: true));
                    context.read<UserBloc>().add(ReadUsersEvent());
                    context.read<ChatBloc>().add(GetChatIdEvent(-1));
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
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              final userIsDeleted =
                                  context.watch<UserBloc>().state.isDeleted;
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
                                          padding: EdgeInsets.all(8.0),
                                          child: userIsDeleted == false
                                              ? Text(
                                                  'User ${userMain.name} is not deleted')
                                              : Text(
                                                  'User ${userMain.name} is deleted')),
                                      DeletedButtonWidget()
                                    ],
                                  ),
                                ),
                              );
                            });
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

class DeletedButtonWidget extends StatelessWidget {
  const DeletedButtonWidget({
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
          await DBHelper.instanse.close();
          await DBHelper.instanse.deleteDB();
          Navigator.of(context).pushNamed('/');
          context.read<UserBloc>().add(ChangeUserEvent(userDb: true));
          context.read<UserBloc>().add(ReadUsersEvent());
          context.read<ChatBloc>().add(GetChatIdEvent(-1));
        },
        child: const Icon(Icons.check));
  }
}
