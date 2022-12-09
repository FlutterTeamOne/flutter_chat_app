part of '../../profile_page.dart';

class _ProfileLayout extends StatelessWidget {
  const _ProfileLayout({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        return ListView(
          children: [
            // Фон и аватарка
            Stack(
              children: [
                const SizedBox(height: 205),
                // Фон
                _AppBluredImage(image: state.users![0].profilePicLink),
                // Аватарка
                _UserPic(userPic: state.users![0].profilePicLink),
                // Кнопка изменение аву
                const _ChangeUserPic()
              ],
            ),
            // Остальное
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Username',
                    // Стиль
                    // style: TextStyle(
                    //     fontWeight: FontWeight.w500,
                    //     color: AppColor.color000000.withOpacity(0.6)),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    state.users?[0].name ?? 'unknow',
                    // Стиль
                    // style: const TextStyle(
                    //     fontSize: 16, color: AppColor.color000000),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Email',
                    // Стиль
                    // style: TextStyle(
                    //     fontWeight: FontWeight.w500,
                    //     color: AppColor.color000000.withOpacity(0.6)),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    state.users?[0].email ?? '???',
                    // Цвет
                    // style: const TextStyle(
                    //     fontSize: 16, color: AppColor.color000000),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
