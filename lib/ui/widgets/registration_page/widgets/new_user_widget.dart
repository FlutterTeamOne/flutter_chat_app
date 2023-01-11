import 'package:chat_app/modules/signal_service/river/river.dart';
import 'package:chat_app/ui/auth/authorization_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../bloc/new_user_bloc.dart';
import '../bloc/new_user_event.dart';
import '../models/new_user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/new_user_state.dart';

class NewUserWidget extends StatefulWidget {
  const NewUserWidget({Key? key}) : super(key: const Key('newUserWidget'));

  @override
  State<NewUserWidget> createState() => _NewUserWidgetState();
}

class _NewUserWidgetState extends State<NewUserWidget> {
  static const double textFieldWidth = 200;
  static const double textPadding = 15;

  static const String newUserPictureUrl =
      """https://img.freepik.com/free-vector/illustration-user-avatar-icon_53876-5907.jpg?w=2000""";
  static String newUserCreateDate = DateTime.now().toIso8601String();
  late TextEditingController newUserNameText;
  late TextEditingController newUserEmailText;
  late TextEditingController newUserPasswordText;
  late TextEditingController newUserPictureUrlText;
  final GlobalKey<FormState> _formKey = GlobalKey();

  final _nameKey = GlobalKey<FormState>();

  final _emailKey = GlobalKey<FormState>();

  final _passwordKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    newUserNameText = TextEditingController();
    newUserEmailText = TextEditingController();
    newUserPasswordText = TextEditingController();
    newUserPictureUrlText = TextEditingController();
  }

  @override
  void dispose() {
    newUserNameText.dispose();
    newUserEmailText.dispose();
    newUserPasswordText.dispose();
    newUserPictureUrlText.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      key: const Key('newUserWidgetRow'),
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          key: const Key('newUserWidgetColumn'),
          children: [
            const SizedBox(
              height: 200,
            ),
            Row(
              children: [
                Form(
                  key: _formKey,
                  child: Column(
                    key: const Key('newUserWidgetBodyColumn'),
                    children: [
                      buildNameRow(),
                      buildEmailRow(),
                      buildPasswordRow(),
                      const SizedBox(
                        height: 20,
                      ),
                      buildCreateNewUserButton(context, newUserNameText,
                          newUserEmailText, newUserPasswordText),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ],
    );
  }

  SizedBox buildPasswordRow() {
    return SizedBox(
      key: const Key('password'),
      width: 300,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const Padding(
            padding: EdgeInsets.only(right: textPadding),
            child: Text('Password'),
          ),
          SizedBox(
            width: textFieldWidth,
            child: TextFormField(
              key: _passwordKey,
              controller: newUserPasswordText,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Enter password';
                }
                return null;
              },
              obscureText: true,
              onSaved: (value) {},
            ),
          ),
        ],
      ),
    );
  }

  SizedBox buildEmailRow() {
    return SizedBox(
      key: const Key('email'),
      width: 300,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const Padding(
            padding: EdgeInsets.only(right: textPadding),
            child: Text('Email'),
          ),
          SizedBox(
              width: textFieldWidth,
              child: TextFormField(
                key: _emailKey,
                controller: newUserEmailText,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter email';
                  }
                  return null;
                },
              )),
        ],
      ),
    );
  }

  SizedBox buildNameRow() {
    return SizedBox(
      key: const Key('name'),
      width: 300,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const Padding(
            padding: EdgeInsets.only(right: textPadding),
            child: Text('Name'),
          ),
          SizedBox(
              width: textFieldWidth,
              child: TextFormField(
                key: _nameKey,
                controller: newUserNameText,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter name';
                  }
                  return null;
                },
              )),
        ],
      ),
    );
  }

  Padding buildCreateNewUserButton(BuildContext context, newUserNameText,
      newUserEmailText, newUserPasswordText) {
    late String newUserName;
    return Padding(
      key: const Key('createUserWidget'),
      padding: const EdgeInsets.only(left: 100.0),
      child: Row(
        children: [
          BlocConsumer<NewUserBloc, NewUserState>(
            listener: (context, state) {},
            builder: (context, state) {
              return ElevatedButton(
                  key: const Key('createUserButton'),
                  // style: ButtonStyle(
                  //     shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  //         RoundedRectangleBorder(
                  //   borderRadius: BorderRadius.circular(20.0),
                  // ))),
                  onPressed: () {
                    // if (_nameKey.currentState!.validate() &&
                    //     _emailKey.currentState!.validate() &&
                    //     _passwordKey.currentState!.validate()) {
                    //   ScaffoldMessenger.of(context).showSnackBar(
                    //     const SnackBar(content: Text('Creating new user')),
                    //   );
                    // }
                    late NewUserModel newUser = NewUserModel(
                        name: newUserNameText.text,
                        email: newUserEmailText.text,
                        password: newUserPasswordText.text,
                        registrationDate: newUserCreateDate,
                        profilePicLink: newUserPictureUrl);
                    context
                        .read<NewUserBloc>()
                        .add(SetNewUserEvent(user: newUser));
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          newUserName =
                              context.watch<NewUserBloc>().state.newUser.name;
                          return Dialog(
                            key: const Key('createUserDialog'),
                            // shape: RoundedRectangleBorder(
                            //   borderRadius: BorderRadius.circular(20.0),
                            // ),
                            child: SizedBox(
                              height: 80,
                              width: 50,
                              child: Column(
                                children: [
                                  Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: context
                                                  .read<NewUserBloc>()
                                                  .state
                                                  .newUser
                                                  .name ==
                                              newUserNameText.text
                                          ? Text('User $newUserName created')
                                          : const Text('Error')),
                                  Consumer(
                                    builder: (context, ref, _) {
                                      return ElevatedButton(
                                          key: const Key(
                                              'createUserDialogButton'),
                                          // style: ButtonStyle(
                                          //     shape: MaterialStateProperty.all<
                                          //             RoundedRectangleBorder>(
                                          //         RoundedRectangleBorder(
                                          //   borderRadius:
                                          //       BorderRadius.circular(20.0),
                                          // ))),
                                          onPressed: () {
                                            ref
                                                .read(River.userPod.notifier)
                                                .readUser();

                                            Navigator.of(context)
                                                .pushNamed(AuthPage.routeName);
                                          },
                                          child: const Icon(Icons.check));
                                    },
                                  )
                                ],
                              ),
                            ),
                          );
                        });
                    // print(
                    //     '${newUserNameText.text} , ${newUserEmailText.text} , ${newUserPasswordText.text} , ');
                  },
                  child: const Text('Create new user'));
            },
          ),
          IconButton(
              key: const Key('cancelUserCreateButton'),
              onPressed: () {
                Navigator.of(context).pushNamed('/');
              },
              icon: const Icon(Icons.close_rounded)),
        ],
      ),
    );
  }
}
