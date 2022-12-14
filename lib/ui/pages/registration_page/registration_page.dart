import '../../widgets/registration_page/bloc/new_user_bloc.dart';
import '../../widgets/registration_page/widgets/new_user_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/registration_page/bloc/new_user_state.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({Key? key}) : super(key: key);
  static const routeName = '/registration_page';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewUserBloc, NewUserState>(
      builder: (context, state) {
        return const Scaffold(
          body: NewUserWidget(),
        );
      },
    );
  }
}
