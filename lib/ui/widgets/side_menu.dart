import 'package:flutter/material.dart';
import 'package:sidebarx/sidebarx.dart';

class SideMenuWidget extends StatelessWidget {
  const SideMenuWidget({
    super.key,
    required this.controller,
  });

  final SidebarXController controller;

  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
          border: Border(
              right:
                  BorderSide(width: 1, color: Theme.of(context).dividerColor))),
      // color: Theme.of(context).backgroundColor,
      child: SidebarX(
        showToggleButton: false,
        animationDuration: const Duration(seconds: 0),
        controller: controller,
        headerDivider: currentWidth <= 1276
            ? const Divider(
                // color: AppColor.color9E9E9E,
                endIndent: 11,
              )
            : const Divider(
                // color: AppColor.color9E9E9E,
                endIndent: 5,
              ),
        theme: sideBarxTheme(currentWidth),
        headerBuilder: (context, extended) => currentWidth > 1276
            ? Column(
                children: [
                  const SizedBox(height: 20),
                  Text('Sfera'.toUpperCase(),
                      style: TextStyle(color: Theme.of(context).primaryColor)),
                  const SizedBox(height: 20),
                ],
              )
            : Text('Ⓢ', style: Theme.of(context).textTheme.headlineLarge),
        separatorBuilder: (context, index) => const SizedBox(height: 5),
        items: currentWidth <= 1276
            ? const [
                SidebarXItem(
                  icon: Icons.person_outline_outlined,
                ),
                SidebarXItem(
                  icon: Icons.calendar_view_day_outlined,
                ),
                SidebarXItem(
                  icon: Icons.chat_bubble_outline_rounded,
                ),
                SidebarXItem(
                  icon: Icons.calendar_view_day_outlined,
                ),
                SidebarXItem(
                  icon: Icons.view_in_ar_outlined,
                ),
                SidebarXItem(
                  icon: Icons.pie_chart_outline_rounded,
                ),
                SidebarXItem(
                  icon: Icons.supervisor_account_outlined,
                ),
                SidebarXItem(
                  icon: Icons.person_search_outlined,
                ),
                SidebarXItem(
                  icon: Icons.diamond_outlined,
                ),
                SidebarXItem(
                  icon: Icons.settings_outlined,
                ),

              ]
            : const [
                SidebarXItem(
                  icon: Icons.person_rounded,
                  label: 'Profile',
                ),
                SidebarXItem(
                  icon: Icons.calendar_view_day_rounded,
                  label: 'SFERA feed',
                ),
                SidebarXItem(
                  icon: Icons.chat_rounded,
                  label: 'Asap',
                ),
                SidebarXItem(
                  icon: Icons.calendar_view_day_rounded,
                  label: 'Choose',
                ),
                SidebarXItem(
                  icon: Icons.view_in_ar_rounded,
                  label: 'Black box',
                ),
                SidebarXItem(
                  icon: Icons.pie_chart_outline_rounded,
                  label: 'MeetNet',
                ),
                SidebarXItem(
                  icon: Icons.supervisor_account_rounded,
                  label: 'Find friends',
                ),
                SidebarXItem(
                  icon: Icons.person_search_rounded,
                  label: 'Job lite',
                ),
                SidebarXItem(
                  icon: Icons.diamond_rounded,
                  label: 'VideoS',
                ),
                SidebarXItem(
                  icon: Icons.settings,
                  label: 'Settings',
                ),

              ],
      ),
    );
  }

  SidebarXTheme sideBarxTheme(double currentWidth) {
    return SidebarXTheme(
      itemDecoration: const BoxDecoration(
        borderRadius: BorderRadius.zero,
      ),
      padding: currentWidth <= 1276
          ? const EdgeInsets.only(left: 11)
          : const EdgeInsets.only(left: 5),
      // textStyle: AppTextStyle.s17Abel,
      // selectedIconTheme: IconThemeData(color: Theme.of(context).colorScheme.secondary),
      // selectedTextStyle: AppTextStyle.s17AbelPurple,
      selectedItemTextPadding: const EdgeInsets.only(left: 30),
      itemTextPadding: const EdgeInsets.only(left: 30),
      decoration: BoxDecoration(
          // color: Theme.of(context).colorScheme.primary,
          ),
    );
  }
}
