import 'package:chat_app/ui/pages/registration_page/registration_page.dart';
import 'package:sidebarx/sidebarx.dart';
import 'package:flutter/material.dart';

import '../pages/library/library_pages.dart';

class PageControllerWidget extends StatelessWidget {
  const PageControllerWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final SidebarXController controller;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        switch (controller.selectedIndex) {
          case 0:
            return const ProfilePage();
          case 1:
            return const FeedPage();
          case 2:
            return const AsapPage();
          case 3:
            return const ChoosePage();
          case 4:
            return const BlackBoxPage();
          case 5:
            return const MeetNetPage();
          case 6:
            return const FindFriendsPage();
          case 7:
            return const JobLitePage();
          case 8:
            return const VideosPage();
          case 9:
            return const SettingsPage();

          default:
            return const Text(
              'not found ',
              // style: AppTextStyle.s17AbelPurple,
            );
        }
      },
    );
  }
}
