part of '../asap_page.dart';

class UserChatLayout extends StatelessWidget {
  const UserChatLayout({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const _ChatAppBar(
          image:
              'https://music.mathwatha.com/wp-content/uploads/2017/08/tonyprofile-300x300.jpg',
          name: 'Tony',
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(10),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: AppColor.colorFFFFFF,
            child: Expanded(
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) => const MyMessageCard(),
              ),
            ),
          ),
        ),
        const _TextInput(),
      ],
    );
  }
}
