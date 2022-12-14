import 'package:flutter/material.dart';

class NewUserWidget extends StatelessWidget {
  const NewUserWidget({Key? key}) : super(key: key);
  static const double textFieldWidth = 200;
  static const double textPadding = 15;

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
                    SizedBox(
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
                    ),
                    SizedBox(
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
                    ),
                    SizedBox(
                      width: 300,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: const [
                          Padding(
                            padding: EdgeInsets.only(right: textPadding),
                            child: Text('Password'),
                          ),
                          SizedBox(width: textFieldWidth, child: TextField()),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
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
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}
