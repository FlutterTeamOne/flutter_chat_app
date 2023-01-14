part of '../authorization_page.dart';

class ImageCard extends StatelessWidget {
  const ImageCard({
    Key? key,
    this.image,
    this.child,
  }) : super(key: key);

  final DecorationImage? image;
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 125,
      height: 125,
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).disabledColor,
          width: 0.5,
        ),
        image: image,
        borderRadius: BorderRadius.circular(20),
      ),
      child: child,
    );
  }
}
