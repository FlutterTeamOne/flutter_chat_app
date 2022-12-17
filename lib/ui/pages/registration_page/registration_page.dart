import 'package:chat_app/ui/widgets/registration_page/widgets/new_user_widget.dart';
import 'package:flutter/material.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NewUserWidget(),
    );
  }
}