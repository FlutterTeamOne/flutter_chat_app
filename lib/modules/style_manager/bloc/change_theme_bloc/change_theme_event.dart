import 'package:flutter/material.dart';

abstract class ChangeThemeEvent {
  // late int index;
  // late Brightness brightness;
}

class SetThemeEvent extends ChangeThemeEvent {
  final int index;
  SetThemeEvent({
    required this.index,
  });
}

class SetCustomThemesEvent extends ChangeThemeEvent {
  final int index;
  final Brightness brightness;
  final Color primaryColor;
  final double? borderRadius;
  final double? fontSizeFactor;
  SetCustomThemesEvent(
      {required this.index,
      required this.brightness,
      required this.primaryColor,
      this.borderRadius,
      this.fontSizeFactor});
}
