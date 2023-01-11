part of '../profile_page.dart';

class AvatarProfilePage extends StatelessWidget {
  const AvatarProfilePage({
    Key? key,
    required this.userMain,
    required this.userPod,
    required this.chatPod,
  }) : super(key: key);

  final UserDto userMain;
  final UserNotifier userPod;
  final ChatNotifier chatPod;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const SizedBox(height: 205),
        // Фон
        _AppBluredImage(image: userMain.profilePicLink),
        // Аватарка
        _UserPic(userPic: userMain.profilePicLink),
        // Кнопка изменение аву
        const _ChangeUserPic(),
        ExitButton(userPod: userPod, chatPod: chatPod),
      ],
    );
  }
}