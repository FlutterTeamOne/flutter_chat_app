part of '../profile_page.dart';

class ExitButton extends StatelessWidget {
  const ExitButton({
    Key? key,
    required this.userPod,
    required this.chatPod,
  }) : super(key: key);

  final UserNotifier userPod;
  final ChatNotifier chatPod;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16),
      child: IconButton(
          onPressed: () async {
            // context.read<ChatBloc>().close();
            //закрыть базу
            userPod.changeUser(true);
            userPod.readUser();
            chatPod.getChatId(-1);
            await DBHelper.instanse.close();
            Future.delayed(const Duration(seconds: 1),
                () => Navigator.of(context).pushNamed('/'));
          },
          icon: const Icon(Icons.exit_to_app, color: Colors.black87,),
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
