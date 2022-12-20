import 'package:chat_app/ui/widgets/registration_page/bloc/new_user_bloc.dart';
import 'package:chat_app/ui/widgets/registration_page/bloc/new_user_bloc.dart';
import 'package:chat_app/ui/widgets/registration_page/widgets/new_user_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/registration_page/bloc/new_user_state.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewUserBloc, NewUserState>(
      builder: (context, state) {
        return Scaffold(
          body: NewUserWidget(),
        );
      },
    );
  }
}
