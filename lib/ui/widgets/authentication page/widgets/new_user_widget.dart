import 'package:chat_app/domain/data/dto/user_dto/user_dto.dart';
import 'package:chat_app/ui/widgets/authentication%20page/bloc/new_user/new_user_bloc.dart';
import 'package:chat_app/ui/widgets/authentication%20page/bloc/new_user/new_user_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewUserWidget extends StatelessWidget {
  NewUserWidget({Key? key}) : super(key: key);
  static const double textFieldWidth = 200;
  static const double textPadding = 15;
  static final newUserNameText = TextEditingController();
  static final newUserEmailText = TextEditingController();
  static final newUserPasswordText = TextEditingController();
  static final newUserPictureUrlText = TextEditingController();

  static const String newUserPictureUrl =
      """https://media.istockphoto.com/id/1300845620/ru/%D0%B2%D0
      %B5%D0%BA%D1%82%D0%BE%D1%80%D0%BD%D0%B0%D1%8F/%D0%BF%D0%BE%
      D0%BB%D1%8C%D0%B7%D0%BE%D0%B2%D0%B0%D1%82%D0%B5%D0%BB%D1%8C
      -icon-flat-%D0%B8%D0%B7%D0%BE%D0%BB%D0%B8%D1%80%D0%BE%D0%B2
      %D0%B0%D0%BD-%D0%BD%D0%B0-%D0%B1%D0%B5%D0%BB%D0%BE%D0%BC-%D
      1%84%D0%BE%D0%BD%D0%B5-%D1%81%D0%B8%D0%BC%D0%B2%D0%BE%D0%BB
      -%D0%BF%D0%BE%D0%BB%D1%8C%D0%B7%D0%BE%D0%B2%D0%B0%D1%82%D0%
      B5%D0%BB%D1%8F-%D0%B8%D0%BB%D0%BB%D1%8E%D1%81%D1%82%D1%80%D
      0%B0%D1%86%D0%B8%D1%8F-%D0%B2%D0%B5%D0%BA%D1%82%D0%BE%D1%80
      %D0%B0.jpg?s=612x612&w=0&k=20&c=Po5TTi0yw6lM7qz6yay5vUbUBy3
      kAEWrpQmDaUMWnek=""";
  static final String newUserCreateDate = DateTime.now().toIso8601String();

  final UserDto newUser = UserDto(
      name: newUserNameText.text,
      email: newUserEmailText.text,
      password: newUserPasswordText.text,
      registrationDate: newUserCreateDate,
      profilePicLink: newUserPictureUrl,
      updatedDate: newUserCreateDate);

  final _nameKey = GlobalKey<FormState>();
  final _emailKey = GlobalKey<FormState>();
  final _passwordKey = GlobalKey<FormState>();

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
                Column(
                  children: [
                    buildNameRow(),
                    buildEmailRow(),
                    buildPasswordRow(),
                    const SizedBox(
                      height: 20,
                    ),
                    buildCreateNewUserButton(context),
                  ],
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
                // validator: (value) {
                //   if (value == null || value.isEmpty) {
                //     return 'Enter password';
                //   }
                //   return null;
                // },
              )),
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
                // validator: (value) {
                //   if (value == null || value.isEmpty) {
                //     return 'Enter email';
                //   }
                //   return null;
                // },
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
                // validator: (value) {
                //   if (value == null || value.isEmpty) {
                //     return 'Enter name';
                //   }
                //   return null;
                // },
              )),
        ],
      ),
    );
  }

  Padding buildCreateNewUserButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 100.0),
      child: BlocProvider(
        create: (context) => NewUserBloc(),
        child: ElevatedButton(
            style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ))),
            onPressed: () {
              if (_nameKey.currentState!.validate() &&
                  _emailKey.currentState!.validate() &&
                  _passwordKey.currentState!.validate()) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Creating new user')),
                );
              }
              BlocProvider.of<NewUserBloc>(context)
                  .add(SetNewUserEvent(user: newUser));
              print(
                  '${newUserNameText.text} , ${newUserEmailText.text} , ${newUserPasswordText.text} , $newUserPictureUrl');
              disposeText();
            },
            child: const Text('Create new user')),
      ),
    );
  }

  void disposeText() {
    newUserNameText.dispose();
    newUserEmailText.dispose();
    newUserPasswordText.dispose();
    newUserPictureUrlText.dispose();
    // super.disposeText();
  }
}
