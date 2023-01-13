part of '../authorization_page.dart';

class UserCard extends StatelessWidget {
  const UserCard({super.key, required this.user, required this.index});
  final int index;
  final UserDto user;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Consumer(
          builder: (context, ref, _) {
            var userPod = ref.read(River.userPod.notifier);
            return InkWell(
              key: Key('UserButton $index'),
              hoverColor: Colors.transparent,
              focusColor: Colors.transparent,
              onTap: () async {
                userPod.changeUser(false);
                UserPref.setUserId = user.userId!;
                UserPath.user = user;
                //await DBHelperStart.instanse.close();
                var db = await DBHelper.instanse.initDB();
                print("db open? ${db.path},${db.isOpen}");

                ///TODO: Проверка пароля пользователя
                ///1. Сверить Пароль введенный с паролем на сервере
                ///Если нет, вывести ошибку "Неверный пароль"
                ///
                ///TODO: Проверка что все хорошо в таблице MainUser и юзер такой заполнен
                ///Если база открыта, то
                ///1.Проерить Таблицу MainUser на наличие юзера
                ///2.Проверить поля в таблице User
                ///Если нет, вывести ошибку "Попробуйте еще раз", удалить базу

                Navigator.of(context).pushNamed(MainLayout.routeName);
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: user.profilePicLink.isEmpty
                    ? Image.asset(
                        'assets/images/user_images/defaultUserAvatar.png')
                    : Image.network(user.profilePicLink,
                        fit: BoxFit.cover, width: 150, height: 150),
              ),
            );
          },
        ),
        Text(
          user.email,
          style: Theme.of(context).textTheme.headline6,
        ),
        // const SizedBox(height: 10),
      ],
    );
  }
}
