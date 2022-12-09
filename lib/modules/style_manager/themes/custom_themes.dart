import 'package:flutter/material.dart';

class CustomTheme {
  ThemeData lightThemeDeepPurple = ThemeData(
      // brightness: Brightness.light,
      // primarySwatch: Colors.deepPurple,
      colorScheme: ColorScheme(
          brightness: Brightness.light,
          primary: Color(0xFF7E57C2),
          onPrimary: Colors.white,
          secondary: Colors.tealAccent.shade100,
          onSecondary: Color(0xFFF44336),
          error: Colors.redAccent,
          onError: Colors.red,
          background: Color(0xFFE0E0E0),
          onBackground: Color(0xFFE0E0E0),
          surface: Color(0xFFDBD8D8),
          onSurface: Color(0xFFFFFFFF)));
  ThemeData darkThemeDeepPurple = ThemeData(
    // brightness: Brightness.dark,
    // primarySwatch: Colors.deepPurple,
    //  primaryColor: Color(0xFF7E57C2),
    colorScheme: ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xFF7E57C2),
      onPrimary: Colors.white,
      secondary: Colors.tealAccent.shade100,
      onSecondary: Color(0xFFF44336),
      error: Colors.redAccent,
      onError: Colors.red,
      background: Colors.black38,
      onBackground: Color(0xFFE0E0E0),
      surface: Color(0xFFDBD8D8),
      onSurface: Color(0xFFFFFFFF),
    ),
  );

  ThemeData darkThemeLightBlue = ThemeData(
    // brightness: Brightness.dark,
    // primarySwatch: Colors.lightBlue,
    colorScheme: ColorScheme(
        brightness: Brightness.dark,
        primary: Colors.lightBlue,
        onPrimary: Colors.white,
        secondary: Colors.tealAccent.shade100,
        onSecondary: Color(0xFFF44336),
        error: Colors.redAccent,
        onError: Colors.red,
        background: Colors.black38,
        onBackground: Color(0xFFE0E0E0),
        surface: Color(0xFFDBD8D8),
        onSurface: Color(0xFFFFFFFF)),
  );
  ThemeData lightThemeLightBlue = ThemeData(
    // brightness: Brightness.light,
    // primarySwatch: Colors.lightBlue,
    colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: Colors.lightBlue,
        onPrimary: Colors.white,
        secondary: Colors.tealAccent.shade100,
        onSecondary: Color(0xFFF44336),
        error: Colors.redAccent,
        onError: Colors.red,
        background: Color(0xFFE0E0E0),
        onBackground: Color(0xFFE0E0E0),
        surface: Color(0xFFDBD8D8),
        onSurface: Color(0xFFFFFFFF)),
  );

  ThemeData darkThemeOrange = ThemeData(
    // brightness: Brightness.dark,
    // primarySwatch: Colors.orange,
    colorScheme: ColorScheme(
        brightness: Brightness.dark,
        primary: Colors.orange,
        onPrimary: Colors.white,
        secondary: Colors.tealAccent.shade100,
        onSecondary: Color(0xFFF44336),
        error: Colors.redAccent,
        onError: Colors.red,
        background: Colors.black38,
        onBackground: Color(0xFFE0E0E0),
        surface: Color(0xFFDBD8D8),
        onSurface: Color(0xFFFFFFFF)),
  );
  ThemeData lightThemeOrange = ThemeData(
    // brightness: Brightness.light,
    // primarySwatch: Colors.orange,
    colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: Colors.orange,
        onPrimary: Colors.white,
        secondary: Colors.tealAccent.shade100,
        onSecondary: Color(0xFFF44336),
        error: Colors.redAccent,
        onError: Colors.red,
        background: Color(0xFFE0E0E0),
        onBackground: Color(0xFFE0E0E0),
        surface: Color(0xFFDBD8D8),
        onSurface: Color(0xFFFFFFFF)),
  );
}
