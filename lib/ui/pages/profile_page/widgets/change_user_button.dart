part of '../profile_page.dart';

class ButtonChangeUser extends ConsumerWidget {
  const ButtonChangeUser({
    Key? key,
    required this.userMain,
    required this.isEmail,
  }) : super(key: key);

  final UserDto userMain;
  final bool isEmail;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var userPod = ref.read(River.userPod.notifier);

    return IconButton(
      onPressed: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              TextEditingController newEmailController =
                  TextEditingController();
              newEmailController.text =
                  isEmail ? userMain.email : userMain.name;
              final text = isEmail ? 'Insert new email' : 'Insert new name';
              return TextFieldDialog(
                controller: newEmailController,
                text: text,
                userMain: userMain,
                userPod: userPod,
                onPressed: () {
                  if (newEmailController.text.isNotEmpty &&
                      isEmail ==
                          EmailValidator.validate(newEmailController.text)) {
                    String updatedDate = DateTime.now().toIso8601String();
                    late String newValue = newEmailController.text;
                    final updatedUser = UserDto(
                        userId: userMain.userId,
                        name: isEmail ? userMain.name : newValue,
                        email: isEmail ? newValue : userMain.email,
                        createdDate: userMain.createdDate,
                        profilePicLink: userMain.profilePicLink,
                        updatedDate: updatedDate);
                    userPod.updateUser(updatedUser);

                    userPod.readUser();
                    print(newValue);
                    Navigator.pop(context);
                  }
                },
              );
            });
      },
      icon: const Icon(Icons.create_outlined),
      iconSize: 15,
    );
  }
}
