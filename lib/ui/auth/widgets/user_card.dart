part of '../authorization_page.dart';

class UserCard extends StatefulWidget {
  const UserCard({super.key, required this.text, required this.image});

  final String text;
  final String image;

  @override
  State<UserCard> createState() => _UserCardState();
}

class _UserCardState extends State<UserCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          hoverColor: Colors.transparent,
          focusColor: Colors.transparent,
          onTap: (() {}),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(widget.image,
                fit: BoxFit.cover, width: 150, height: 150),
          ),
        ),
        Text(
          widget.text,
          style: const TextStyle(fontSize: 50),
        ),
        // const SizedBox(height: 10),
      ],
    );
  }
}
