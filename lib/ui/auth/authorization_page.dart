import 'package:chat_app/src/libraries/library_all.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part '../auth/widgets/user_card.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<UserBloc, UserState>(builder: (context, usersState) {
        return usersState.users == null
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Center(
                child: SizedBox(
                  height: 300,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: usersState.users!.length,
                    itemBuilder: ((context, index) => UserCard(
                        text: usersState.users![index].email,
                        image: usersState.users![index].profilePicLink)),
                  ),
                ),
              );
      }),
    );
  }
}
