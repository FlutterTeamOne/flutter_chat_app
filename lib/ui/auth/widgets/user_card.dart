part of '../authorization_page.dart';

class UserCard extends StatelessWidget {
  const UserCard({super.key, required this.text, required this.image});

  final String text;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: SizedBox.fromSize(
            size: Size.fromRadius(120),
            child: Image.network(image, fit: BoxFit.cover),
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
