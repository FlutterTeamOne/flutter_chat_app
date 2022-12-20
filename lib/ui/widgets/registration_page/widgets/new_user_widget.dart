import 'package:chat_app/domain/data/dto/user_dto/user_dto.dart';
import 'package:chat_app/ui/widgets/registration_page/bloc/new_user_bloc.dart';
import 'package:chat_app/ui/widgets/registration_page/bloc/new_user_event.dart';
import 'package:chat_app/ui/widgets/registration_page/models/new_user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/new_user_state.dart';

class NewUserWidget extends StatefulWidget {
  const NewUserWidget({Key? key}) : super(key: key);

  @override
  State<NewUserWidget> createState() => _NewUserWidgetState();
}

class _NewUserWidgetState extends State<NewUserWidget> {
  static const double textFieldWidth = 200;
  static const double textPadding = 15;

  static const String newUserPictureUrl =
      """data:image/png;base64,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
      deXoFp70GXAAAAAElFTkSuQmCC""";
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
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            const SizedBox(
              height: 200,
            ),
            Row(
              children: [
                Form(
                  key: _formKey,
                  child: Column(
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
      padding: const EdgeInsets.only(left: 100.0),
      child: Row(
        children: [
          BlocConsumer<NewUserBloc, NewUserState>(
            listener: (context, state) {},
            builder: (context, state) {
              return ElevatedButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ))),
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
                              newUserName = context.watch<NewUserBloc>().state.newUser.name;
                              return Dialog(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: SizedBox(
                                  height: 80,
                                  width: 50,
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child:
                                            Text('User $newUserName created'),
                                      ),
                                      ElevatedButton(
                                          style: ButtonStyle(
                                              shape: MaterialStateProperty.all<
                                                      RoundedRectangleBorder>(
                                                  RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                          ))),
                                          onPressed: () {
                                            Navigator.of(context)
                                                .pushNamed('/');
                                          },
                                          child: const Icon(Icons.check))
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
              onPressed: () {
                Navigator.of(context).pushNamed('/');
              },
              icon: const Icon(Icons.close_rounded)),
        ],
      ),
    );
  }
}
