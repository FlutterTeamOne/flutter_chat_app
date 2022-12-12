import 'package:chat_app/modules/style_manager/library/library_style_manager.dart';
import 'package:flutter/material.dart';

class ChangeThemeState {
  ThemeData theme;
  final int index;
  Map<int, Color> iconColor = {
    0: Colors.white.withOpacity(0.2),
    1: Colors.white.withOpacity(0.2),
    2: Colors.white.withOpacity(0.2),
    3: Colors.white.withOpacity(0.2),
    4: Colors.white.withOpacity(0.2),
    5: Colors.white.withOpacity(0.2),
  };
  Map<int, Color> cardColor = {
    0: CustomTheme().darkThemeDeepPurple.primaryColor,
    1: CustomTheme().darkThemeLightBlue.primaryColor,
    2: CustomTheme().darkThemeOrange.primaryColor,
    };
  ChangeThemeState({
    required this.theme,
    required this.index,
  }) {
    for (int i = 0; i <= iconColor.length; i++) {
      if (i == index) {
        iconColor[i] = Colors.white;
      } else {
        iconColor[i] = Colors.white.withOpacity(0.2);
      }
    }
  }
}
