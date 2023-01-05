import '../../modules/signal_service/bloc/grpc_connection_bloc/grpc_connection_bloc.dart';
import '../../modules/signal_service/river/river.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import '../../src/libraries/library_all.dart';
import '../widgets/library/library_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sidebarx/sidebarx.dart';

class MainLayout extends ConsumerStatefulWidget {
  const MainLayout({super.key});
  static const routeName = '/mainLayout';

  @override
  ConsumerState<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends ConsumerState<MainLayout> {
  final _sideBarController =
      SidebarXController(selectedIndex: 0, extended: true);

  @override
  Widget build(BuildContext context) {
    ref.read(River.userPod.notifier).readUser();
    // context.read<UserBloc>().add(ReadUsersEvent());
    // print("UserBloc: ${context.read<UserBloc>().state.users}");
    final currentWidth = MediaQuery.of(context).size.width;
    var isConnected = false;
    ref.watch(River.connectPod.select((status) {
      if (status == ConnectionStatus.isConnected) {
        showDialogBox(
          context,
          'Please check your internet connection connection Inactive',
          isConnected,
        );
      }
    }));

    return Scaffold(
      body: SafeArea(
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
    );
  }
}

showDialogBox(BuildContext context, String message, isConnected) {
  return showCupertinoDialog<dynamic>(
    context: context,
    builder: (BuildContext context) => CupertinoAlertDialog(
      title: const Text('No Connection'),
      content: Text(message),
      actions: [
        TextButton(
          style: ButtonStyle(
            fixedSize: MaterialStateProperty.all(const Size.fromHeight(30)),
          ),
          onPressed: () async {
            Navigator.pop(context, 'Cancel');
            // isConnected = await InternetConnectionChecker().hasConnection;
            // if (!isConnected) {
            //   showDialogBox(context, message, isConnected);
            // }
          },
          child: Text('Ok'.toUpperCase()),
        ),
      ],
    ),
  );
}
