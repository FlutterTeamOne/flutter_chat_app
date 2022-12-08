part of '../main_layout.dart';

class _SideMenu extends StatelessWidget {
  const _SideMenu({
    required this.controller,
  });

  final SidebarXController controller;

  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;
    return SidebarX(
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
                Text(
                  'Sfera'.toUpperCase(),
                  // style: AppTextStyle.s36Abel
                ),
                const SizedBox(height: 20),
              ],
            )
          : Text(
              'Ⓢ',
            ),
      separatorBuilder: (context, index) => const SizedBox(height: 5),
      items: currentWidth <= 1276
          ? const [
              SidebarXItem(
                icon: Icons.person_rounded,
              ),
              SidebarXItem(
                icon: Icons.calendar_view_day_rounded,
              ),
              SidebarXItem(
                icon: Icons.chat_rounded,
              ),
              SidebarXItem(
                icon: Icons.calendar_view_day_rounded,
              ),
              SidebarXItem(
                icon: Icons.view_in_ar_rounded,
              ),
              SidebarXItem(
                icon: Icons.pie_chart_outline_rounded,
              ),
              SidebarXItem(
                icon: Icons.supervisor_account_rounded,
              ),
              SidebarXItem(
                icon: Icons.person_search_rounded,
              ),
              SidebarXItem(
                icon: Icons.diamond_rounded,
              ),
              SidebarXItem(
                icon: Icons.settings,
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
      // selectedIconTheme: const IconThemeData(color: AppColor.color7E57C2),
      // selectedTextStyle: AppTextStyle.s17AbelPurple,
      selectedItemTextPadding: const EdgeInsets.only(left: 30),
      itemTextPadding: const EdgeInsets.only(left: 30),
      // decoration: const BoxDecoration(
      //   color: AppColor.colorFFFFFF,
      // ),
    );
  }
}
