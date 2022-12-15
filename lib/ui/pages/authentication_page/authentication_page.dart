import 'package:chat_app/ui/widgets/authentication%20page/widgets/new_user_widget.dart';
import 'package:flutter/material.dart';

class AuthenticationPage extends StatelessWidget {
  const AuthenticationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NewUserWidget(),
    );
  }
}
