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
    final currentWidth = MediaQuery.of(context).size.width;
    adaptation() {
      if (currentWidth > 1200) {
        return 8;
      } else if (currentWidth < 800) {
        return 5;
      } else {
        return 6;
      }
    }

    return Scaffold(
      floatingActionButton: ElevatedButton(
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all(Theme.of(context).primaryColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
        ),
        onPressed: () {
          Navigator.of(context).pushNamed(RegistrationPage.routeName);
        },
        child: Text(
          'Create new user',
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ),
      body: Consumer(builder: (context, ref, _) {
        List<UserDto>? users;
        users = ref.watch(River.userPod).users;
        return users == null
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      const SizedBox(height: 30),
                      Text(
                        'Welcome',
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                      Text(
                        'choose user',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const SizedBox(height: 50),
                      Wrap(
                        children: [
                          GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: adaptation(),
                              crossAxisSpacing: 15,
                              mainAxisSpacing: currentWidth > 900 ? 35 : 25,
                            ),
                            shrinkWrap: true,
                            itemCount: users.length,
                            itemBuilder: (context, index) {
                              return UserCard(
                                user: users![index],
                              );
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              );
      }),
    );
  }
}
