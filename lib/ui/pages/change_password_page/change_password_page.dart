import 'package:chat_app/ui/pages/main_layout.dart';
import 'package:flutter/material.dart';

class ChangePasswordPage extends StatelessWidget {
  const ChangePasswordPage({super.key});
  static const routeName = '/change_password_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: Container(
      child: Align(
        alignment: Alignment.topLeft,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: FloatingActionButton(
            onPressed: () {
              Navigator.of(context).pushNamed(MainLayout.routeName);
            },
            child: Icon(Icons.arrow_back),
          ),
        ),
      ),
    ));
  }
}
