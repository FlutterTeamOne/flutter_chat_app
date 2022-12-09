import 'package:chat_app/src/libraries/library_all.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
                            icon: const Icon(Icons.light_mode_outlined)),
                        IconButton(
                            onPressed: () {
                              changeThemeBloc.add(DarkThemeDeepPurpleEvent());
                            },
                            icon: const Icon(Icons.dark_mode_outlined)),
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
                            icon: const Icon(Icons.light_mode_outlined)),
                        IconButton(
                            onPressed: () {
                              changeThemeBloc.add(DarkThemeLightBlueEvent());
                            },
                            icon: const Icon(Icons.dark_mode_outlined)),
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
                            icon: const Icon(Icons.light_mode_outlined)),
                        IconButton(
                            onPressed: () {
                              changeThemeBloc.add(DarkThemeOrangeEvent());
                            },
                            icon: const Icon(Icons.dark_mode_outlined)),
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
