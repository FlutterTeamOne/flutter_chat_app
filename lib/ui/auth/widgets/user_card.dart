part of '../authorization_page.dart';

class UserCard extends StatelessWidget {
  const UserCard({super.key, required this.user});

  final UserDto user;

  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;
    return Consumer(
      builder: (context, ref, _) {
        var userPod = ref.read(River.userPod.notifier);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              overlayColor: MaterialStateProperty.all(Colors.transparent),
              onTap: () async {
                userPod.changeUser(false);
                UserPref.setUserId = user.userId!;
                UserPath.user = user;
                //await DBHelperStart.instanse.close();
                var db = await DBHelper.instanse.initDB();
                print("db open? ${db.path},${db.isOpen}");
                showDialog(
                  context: context,
                  builder: (context) => ConfirmPasswordDialog(user: user),
                );

                ///TODO: Проверка пароля пользователя
                ///1. Сверить Пароль введенный с паролем на сервере
                ///Если нет, вывести ошибку "Неверный пароль"
                ///
                ///TODO: Проверка что все хорошо в таблице MainUser и юзер такой заполнен
                ///Если база открыта, то
                ///1.Проерить Таблицу MainUser на наличие юзера
                ///2.Проверить поля в таблице User
                ///Если нет, вывести ошибку "Попробуйте еще раз", удалить базу
              },
              // CachedNetworkImage позволяет кешировать изображение
              child: CachedImageWidget(
                url: user.profilePicLink,
                errorText: 'sorry, your image\ncould not be displayed',
                height: 125,
                width: 125,
              ),
            ),
            Text(
              user.email,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: currentWidth > 900
                  ? Theme.of(context).textTheme.headline6
                  : Theme.of(context).textTheme.titleSmall,
            )
          ],
        );
      },
    );
  }
}
