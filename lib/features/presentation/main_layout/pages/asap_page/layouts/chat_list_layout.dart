part of '../asap_page.dart';

class _ChatListLayout extends StatefulWidget {
  const _ChatListLayout({
    Key? key,
  }) : super(key: key);

  @override
  State<_ChatListLayout> createState() => _ChatListLayoutState();
}

class _ChatListLayoutState extends State<_ChatListLayout> {
  final _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // final currentWith = MediaQuery.of(context).size.width;
    return Drawer(
      backgroundColor: AppColor.colorFFFFFF,
      shape: Border.all(
        color: AppColor.color9E9E9E.withOpacity(0.5),
      ),
      elevation: 0,
      child: ListView(
        children: [
          _SearchField(controller: _searchController),
          const SizedBox(height: 5),
          ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            separatorBuilder: (context, index) => const SizedBox(height: 25),
            itemCount: 11,
            itemBuilder: (context, index) {
              // if (currentWith < 655) {
              //   return const UserCard(
              //     image:
              //         'https://music.mathwatha.com/wp-content/uploads/2017/08/tonyprofile-300x300.jpg',
              //     name: 'Tony Carbonaro',
              //   );
              // } else {
              return const UserCard(
                name: 'Tony Carbonaro',
                image:
                    'https://music.mathwatha.com/wp-content/uploads/2017/08/tonyprofile-300x300.jpg',
                message: 'This is the long text for example, long text',
              );
              // }
            },
          ),
        ],
      ),
    );
  }
}
