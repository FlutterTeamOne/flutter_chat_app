import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'unread_messages_bloc.dart';
import 'unread_messages_event.dart';
// import 'unread_messages_state.dart';

class Unread_messagesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => Unread_messagesBloc()..add(InitEvent()),
      child: Builder(builder: (context) => _buildPage(context)),
    );
  }

  Widget _buildPage(BuildContext context) {
    // final bloc = BlocProvider.of<Unread_messagesBloc>(context);

    return Container();
  }
}

