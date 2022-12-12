part of '../authorization_page.dart';

class UserCard extends StatelessWidget {
  const UserCard({super.key, required this.text, required this.image});

  final String text;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 200,
          height: 200,
          child: Placeholder(
            child: Image.network(image),
          ),
        ),
        Text(
          text,
          style: const TextStyle(fontSize: 50),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
