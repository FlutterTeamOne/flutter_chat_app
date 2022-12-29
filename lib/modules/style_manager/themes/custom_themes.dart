import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

class CustomTheme {
  static final ThemeData lightThemeDeepPurple = ThemeData(
      brightness: Brightness.light,
      primarySwatch: Colors.deepPurple,
      primaryColor: Colors.deepPurple,
      errorColor: Colors.redAccent.shade200,
      backgroundColor: Colors.white70,
      indicatorColor: Colors.white,
      //стиль для scroll down button
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black54,
      ),
      // hintColor: Colors.white70,
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: Colors.black26,
        selectionColor: Colors.black26,
        selectionHandleColor: Colors.black26,
      ));
  static final ThemeData darkThemeDeepPurple = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.deepPurple,
    primaryColor: Colors.deepPurple,
    errorColor: Colors.redAccent.shade200,
    indicatorColor: Colors.white,
    //стиль для scroll down button
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Colors.grey.shade800,
      foregroundColor: Colors.white70,
    ),
    // backgroundColor: Colors.blueGrey,
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: Colors.white70,
      selectionColor: Colors.white70,
      selectionHandleColor: Colors.white70,
    ),
  );

  static final ThemeData darkThemeLightBlue = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.indigo,
    primaryColor: Colors.indigo,
    errorColor: Colors.redAccent.shade200,
    //стиль для scroll down button
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Colors.grey.shade800,
      foregroundColor: Colors.white70,
    ),
    // backgroundColor: Colors.black45,
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: Colors.white70,
      selectionColor: Colors.white70,
      selectionHandleColor: Colors.white70,
    ),
  );

  static final ThemeData lightThemeLightBlue = ThemeData(
      brightness: Brightness.light,
      primarySwatch: Colors.indigo,
      primaryColor: Colors.indigo,
      errorColor: Colors.redAccent.shade200,
      //стиль для scroll down button
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black54,
      ),
      // backgroundColor: Colors.white70,
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: Colors.black26,
        selectionColor: Colors.black26,
        selectionHandleColor: Colors.black26,
      ));

  static final ThemeData darkThemeBlueGray = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.blueGrey,
    primaryColor: Colors.blueGrey,
    errorColor: Colors.redAccent.shade200,
    //стиль для scroll down button
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Colors.grey.shade800,
      foregroundColor: Colors.white70,
    ),
    // backgroundColor: Colors.black45,
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: Colors.white70,
      selectionColor: Colors.white70,
      selectionHandleColor: Colors.white70,
    ),
  );

  static final ThemeData lightThemeOrange = ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.blueGrey,
    primaryColor: Colors.blueGrey,
    errorColor: Colors.redAccent.shade200,
    // backgroundColor: Colors.black45,
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: Colors.white70,
      selectionColor: Colors.white70,
      selectionHandleColor: Colors.black26,
    ),
    //стиль для scroll down button
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Colors.white,
      foregroundColor: Colors.black54,
    ),
  );
  final themes = [
    CustomTheme.lightThemeDeepPurple,
    CustomTheme.darkThemeDeepPurple,
    CustomTheme.lightThemeLightBlue,
    CustomTheme.darkThemeLightBlue,
    CustomTheme.lightThemeOrange,
  ];
}
