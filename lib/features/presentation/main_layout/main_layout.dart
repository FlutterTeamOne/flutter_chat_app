import 'package:flutter/material.dart';
import 'package:flutter_chat_app/features/presentation/main_layout/pages/asap_page/asap_page.dart';
import 'package:flutter_chat_app/features/presentation/main_layout/pages/black_box_page/black_box_page.dart';
import 'package:flutter_chat_app/features/presentation/main_layout/pages/choose_page/choose_page.dart';
import 'package:flutter_chat_app/features/presentation/main_layout/pages/feed_page/feed_page.dart';
import 'package:flutter_chat_app/features/presentation/main_layout/pages/find_friend_page/find_friend_page.dart';
import 'package:flutter_chat_app/features/presentation/main_layout/pages/job_lite_page/job_lite_page.dart';
import 'package:flutter_chat_app/features/presentation/main_layout/pages/meet_net_page/meet_net_page.dart';
import 'package:flutter_chat_app/features/presentation/main_layout/pages/profile_page/profile_page.dart';
import 'package:flutter_chat_app/features/presentation/main_layout/pages/videos_page/videos_page.dart';
import 'package:flutter_chat_app/themes/color/app_color.dart';
import 'package:flutter_chat_app/themes/text_style/app_text_style.dart';
import 'package:sidebarx/sidebarx.dart';

part 'widgets/side_menu.dart';
part 'widgets/page_controller_widget.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  final _sideBarController =
      SidebarXController(selectedIndex: 0, extended: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.colorLightBackgrond,
      body: SafeArea(
        child: Row(
          children: [
            Expanded(
              child: _SideMenu(controlller: _sideBarController),
            ),
            Expanded(
              flex: 6,
              child: _PageControllerWidget(controller: _sideBarController),
            ),
          ],
        ),
      ),
    );
  }
}
