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
          onTap: (() {}),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: SizedBox.fromSize(
              size: Size.fromRadius(120),
              child: Image.network(widget.image, fit: BoxFit.cover),
            ),
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
