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
      borderRadius: BorderRadius.circular(5),
      child: InkWell(
        borderRadius: BorderRadius.circular(5),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 15,
          ),
          decoration: BoxDecoration(
            // Цвет
            // color: AppColor.color000000.withOpacity(0.4),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Column(
            children: [
              const CircleAvatar(
                radius: 55,
                // Цвет
                // backgroundColor: AppColor.color7E57C2,
                child: Icon(Icons.add_photo_alternate, size: 26),
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
