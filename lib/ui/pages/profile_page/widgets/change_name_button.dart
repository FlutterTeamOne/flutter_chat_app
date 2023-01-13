// ignore_for_file: avoid_print

part of '../profile_page.dart';

class ButtonChangeName extends ConsumerWidget {
  const ButtonChangeName({
    Key? key,
    required this.userMain,
  }) : super(key: key);

  final UserDto userMain;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var userPod = ref.read(River.userPod.notifier);

    return IconButton(
      onPressed: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              TextEditingController newNameController = TextEditingController();
              return Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: SizedBox(
                  height: 150,
                  width: 300,
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Insert new name'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: newNameController =
                              TextEditingController(),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ))),
                            onPressed: () {
                              String updatedDate =
                                  DateTime.now().toIso8601String();
                              late String newName = newNameController.text;
                              UserDto user = userMain;
                              var updatedUser = UserDto(
                                  userId: user.userId,
                                  name: newName,
                                  email: user.email,
                                  createdDate: user.createdDate,
                                  profilePicLink: user.profilePicLink,
                                  updatedDate: updatedDate);
                              userPod.updateUser(updatedUser);
                              userPod.readUser();

                              /// TODO: refactor print
                              print(newName);
                              Navigator.pop(context);
                            },
                            child: const Icon(Icons.check)),
                      )
                    ],
                  ),
                ),
              );
            });
      },
      icon: const Icon(Icons.create_outlined),
      iconSize: 15,
    );
  }
}
