part of '../asap_page.dart';

class _ChatAppBar extends StatelessWidget {
  const _ChatAppBar({
    Key? key,
    required this.image,
    required this.name,
  }) : super(key: key);
  final String image;
  final String name;

  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;
    return Container(
      width: MediaQuery.of(context).size.width * 0.75,
      height: MediaQuery.of(context).size.height * 0.077,
      decoration: BoxDecoration(
        color: AppColor.colorFFFFFF,
        border: Border(
          left: BorderSide.none,
          right: BorderSide(
            color: AppColor.color9E9E9E.withOpacity(0.5),
          ),
          bottom: BorderSide(
            color: AppColor.color9E9E9E.withOpacity(0.5),
          ),
          top: BorderSide(
            color: AppColor.color9E9E9E.withOpacity(0.5),
          ),
        ),
      ),
      child: Row(
        children: [
          const SizedBox(width: 15),
          ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Image.network(
              image,
              scale: 6,
            ),
          ),
          const SizedBox(width: 15),
          Text(name, style: AppTextStyle.s17Abel.copyWith(fontSize: 20)),
          const SizedBox(width: 15),
          Text(currentWidth.toString()),
        ],
      ),
    );
  }
}
