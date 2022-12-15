import 'package:flutter/material.dart';

class NewUserWidget extends StatelessWidget {
  NewUserWidget({Key? key}) : super(key: key);
  static const double textFieldWidth = 200;
  static const double textPadding = 15;
  final newUserNameText = TextEditingController();
  final newUserEmailText = TextEditingController();
  final newUserPasswordText = TextEditingController();
  final newUserPictureUrlText = TextEditingController();
  static const String newUserPictureUrl =
      'https://media.istockphoto.com/id/1300845620/ru/%D0%B2%D0%B5%D0%BA%D1%82%D0%BE%D1%80%D0%BD%D0%B0%D1%8F/%D0%BF%D0%BE%D0%BB%D1%8C%D0%B7%D0%BE%D0%B2%D0%B0%D1%82%D0%B5%D0%BB%D1%8C-icon-flat-%D0%B8%D0%B7%D0%BE%D0%BB%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD-%D0%BD%D0%B0-%D0%B1%D0%B5%D0%BB%D0%BE%D0%BC-%D1%84%D0%BE%D0%BD%D0%B5-%D1%81%D0%B8%D0%BC%D0%B2%D0%BE%D0%BB-%D0%BF%D0%BE%D0%BB%D1%8C%D0%B7%D0%BE%D0%B2%D0%B0%D1%82%D0%B5%D0%BB%D1%8F-%D0%B8%D0%BB%D0%BB%D1%8E%D1%81%D1%82%D1%80%D0%B0%D1%86%D0%B8%D1%8F-%D0%B2%D0%B5%D0%BA%D1%82%D0%BE%D1%80%D0%B0.jpg?s=612x612&w=0&k=20&c=Po5TTi0yw6lM7qz6yay5vUbUBy3kAEWrpQmDaUMWnek=';
  final String newUserCreateDate = DateTime.now().toIso8601String();

  @override
  Widget build(BuildContext context) {
    final int newUserId;
    final String newUserName;
    final String newUserEmail;
    final String newUserPassword;
    const String newUserPictureUrl =
        'https://media.istockphoto.com/id/1300845620/ru/%D0%B2%D0%B5%D0%BA%D1%82%D0%BE%D1%80%D0%BD%D0%B0%D1%8F/%D0%BF%D0%BE%D0%BB%D1%8C%D0%B7%D0%BE%D0%B2%D0%B0%D1%82%D0%B5%D0%BB%D1%8C-icon-flat-%D0%B8%D0%B7%D0%BE%D0%BB%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD-%D0%BD%D0%B0-%D0%B1%D0%B5%D0%BB%D0%BE%D0%BC-%D1%84%D0%BE%D0%BD%D0%B5-%D1%81%D0%B8%D0%BC%D0%B2%D0%BE%D0%BB-%D0%BF%D0%BE%D0%BB%D1%8C%D0%B7%D0%BE%D0%B2%D0%B0%D1%82%D0%B5%D0%BB%D1%8F-%D0%B8%D0%BB%D0%BB%D1%8E%D1%81%D1%82%D1%80%D0%B0%D1%86%D0%B8%D1%8F-%D0%B2%D0%B5%D0%BA%D1%82%D0%BE%D1%80%D0%B0.jpg?s=612x612&w=0&k=20&c=Po5TTi0yw6lM7qz6yay5vUbUBy3kAEWrpQmDaUMWnek=';
    final String newUserCreateDate;

    final newUserNameText = TextEditingController();
    final newUserEmailText = TextEditingController();
    final newUserPasswordText = TextEditingController();
    // final newUserPictureUrlText = TextEditingController();
    @override
    void disposenewUserNameText() {
      // Clean up the controller when the widget is removed from the
      // widget tree.
      newUserNameText.dispose();
      // super.disposenewUserNameText();
    }
    @override
    void disposenewUserEmailText() {
      // Clean up the controller when the widget is removed from the
      // widget tree.
      newUserEmailText.dispose();
      // super.disposenewUserEmailText();
    }
    @override
    void disposenewUserPasswordText() {
      // Clean up the controller when the widget is removed from the
      // widget tree.
      newUserPasswordText.dispose();
      // super.disposenewUserPasswordText();
    }
    @override
    void disposenewUserPictureUrlText() {
      // Clean up the controller when the widget is removed from the
      // widget tree.
      newUserPictureUrlText.dispose();
      // super.disposenewUserPictureUrlText();
    }

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
                    buildCreateNewUserButton(),
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
          Padding(
            padding: EdgeInsets.only(right: textPadding),
            child: Text('Password'),
          ),
          SizedBox(width: textFieldWidth, child: TextField(
            controller: newUserPasswordText,
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
          Padding(
            padding: EdgeInsets.only(right: textPadding),
            child: Text('Email'),
          ),
          SizedBox(width: textFieldWidth, child: TextField(
            controller: newUserEmailText,
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
          Padding(
            padding: EdgeInsets.only(right: textPadding),
            child: Text('Name'),
          ),
          SizedBox(width: textFieldWidth, child: TextField(
            controller: newUserNameText,
          )),
        ],
      ),
    );
  }

  Padding buildCreateNewUserButton() {
    return Padding(
      padding: const EdgeInsets.only(left: 100.0),
      child: ElevatedButton(
          style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ))),
          onPressed: () {
            print('${newUserNameText.text} , ${newUserEmailText.text} , ${newUserPasswordText.text} , $newUserPictureUrl'
            );

          },
          child: const Text('Create new user')),
    );
  }
}
