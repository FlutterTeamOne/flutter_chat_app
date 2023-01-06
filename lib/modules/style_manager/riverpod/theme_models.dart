import 'package:flutter/material.dart';

class UserThemeData {
  final double? borderRadius;
  final double? fontSizeFactor;
  final Color? primaryColor;
  final String? fontFamily;
  final Color? textColor;
  final Brightness? brightness;
  UserThemeData({
    this.fontFamily,
    this.fontSizeFactor,
    this.textColor,
    this.brightness,
    this.primaryColor,
    this.borderRadius,
  });

  UserThemeData copyWith({
    final double? borderRadius,
    final double? fontSizeFactor,
    final Color? primaryColor,
    final String? fontFamily,
    final Color? textColor,
    final Brightness? brightness,
  }) {
    return UserThemeData(
      borderRadius: borderRadius,
      fontSizeFactor: fontSizeFactor,
      fontFamily: fontFamily,
      primaryColor: primaryColor,
      textColor: textColor,
      brightness: brightness,
    );
  }
}
