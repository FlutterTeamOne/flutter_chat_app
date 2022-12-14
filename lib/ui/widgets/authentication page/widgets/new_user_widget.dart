import 'package:flutter/material.dart';

class NewUserWidget extends StatelessWidget {
  const NewUserWidget({Key? key}) : super(key: key);
  static const double textFieldWidth = 200;
  static const double textPadding = 15;

  @override
  Widget build(BuildContext context) {
    final int newUserId;
    final String newUserName;
    final String newUserEmail;
    final String newUserPassword;
    final String newUserPictureUrl;
    final String newUserCreateDate;
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
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(right: textPadding),
                          child: Text('Password'),
                        ),
                        SizedBox(width: textFieldWidth, child: TextField(

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
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(right: textPadding),
                          child: Text('Email'),
                        ),
                        SizedBox(width: textFieldWidth, child: TextField()),
                      ],
                    ),
                  );
  }

  SizedBox buildNameRow() {
    return SizedBox(
                    width: 300,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(right: textPadding),
                          child: Text('Name'),
                        ),
                        SizedBox(width: textFieldWidth, child: TextField()),
                      ],
                    ),
                  );
  }

  Padding buildCreateNewUserButton() {
    return Padding(
                    padding: const EdgeInsets.only(left: 100.0),
                    child: ElevatedButton(
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ))),
                        onPressed: () {},
                        child: const Text('Create new user')),
                  );
  }
}
