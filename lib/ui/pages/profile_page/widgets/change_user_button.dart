part of '../profile_page.dart';

class ButtonChangeUser extends ConsumerWidget {
  const ButtonChangeUser(
      {Key? key,
      required this.userMain,
      required this.enumUserInfo,
      required this.insertText})
      : super(key: key);

  final UserDto userMain;
  final EnumUserInfo enumUserInfo;
  final String insertText;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var userPod = ref.read(River.userPod.notifier);

    return IconButton(
      onPressed: () {
        showTextFieldDialog(context, userPod);
      },
      icon: const Icon(Icons.create_outlined),
      iconSize: 15,
    );
  }

  Future<dynamic> showTextFieldDialog(
      BuildContext context, UserNotifier userPod) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          TextEditingController newController = TextEditingController();
          switch (enumUserInfo.index) {
            case 0:
              newController.text = userMain.name;
              break;
            case 1:
              newController.text = userMain.email;
              break;
            default:
              newController.text = '';
          }
          final text = 'Insert new $insertText';
          return TextFieldDialog(
            controller: newController,
            text: text,
            onPressed: () {
              if (enumUserInfo == EnumUserInfo.avatar) {
              } else {
                profileTextFieldLogic(newController, userPod, context);
              }
            },
          );
        });
  }

  void profileTextFieldLogic(TextEditingController newController,
      UserNotifier userPod, BuildContext context) {
    if (newController.text.isNotEmpty &&
        ((enumUserInfo == EnumUserInfo.email) ==
            EmailValidator.validate(newController.text))) {
      String updatedDate = DateTime.now().toIso8601String();
      late String newValue = newController.text;
      final updatedUser = UserDto(
          userId: userMain.userId,
          name: enumUserInfo != EnumUserInfo.name ? userMain.name : newValue,
          email: enumUserInfo != EnumUserInfo.email ? userMain.email : newValue,
          createdDate: userMain.createdDate,
          profilePicLink: userMain.profilePicLink,
          updatedDate: updatedDate);
      userPod.updateUser(updatedUser);

      userPod.readUser();
      print(newValue);
      Navigator.pop(context);
    } else {
      //TODO: Нормально обработать ошибки
      Navigator.pop(context);
      showDialog(
          context: context,
          builder: (context) => const ErrorDialog(
                textTitle: 'Ошибка',
                textContent: 'Попробуйте еще раз',
              ));
    }
  }
}
