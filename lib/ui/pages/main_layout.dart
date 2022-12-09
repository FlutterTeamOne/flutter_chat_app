import '../../src/libraries/library_all.dart';
import '../widgets/library/library_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sidebarx/sidebarx.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});
  static const routeName = '/';

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
      backgroundColor: AppColor.colorLightBackgrond,
      body: BlocListener<ConnectionBloc, ConnectionStatusState>(
        listener: (context, state) {
          if (state is ActiveConnectionState) {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    content: Text(state.message),
                    actions: [
                      ElevatedButton.icon(
                          onPressed: () => Navigator.of(context).pop(),
                          icon: Icon(Icons.close),
                          label: Text('OK'))
                    ],
                  );
                });
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
    );
  }
}
