part of '../authorization_page.dart';

class UserCard extends StatelessWidget {
  const UserCard({super.key, required this.user, required this.index});
  final int index;
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
              key: Key('UserButton $index'),
              overlayColor: MaterialStateProperty.all(Colors.transparent),
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
              // CachedNetworkImage позволяет кешировать изображение
              child: CachedNetworkImage(
                width: 125,
                height: 125,
                imageUrl: user.profilePicLink,
                imageBuilder: (context, imageProvider) => ImageCard(
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
                // placeholder будет ставить виджет пока загружается картинка
                placeholder: (context, url) => const ImageCard(
                  child: Center(child: CircularProgressIndicator()),
                ),
                // errorWidget же при возникновении ошибки отображать
                errorWidget: (context, url, error) => ImageCard(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.error,
                        color: Theme.of(context).errorColor,
                        size: 26,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'sorry, your image\ncould not be displayed',
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .subtitle2
                            ?.copyWith(fontSize: 12),
                      ),
                    ],
                  ),
                ),
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
