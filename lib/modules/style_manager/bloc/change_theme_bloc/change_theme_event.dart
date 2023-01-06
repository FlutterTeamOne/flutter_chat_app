import 'package:flutter/material.dart';

abstract class ChangeThemeEvent {
  // late int index;
  // late Brightness brightness;
}

class SetThemeEvent extends ChangeThemeEvent {
  final int index;
  final double fontSizeFactor;
  SetThemeEvent({
    required this.index,
    required this.fontSizeFactor,
  });
}

class SetCustomThemesEvent extends ChangeThemeEvent {
  final int index;
  final Brightness brightness;
  final Color primaryColor;
  final Color? textColor;
  final double? borderRadius;
  final double? fontSizeFactor;
  final String? fontFamily;
  SetCustomThemesEvent(
      {required this.index,
      required this.brightness,
      required this.primaryColor,
      this.textColor,
      this.borderRadius,
      this.fontSizeFactor,
      this.fontFamily});
}
