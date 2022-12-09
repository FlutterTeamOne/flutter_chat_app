part of '../profile_page.dart';

class _AppBluredImage extends StatelessWidget {
  const _AppBluredImage({
    Key? key,
    required this.image,
  }) : super(key: key);
  final String image;
  @override
  Widget build(BuildContext context) {
    return Blur(
      blur: 5.5,
      // Цвет
      // blurColor: AppColor.color000000.withOpacity(0.1),
      colorOpacity: 0.1,
      child: Container(
        width: double.infinity,
        height: 175,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(image),
          ),
        ),
      ),
    );
  }
}
