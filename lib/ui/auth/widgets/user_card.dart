part of '../authorization_page.dart';

class UserCard extends StatefulWidget {
  const UserCard({super.key, required this.user});

  final UserDto user;

  @override
  State<UserCard> createState() => _UserCardState();
}

class _UserCardState extends State<UserCard> {
  @override
  Widget build(BuildContext context) {
    var userBloc = context.read<UserBloc>();

    return Column(
      children: [
        InkWell(
          hoverColor: Colors.transparent,
          focusColor: Colors.transparent,
          onTap: () async {
            userBloc.add(ChangeUserEvent(user: widget.user, isStartDB: false));
            UserPref.setUserId = widget.user.userId!;
            UserPath.user = widget.user;
            var db = await DBHelper.instanse.initDB();
            print("db open? ${db.path},${db.isOpen}");
            Future.delayed(Duration(seconds: 1),
                () => Navigator.of(context).pushNamed(MainLayout.routeName));
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(widget.user.profilePicLink,
                fit: BoxFit.cover, width: 150, height: 150),
          ),
        ),
        Text(
          widget.user.email,
          style: Theme.of(context).textTheme.headline6,
        ),
        // const SizedBox(height: 10),
      ],
    );
  }
}
