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
      // backgroundColor: Colors.white70,
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: Colors.black26,
        selectionColor: Colors.black26,
        selectionHandleColor: Colors.black26,
      ));


    static final ThemeData darkThemeOrange = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.blueGrey,
    primaryColor: Colors.blueGrey,
    errorColor: Colors.redAccent.shade200,
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
        selectionHandleColor: Colors.white70,
      ),
  );
    final themes = [
      CustomTheme.lightThemeDeepPurple,
      CustomTheme.darkThemeDeepPurple,
      CustomTheme.lightThemeLightBlue,
      CustomTheme.darkThemeLightBlue,
      CustomTheme.lightThemeOrange,
      CustomTheme.darkThemeOrange,
    ];
}
