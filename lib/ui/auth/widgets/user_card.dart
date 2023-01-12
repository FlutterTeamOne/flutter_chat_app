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
        return Wrap(
          alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
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
                // ignore: use_build_context_synchronously
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
