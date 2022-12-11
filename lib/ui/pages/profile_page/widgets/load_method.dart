part of '../profile_page.dart';

class _LoadMethod extends StatelessWidget {
  const _LoadMethod({
    Key? key,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  final String text;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(20),
      child: InkWell(

        borderRadius: BorderRadius.circular(20),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 15,
          ),
          decoration: BoxDecoration(
            // Цвет
            color: Theme.of(context).dividerColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: Theme.of(context).primaryColor,
                child: Icon(Icons.add_photo_alternate, size: 25,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              Text(text)
            ],
          ),
        ),
      ),
    );
  }
}
