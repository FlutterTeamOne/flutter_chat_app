import '../../widgets/registration_page/widgets/new_user_widget.dart';
import 'package:flutter/material.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({Key? key}) : super(key: key);
  static const routeName = '/registration_page';

  @override
  Widget build(BuildContext context) {
    // var userPod = ref.read(River.userPod.notifier);
    return const Scaffold(
      body: NewUserWidget(),
    );
  }
}
