import 'package:chat_app/modules/style_manager/library/library_style_manager.dart';
import 'package:flutter/material.dart';


import '../../themes/custom_themes.dart';

class ChangeThemeState {
  final Color? primaryColor;
  final Brightness? brightness;
  final double? borderRadius;
  final ThemeData? theme;
  final int? index;
  final iconColor = [
    Colors.white.withOpacity(0.2),
    Colors.white.withOpacity(0.2),
    Colors.white.withOpacity(0.2),
    Colors.white.withOpacity(0.2),
    Colors.white.withOpacity(0.2),
    Colors.white.withOpacity(0.2),
  ];
  final cardColor = <Color>[
    CustomThemes.darkThemeDeepPurple.primaryColor,
    CustomThemes.darkThemeLightBlue.primaryColor,
    CustomThemes.darkThemeBlueGray.primaryColor,
  ];
  final selectIcon = <IconData>[
    Icons.light_mode_outlined,
    Icons.dark_mode_outlined,
  ];


  ChangeThemeState({
    this.borderRadius,
    this.primaryColor,
    this.brightness,
    this.theme,
    this.index,
  }) {
    for (int i = 0; i <= 5; i++) {
      if (i == index) {
        iconColor[i] = Colors.white;
      } else {
        iconColor[i] = Colors.white.withOpacity(0.2);
      }
    }
  }
}
