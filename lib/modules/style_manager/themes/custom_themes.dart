import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

class CustomTheme {
  final Map<int, ThemeData> themes = {
    0: CustomTheme().lightThemeDeepPurple,
    1: CustomTheme().lightThemeDeepPurple,
    2: CustomTheme().lightThemeDeepPurple,
    3: CustomTheme().lightThemeDeepPurple,
    4: CustomTheme().lightThemeDeepPurple,
    5: CustomTheme().lightThemeDeepPurple,
  };

  ThemeData lightThemeDeepPurple = ThemeData(

      brightness: Brightness.light,
      primarySwatch: Colors.deepPurple,
      primaryColor: Colors.deepPurple,
      errorColor: Colors.redAccent.shade200,
      backgroundColor: Colors.white70,
      indicatorColor: Colors.white,
      // hintColor: Colors.white70,
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: Colors.black26,
        selectionColor: Colors.black26,
        selectionHandleColor: Colors.black26,
      ));
  ThemeData darkThemeDeepPurple = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.deepPurple,
    primaryColor: Colors.deepPurple,
    errorColor: Colors.redAccent.shade200,
    indicatorColor: Colors.white,
    // backgroundColor: Colors.blueGrey,
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: Colors.white70,
      selectionColor: Colors.white70,
      selectionHandleColor: Colors.white70,
    ),
  );

  ThemeData darkThemeLightBlue = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.indigo,
    primaryColor: Colors.indigo,
    errorColor: Colors.redAccent.shade200,
    // backgroundColor: Colors.black45,
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: Colors.white70,
      selectionColor: Colors.white70,
      selectionHandleColor: Colors.white70,
    ),
  );
  ThemeData lightThemeLightBlue = ThemeData(
      brightness: Brightness.light,
      primarySwatch: Colors.indigo,
      primaryColor: Colors.indigo,
      errorColor: Colors.redAccent.shade200,
      // backgroundColor: Colors.white70,
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: Colors.black26,
        selectionColor: Colors.black26,
        selectionHandleColor: Colors.black26,
      ));

  ThemeData darkThemeOrange = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.blueGrey,
    primaryColor: Colors.blueGrey,
    errorColor: Colors.redAccent.shade200,
    // backgroundColor: Colors.black45,
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: Colors.white70,
      selectionColor: Colors.white70,
      selectionHandleColor: Colors.white70,
    ),
  );
  ThemeData lightThemeOrange = ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.blueGrey,
    primaryColor: Colors.blueGrey,
    errorColor: Colors.redAccent.shade200,
    // backgroundColor: Colors.white70,
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: Colors.black26,
      selectionColor: Colors.black26,
      selectionHandleColor: Colors.black26,
    ),
  );
}
