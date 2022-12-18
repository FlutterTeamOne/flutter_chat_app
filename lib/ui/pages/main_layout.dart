import 'package:chat_app/modules/signal_service/bloc/grpc_connection_bloc/grpc_connection_bloc.dart';

import '../../src/libraries/library_all.dart';
import '../widgets/library/library_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sidebarx/sidebarx.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});
  static const routeName = '/mainLayout';

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  final _sideBarController =
      SidebarXController(selectedIndex: 0, extended: true);

  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: BlocListener<ConnectionBloc, ConnectionStatusState>(
        listener: (context, state) {
          print("Internet State: $state");
          if (state is InActiveConnectionState) {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    content: Text(state.message),
                    actions: [
                      ElevatedButton.icon(
                          onPressed: () => Navigator.of(context).pop(),
                          icon: const Icon(Icons.close),
                          label: const Text('OK'))
                    ],
                  );
                });
          }
        },
        child: BlocListener<GrpcConnectionBloc, GrpcConnectionState>(
          listener: (context, state) {
            switch (state.connectState) {
              case GrpcConnectState.connecting:
                print('connecting: ${state.connectState} ');
                break;
              case GrpcConnectState.ready:
                print('ready: ${state.connectState} ');
                break;
              case GrpcConnectState.idle:
                print('idle: ${state.connectState} ');
                break;
              case GrpcConnectState.shutdown:
                print('shutdown: ${state.connectState} ');
                break;
              case GrpcConnectState.transientFailure:
                print('transientFailure: ${state.connectState} ');
                break;
              default:
                print('default: ${state.connectState} ');
            }
          },
          child: SafeArea(
            child: Row(
              children: [
                // Боковое меню
                currentWidth > 1276
                    ? Expanded(
                        child: SideMenuWidget(controller: _sideBarController))
                    : SideMenuWidget(controller: _sideBarController),
                // Экраны
                Expanded(
                  flex: 7,
                  child: PageControllerWidget(controller: _sideBarController),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
