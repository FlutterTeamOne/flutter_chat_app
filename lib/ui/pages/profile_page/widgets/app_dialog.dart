part of '../profile_page.dart';

class _AppDialog extends StatefulWidget {
  const _AppDialog({
    Key? key,
  }) : super(key: key);

  @override
  State<_AppDialog> createState() => _AppDialogState();
}

class _AppDialogState extends State<_AppDialog> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        var userMain;
        for (var user in state.users!) {
          if (user.userId == UserPref.getUserId) {
            userMain = user;
            break;
          }
        }
        return Center(
          child: Container(
            width: 350,
            height: 240,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              //
              borderRadius: BorderRadius.circular(15),
              color: Theme.of(context).dialogBackgroundColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Choose image',
                      // Стиль
                      // style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // Способы загрузки фотографии
                    _LoadMethod(onTap: () {}, text: 'Load image'),
                    _LoadMethod(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                TextEditingController newUrlController =
                                    TextEditingController();

                                /// Insert image link
                                return Dialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child: SizedBox(
                                    height: 150,
                                    width: 300,
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text('Insert image link'),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: TextField(
                                            controller: newUrlController =
                                                TextEditingController(),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: ElevatedButton(
                                              style: ButtonStyle(
                                                  shape: MaterialStateProperty
                                                      .all<RoundedRectangleBorder>(
                                                          RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20.0),
                                              ))),
                                              onPressed: () {
                                                String updatedDate =
                                                    DateTime.now()
                                                        .toIso8601String();
                                                late String newUrl =
                                                    newUrlController.text;
                                                UserDto user = userMain;
                                                var updatedUser = UserDto(
                                                    userId: user.userId,
                                                    name: user.name,
                                                    email: user.email,
                                                    createdDate:
                                                        user.createdDate,
                                                    profilePicLink: newUrl,
                                                    updatedDate: updatedDate);
                                                context
                                                    .read<UserBloc>()
                                                    .add(UpdateUserEvent(
                                                      user: updatedUser,
                                                    ));

                                                context
                                                    .read<UserBloc>()
                                                    .add(ReadUsersEvent());
                                                print(newUrl);
                                                Navigator.pop(context);
                                              },
                                              child: Icon(Icons.check)),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              });
                        },
                        text: 'Load image from url'),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                      child: ElevatedButton(
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ))),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Icon(Icons.close_rounded))),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
