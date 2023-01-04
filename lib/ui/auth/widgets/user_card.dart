part of '../authorization_page.dart';

class UserCard extends StatelessWidget {
  const UserCard({super.key, required this.user});

  final UserDto user;

  @override
  Widget build(BuildContext context) {
    return Column(
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
                var db = await DBHelper.instanse.initDB();
                print("db open? ${db.path},${db.isOpen}");
                Future.delayed(
                    Duration(seconds: 1),
                    () =>
                        Navigator.of(context).pushNamed(MainLayout.routeName));
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(user.profilePicLink,
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
