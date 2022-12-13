import 'package:chat_app/modules/style_manager/library/library_style_manager.dart';
import 'package:flutter/material.dart';

class ChangeThemeState {
  final ThemeData? theme;
  final int? index;
 // final iconColor = [
 //    Colors.white.withOpacity(0.2),
 //    Colors.white.withOpacity(0.2),
 //    Colors.white.withOpacity(0.2),
 //    Colors.white.withOpacity(0.2),
 //    Colors.white.withOpacity(0.2),
 //    Colors.white.withOpacity(0.2),
 //  ];
  final cardColor = <Color>[
    CustomTheme.darkThemeDeepPurple.primaryColor,
    CustomTheme.darkThemeDeepPurple.primaryColor,
    CustomTheme.darkThemeLightBlue.primaryColor,
    CustomTheme.darkThemeLightBlue.primaryColor,
    CustomTheme.darkThemeOrange.primaryColor,
    CustomTheme.darkThemeOrange.primaryColor,
    ];
  final selectIcon = <IconData>[
    Icons.light_mode_outlined,
    Icons.dark_mode_outlined,
    Icons.light_mode_outlined,
    Icons.dark_mode_outlined,
    Icons.light_mode_outlined,
    Icons.dark_mode_outlined,
  ];
  ChangeThemeState({
    this.theme,
    this.index,
  }) {
    // for (int i = 0; i <= 5; i++) {
    //   if (i == index) {
    //     iconColor[i] = Colors.white;
    //   } else {
    //     iconColor[i] = Colors.white.withOpacity(0.2);
    //   }
    // }
  }
}
