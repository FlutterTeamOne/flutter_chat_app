import 'dart:developer';

import '../../modules/signal_service/river/river.dart';
import '../../modules/storage_manager/db_helper/db_helper_start.dart';
import '../../modules/storage_manager/db_helper/user_path.dart';
import '../../src/libraries/library_all.dart';
import '../pages/library/library_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
part '../auth/widgets/user_card.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});
  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer(
          builder: (context, ref, _) => ref.watch(River.futureUserPod).when(
                data: (data) => Column(
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
                          itemCount: data.users?.length,
                          itemBuilder: ((context, index) =>
                              UserCard(user: data.users![index])),
                        ),
                      ),
                    ),
                    ElevatedButton(
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ))),
                        onPressed: () {
                          Navigator.of(context).pushNamed('/registration page');
                        },
                        child: const Text('Create new user')),
                  ],
                ),
                error: (e, s) => Text(e.toString()),
                loading: () => const Center(
                  child: CircularProgressIndicator(),
                ),
              )
          
          ),
    );
  }
}
