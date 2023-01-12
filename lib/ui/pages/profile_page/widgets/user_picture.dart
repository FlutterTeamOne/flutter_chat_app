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
      child: Container(
        height: 125,
        width: 125,
        decoration: BoxDecoration(
          image: userPic.isEmpty
              ? const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                      'assets/images/user_images/defaultUserAvatar.png'))
              : DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(userPic),
                ),
          borderRadius: BorderRadius.circular(10),
          // Цвет
          // color: AppColor.color9E9E9E,
        ),
      ),
    );
  }
}
