part of '../../asap_page.dart';

class AllUsersLayout extends StatefulWidget {
  const AllUsersLayout({
    Key? key,
  }) : super(key: key);

  @override
  State<AllUsersLayout> createState() => _AllUsersLayoutState();
}

class _AllUsersLayoutState extends State<AllUsersLayout> {
  final _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColor.colorFFFFFF,
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 22),
        child: Column(
          children: [
            SearchField(controller: _searchController),
            const SizedBox(height: 10),
            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              separatorBuilder: (context, index) => const SizedBox(height: 25),
              itemBuilder: (context, _) => Text(
                'Ruslan',
                style: AppTextStyle.s17Abel,
              ),
              itemCount: 25,
              // separatorBuilder: (context, index) => const SizedBox(height: 25),
            )
          ],
        ),
      ),
    );
  }
}

class UserCard extends StatelessWidget {
  const UserCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
