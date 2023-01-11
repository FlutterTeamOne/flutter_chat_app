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
    var userPod = ref.read(River.userPod);
    var userMain =
        userPod.users?.firstWhere((user) => user.userId == UserPref.getUserId);
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
              children: const [
                Text(
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
                    onTap: () async {
                      await ShowTextFieldDialog.showTextFieldDialog(
                          context: context,
                          userPod: ref.read(River.userPod.notifier),
                          enumUserInfo: EnumUserInfo.avatar,
                          userMain: userMain!,
                          insertText: "image URL");
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
