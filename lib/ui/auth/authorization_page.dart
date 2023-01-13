import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_app/modules/storage_manager/db_helper/user_path.dart';
import 'package:chat_app/ui/pages/main_layout.dart';
import 'package:chat_app/ui/pages/registration_page/registration_page.dart';
import '../../modules/signal_service/river/river.dart';
import '../../src/libraries/library_all.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
part '../auth/widgets/user_card.dart';
part 'widgets/image_card.dart';

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
      if (currentWidth < 1420) {
        if (currentWidth < 1300) {
          if (currentWidth < 1160) {
            if (currentWidth < 1030) {
              if (currentWidth < 880) {
                return 5;
              }
              return 6;
            }
            return 7;
          }
          return 8;
        }
        return 9;
      } else {
        return 10;
      }
    }

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ElevatedButton(
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(5),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          ),
        ),
        onPressed: () {
          Navigator.of(context).pushNamed(RegistrationPage.routeName);
        },
        child: const Text('Create new user'),
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
                      GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              );
      }),
    );
  }
}
