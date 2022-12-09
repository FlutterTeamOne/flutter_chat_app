import 'package:flutter/material.dart';

class CustomTheme {
  ThemeData lightThemeDeepPurple = ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.deepPurple,
  );
  ThemeData darkThemeDeepPurple = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.deepPurple,
  );


  ThemeData darkThemeLightBlue = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.lightBlue,
  );
  ThemeData lightThemeLightBlue = ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.lightBlue,
  );


  ThemeData darkThemeOrange = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.orange,
  );
  ThemeData lightThemeOrange = ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.orange,
  );
}