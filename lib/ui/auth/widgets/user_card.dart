part of '../authorization_page.dart';

class UserCard extends StatelessWidget {
  const UserCard({super.key, required this.user});

  final UserDto user;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Consumer(
          builder: (context, ref, _) {
            var userPod = ref.read(River.userPod.notifier);
            return InkWell(
              hoverColor: Colors.transparent,
              focusColor: Colors.transparent,
              onTap: () async {
                userPod.changeUser(false);
                UserPref.setUserId = user.userId!;
                UserPath.user = user;
                //await DBHelperStart.instanse.close();
                var db = await DBHelper.instanse.initDB();
                print("db open? ${db.path},${db.isOpen}");
                Navigator.of(context).pushNamed(MainLayout.routeName);
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  user.profilePicLink,
                  fit: BoxFit.cover,
                  //При уменьшении экрана по горизонтали, карточки смещаются, и отображаются не как надо
                  //нужно исправить проблему, при использовании cache/Width/Height правильно отображается но
                  //теряется качество и растягивается фото, а при использовании просто height/width
                  //качество остается хорошей но при уменьшении экрана не правильно отображается
                  cacheWidth: 150,
                  cacheHeight: 150,
                ),
              ),
            );
          },
        ),
        Text(
          user.email,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.headline6,
        ),
      ],
    );
  }
}
