import 'package:flutter/material.dart';

import '../../themes/custom_themes.dart';

class ChangeThemeState {
  final ThemeData theme;
  final int index;
  final iconColor = <Color>[
    Colors.white.withOpacity(0.2),
    Colors.white.withOpacity(0.2),
    Colors.white.withOpacity(0.2),
    Colors.white.withOpacity(0.2),
    Colors.white.withOpacity(0.2),
    Colors.white.withOpacity(0.2),
  ];
  final cardColor = <Color>[
    CustomTheme.darkThemeDeepPurple.primaryColor,
    CustomTheme.darkThemeLightBlue.primaryColor,
    CustomTheme.darkThemeOrange.primaryColor,
  ];
  final selectIcon = <IconData>[
    Icons.light_mode_outlined,
    Icons.dark_mode_outlined,
  ];
  ChangeThemeState({
    required this.theme,
    required this.index,
  }) ;
  // {
  //   for (int i = 0; i <= iconColor.length; i++) {
  //     if (i == index) {
  //       iconColor[i] = Colors.white;
  //     } else {
  //       iconColor[i] = Colors.white.withOpacity(0.2);
  //     }
  //   }
  }

