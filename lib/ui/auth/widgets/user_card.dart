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
            userBloc.add(ChangeUserEvent(user: widget.user, userDb: false));
            UserPref.setUserId = widget.user.userId!;
            UserPath.user = widget.user;
            await DBHelper.instanse.initDB();
            userBloc.add(ReadUsersEvent());
            Navigator.of(context).pushNamed(MainLayout.routeName);
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: widget.user.profilePicLink.endsWith('.png')
                ? Image.asset(widget.user.profilePicLink,
                    fit: BoxFit.cover, width: 150, height: 150)
                : Image.network(widget.user.profilePicLink,
                    fit: BoxFit.cover, width: 150, height: 150),
          ),
        ),
        Text(
          widget.user.email,
          style: const TextStyle(fontSize: 50),
        ),
        // const SizedBox(height: 10),
      ],
    );
  }
}
