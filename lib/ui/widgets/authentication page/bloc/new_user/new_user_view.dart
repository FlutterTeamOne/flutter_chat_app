import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'new_user_bloc.dart';
import 'new_user_event.dart';
import 'new_user_state.dart';

class New_userPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => New_userBloc()..add(InitEvent()),
      child: Builder(builder: (context) => _buildPage(context)),
    );
  }

  Widget _buildPage(BuildContext context) {
    final bloc = BlocProvider.of<New_userBloc>(context);

    return Container();
  }
}

