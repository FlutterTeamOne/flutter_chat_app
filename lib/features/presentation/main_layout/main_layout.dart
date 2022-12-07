import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'pages/asap_page/asap_page.dart';
import 'pages/black_box_page/black_box_page.dart';
import 'pages/choose_page/choose_page.dart';
import 'pages/feed_page/feed_page.dart';
import 'pages/find_friend_page/find_friend_page.dart';
import 'pages/job_lite_page/job_lite_page.dart';
import 'pages/meet_net_page/meet_net_page.dart';
import 'pages/profile_page/profile_page.dart';
import 'pages/videos_page/videos_page.dart';
import '../../../themes/color/app_color.dart';
import '../../../themes/text_style/app_text_style.dart';

import 'package:flutter_chat_app/style_manager/settings_page.dart';
import 'package:sidebarx/sidebarx.dart';

import '../../../sender_manager/conncetion_bloc/connection_bloc.dart';

part 'widgets/side_menu.dart';
part 'widgets/page_controller_widget.dart';

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
                  ? Expanded(child: _SideMenu(controller: _sideBarController))
                  : _SideMenu(controller: _sideBarController),
              // Экраны
              Expanded(
                flex: 7,
                child: _PageControllerWidget(controller: _sideBarController),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
