part of '../profile_page.dart';

class _AppDialog extends ConsumerStatefulWidget {
  const _AppDialog({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<_AppDialog> createState() => _AppDialogState();
}

class _AppDialogState extends ConsumerState<_AppDialog> {
  @override
  Widget build(BuildContext context) {
    var userMain;
    var userPod = ref.read(River.userPod);
    for (var user in userPod.users!) {
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
                                    const Padding(
                                      padding: EdgeInsets.all(8.0),
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
                                              shape: MaterialStateProperty.all<
                                                      RoundedRectangleBorder>(
                                                  RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                          ))),
                                          onPressed: () async {
                                            String updatedDate = DateTime.now()
                                                .toIso8601String();
                                            late String newUrl =
                                                newUrlController.text;
                                            if (!(await validateImage(
                                                newUrl))) {
                                              Navigator.pop(context);
                                              showDialog(
                                                  context: context,
                                                  builder: (context) =>
                                                      AlertDialog(
                                                        title: const Text(
                                                            'Ошибка'),
                                                        content: const Text(
                                                            "Кривая ссылка"),
                                                        actions: [
                                                          TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      context,
                                                                      'OK'),
                                                              child: const Text(
                                                                  'OK'))
                                                        ],
                                                      ));
                                            } else {
                                              UserDto user = userMain;
                                              var updatedUser = UserDto(
                                                  userId: user.userId,
                                                  name: user.name,
                                                  email: user.email,
                                                  createdDate: user.createdDate,
                                                  profilePicLink: newUrl,
                                                  updatedDate: updatedDate);
                                              ref
                                                  .read(River.userPod.notifier)
                                                  .updateUser(updatedUser);

                                              ref
                                                  .read(River.userPod.notifier)
                                                  .readUser();

                                              print(newUrl);
                                              Navigator.pop(context);
                                            }
                                          },
                                          child: const Icon(Icons.check)),
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
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ))),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(Icons.close_rounded))),
            )
          ],
        ),
      ),
    );
  }
}

Future<bool> validateImage(String imageUrl) async {
  var res;
  try {
    res = await Dio().get(imageUrl);
  } catch (e) {
    return false;
  }

  if (res.statusCode != 200) return false;
  var data = res.headers;
  print("IMAGE $data");
  print(data['content-type'][0]);
  return checkIfImage(data['content-type'][0]);
}

bool checkIfImage(String param) {
  if (param == 'image/jpeg' ||
      param == 'image/png' ||
      param == 'image/gif' ||
      param == 'image/webp') {
    return true;
  }
  return false;
}
