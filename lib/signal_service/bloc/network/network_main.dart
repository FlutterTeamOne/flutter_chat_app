
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat_app/signal_service/bloc/network/network_state/network_success.dart';

import 'network_bloc.dart';
import 'network_events/network_observe.dart';
import 'network_state/abstract_network_state.dart';
import 'network_state/network_failure.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
          create: (context) => NetworkBloc()..add(NetworkObserve()),
          child: const Home()),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<NetworkBloc, NetworkState>(
          builder: (context, state) {
            if (state is NetworkFailure) {
              return const Text("No Internet Connection");
            } else if (state is NetworkSuccess) {
              return const Text("You're Connected to Internet");
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}