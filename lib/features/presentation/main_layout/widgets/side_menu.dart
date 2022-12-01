﻿part of '../main_layout.dart';

class _SideMenu extends StatelessWidget {
  const _SideMenu({required this.controlller});
  final SidebarXController controlller;

  @override
  Widget build(BuildContext context) {
    return SidebarX(
      showToggleButton: false,
      animationDuration: const Duration(seconds: 0),
      controller: controlller,
      headerDivider:
          const Divider(color: AppColor.color9E9E9E, indent: 5, endIndent: 5),
      theme: sideBarxTheme(),
      headerBuilder: (context, extended) => SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Text('Sfera'.toUpperCase(), style: AppTextStyle.s36Abel),
        ),
      ),
      separatorBuilder: (context, index) => const SizedBox(height: 5),
      items: const [
        SidebarXItem(icon: Icons.person_rounded, label: 'Profile'),
        SidebarXItem(
            icon: Icons.calendar_view_day_rounded, label: 'SFERA feed'),
        SidebarXItem(icon: Icons.chat_rounded, label: 'Asap'),
        SidebarXItem(icon: Icons.calendar_view_day_rounded, label: 'Choose'),
        SidebarXItem(icon: Icons.view_in_ar_rounded, label: 'Black box'),
        SidebarXItem(icon: Icons.pie_chart_outline_rounded, label: 'MeetNet'),
        SidebarXItem(
            icon: Icons.supervisor_account_rounded, label: 'Find friends'),
        SidebarXItem(icon: Icons.person_search_rounded, label: 'Job lite'),
        SidebarXItem(icon: Icons.diamond_rounded, label: 'VideoS'),
      ],
    );
  }
}

SidebarXTheme sideBarxTheme() {
  return SidebarXTheme(
    itemDecoration: const BoxDecoration(
      borderRadius: BorderRadius.zero,
    ),
    padding: const EdgeInsets.only(left: 5),
    textStyle: AppTextStyle.s16Abel,
    selectedIconTheme: const IconThemeData(
      color: AppColor.color7E57C2,
    ),
    selectedTextStyle: AppTextStyle.s16AbelPurple,
    selectedItemTextPadding: const EdgeInsets.only(left: 30),
    itemTextPadding: const EdgeInsets.only(left: 30),
    decoration: const BoxDecoration(
      color: AppColor.colorFFFFFF,
    ),
  );
}
