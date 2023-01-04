part of '../profile_page.dart';

class _ChangeUserPic extends StatelessWidget {
  const _ChangeUserPic({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 115,
      child: InkWell(
        onTap: () => showDialog(
            context: context, builder: (context) => const _AppDialog()),
        child: CircleAvatar(
          radius: 18,
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Center(
              child: Icon(
                Icons.add_photo_alternate_rounded,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
