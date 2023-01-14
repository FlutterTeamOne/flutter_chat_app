import 'dart:developer';
import 'package:chat_app/modules/client/custom_exception.dart';
import 'package:chat_app/modules/storage_manager/db_helper/user_path.dart';
import 'package:chat_app/ui/pages/main_layout.dart';
import 'package:chat_app/ui/pages/registration_page/registration_page.dart';
import 'package:chat_app/ui/widgets/custom_dialogs/error_dialog.dart';
import 'package:grpc/grpc.dart';
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
    _init();
  }

  @override
  void dispose() {
    log("DISPOSE AUTH PAGE");
    super.dispose();
  }

  _init() async {
    try {
      //ref.read(River.futureSynchUserPod);
      await ref.read(River.synchUserPod.notifier).readUser();
      print("ВСЕ ОК");
    } on GrpcError catch (e) {
      print("ERROR");
    } on CustomException catch (e) {
      print("ERROR SYNCH in INIT: $e");
      await showDialog(
          context: context,
          builder: (context) => const ErrorDialog(
              textTitle: "Error",
              textContent: "The server is temporarily unavailable"));
    } catch (e) {
      print("ERROR");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              style: ButtonStyle(
                elevation: MaterialStateProperty.all(5),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                ),
              ),
              onPressed: () {
                Navigator.of(context).pushNamed(RegistrationPage.routeName);
              },
              child: const Text('Create new user'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ))),
                onPressed: () {
                  Navigator.of(context).pushNamed(AuthPage.routeName);
                },
                child: const Text('Restart Page')),
          ),
        ],
      ),
      body: Consumer(builder: (context, ref, _) {
        List<UserDto>? users;
        users = ref.watch(River.synchUserPod).users;
        return users == null
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
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
                          alignment: WrapAlignment.center,
                          spacing: 16,
                          runSpacing: 16,
                          children: users
                              .map((user) => UserCard(user: user))
                              .toList(),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              );
      }),
    );
  }
}
