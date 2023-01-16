part of '../profile_page.dart';

class _UserPic extends StatelessWidget {
  const _UserPic({
    Key? key,
    required this.userPic,
  }) : super(key: key);

  final String userPic;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 5,
      left: 15,
      child: SizedBox(
        height: 125,
        width: 125,
        child: CachedImageWidget(
          url: userPic,
          width: 125,
          height: 125,
        ),
      ),
    );
  }
}
