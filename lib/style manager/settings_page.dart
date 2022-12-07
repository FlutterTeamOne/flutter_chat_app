import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat_app/style%20manager/bloc/change_theme_bloc/change_theme_bloc.dart';
import 'package:flutter_chat_app/style%20manager/themes/custom_themes.dart';

import 'bloc/change_theme_bloc/change_theme_event.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ChangeThemeBloc changeThemeBloc =
        BlocProvider.of<ChangeThemeBloc>(context);
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  color: CustomTheme().darkThemeDeepPurple.colorScheme.primary,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                            onPressed: () {
                              changeThemeBloc.add(LightThemeDeepPurpleEvent());
                            },
                            icon: Icon(Icons.light_mode_outlined)),
                        IconButton(
                            onPressed: () {
                              changeThemeBloc.add(DarkThemeDeepPurpleEvent());
                            },
                            icon: Icon(Icons.dark_mode_outlined)),
                      ]),
                ),
                Card(
                  color: CustomTheme().darkThemeLightBlue.colorScheme.primary,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                            onPressed: () {
                              changeThemeBloc.add(LightThemeLightBlueEvent());
                            },
                            icon: Icon(Icons.light_mode_outlined)),
                        IconButton(
                            onPressed: () {
                              changeThemeBloc.add(DarkThemeLightBlueEvent());
                            },
                            icon: Icon(Icons.dark_mode_outlined)),
                      ]),
                ),
                Card(
                  color: CustomTheme().darkThemeOrange.colorScheme.primary,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                            onPressed: () {
                              changeThemeBloc.add(LightThemeOrangeEvent());
                            },
                            icon: Icon(Icons.light_mode_outlined)),
                        IconButton(
                            onPressed: () {
                              changeThemeBloc.add(DarkThemeOrangeEvent());
                            },
                            icon: Icon(Icons.dark_mode_outlined)),
                      ]),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
