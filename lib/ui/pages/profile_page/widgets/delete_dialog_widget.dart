part of '../profile_page.dart';

class DeleteDialogWidget extends ConsumerWidget {
  const DeleteDialogWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var userPod = ref.read(River.userPod.notifier);
    var chatPod = ref.read(River.chatPod.notifier);

    return ElevatedButton(
        style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ))),
        onPressed: () async {
          //закрыть базу
          userPod.changeUser(true);
          userPod.readUser();
          chatPod.getChatId(-1);
          await DBHelper.instanse.deleteDB();
          Future.delayed(const Duration(seconds: 1),
              () => Navigator.of(context).pushNamed(AuthPage.routeName));
        },
        child: const Icon(Icons.check));
  }
}
