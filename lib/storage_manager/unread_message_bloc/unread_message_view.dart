// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import 'unread_message_bloc.dart';
// import 'unread_message_event.dart';
// import 'unread_message_state.dart';
//
// class Unread_messagePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (BuildContext context) => Unread_messageBloc()..add(InitEvent()),
//       child: Builder(builder: (context) => _buildPage(context)),
//     );
//   }
//
//   Widget _buildPage(BuildContext context) {
//     final bloc = BlocProvider.of<Unread_messageBloc>(context);
//
//     return Container();
//   }
// }
//
