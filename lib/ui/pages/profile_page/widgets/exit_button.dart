part of '../profile_page.dart';

class ExitButton extends ConsumerWidget {
  const ExitButton({
    Key? key,
    required this.userPod,
    required this.chatPod,
  }) : super(key: key);

  final UserNotifier userPod;
  final ChatNotifier chatPod;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16),
      child: IconButton(
          color: Colors.black87,
          onPressed: () async {
            // context.read<ChatBloc>().close();
            //закрыть базу
            userPod.changeUser(true);

            //chatPod.getChatId(-1);

            await DBHelper.instanse.close();
            ref.read(River.messagePod.notifier).disconnect();
            ref.invalidate(River.userPod);
            ref.invalidate(River.chatPod);
            ref.invalidate(River.messagePod);
            // UserNotifier().dispose();
            // userPod.dispose();
            // ChatNotifier().dispose();
            // MessageNotifier().dispose();
            // ref.exists(River.userPod);

            //  ref.exists(River.chatPod);
            //   ref.exists(River.messagePod);
            Navigator.of(context).pushNamed(AuthPage.routeName);
          },
          icon: const Icon(Icons.exit_to_app),
          style: const ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(Colors.white),
            padding: MaterialStatePropertyAll(EdgeInsets.all(10)),
            shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
              topRight: Radius.circular(20),
              bottomLeft: Radius.circular(20),
            ))),
          )),
    );
  }
}
