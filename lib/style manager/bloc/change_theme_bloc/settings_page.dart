import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat_app/style%20manager/bloc/change_theme_bloc/change_theme_bloc.dart';

import 'change_theme_event.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ChangeThemeBloc changeThemeBloc = BlocProvider.of<ChangeThemeBloc>(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
            IconButton(
                onPressed: () {
                  changeThemeBloc.add(LightThemeEvent());
                },
                icon: Icon(Icons.light_mode_outlined)),
            IconButton(
                onPressed: () {
                  changeThemeBloc.add(DarkThemeEvent());
                },
                icon: Icon(Icons.dark_mode_outlined)),
            ]),
          ],
        ),
      ),
    );
  }
}
