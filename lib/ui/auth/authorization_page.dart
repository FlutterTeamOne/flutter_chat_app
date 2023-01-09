import 'package:chat_app/modules/signal_service/river/user_ref/user_state_ref.dart';
import 'package:chat_app/modules/storage_manager/db_helper/db_helper_start.dart';
import 'package:chat_app/modules/storage_manager/db_helper/user_path.dart';
import 'package:chat_app/ui/pages/main_layout.dart';
import 'package:chat_app/ui/pages/registration_page/registration_page.dart';

import '../../modules/signal_service/river/river.dart';
import '../../src/libraries/library_all.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
part '../auth/widgets/user_card.dart';

class AuthPage extends ConsumerStatefulWidget {
  const AuthPage({super.key});
  static const routeName = '/';

  @override
  ConsumerState<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends ConsumerState<AuthPage> {
  @override
  void initState() {
    super.initState();
    ref.read(River.futureUserPod);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer(builder: (context, ref, _) {
        List<UserDto>? users;
        users = ref.watch(River.userPod).users;
        return users == null
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  Center(
                    child: SizedBox(
                      height: 300,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: users.length,
                        itemBuilder: ((context, index) =>
                            UserCard(user: users![index])),
                      ),
                    ),
                  ),
                  ElevatedButton(
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ))),
                      onPressed: () {
                        Navigator.of(context)
                            .pushNamed(RegistrationPage.routeName);
                      },
                      child: const Text('Create new user')),
                ],
              );
      }),
    );
  }
}
