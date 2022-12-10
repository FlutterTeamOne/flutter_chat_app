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
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                  color: CustomTheme().darkThemeDeepPurple.primaryColor,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                            onPressed: () {
                              changeThemeBloc.add(LightThemeDeepPurpleEvent());
                            },
                            icon: const Icon(Icons.light_mode_outlined,
                              color: Colors.white,),
                        iconSize: 20,
                        ),
                        IconButton(
                            onPressed: () {
                              changeThemeBloc.add(DarkThemeDeepPurpleEvent());
                            },
                            icon: const Icon(Icons.dark_mode_outlined,
                              color: Colors.black87,),
                          iconSize: 20,
                        ),
                      ]),
                ),
                Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                  color: CustomTheme().darkThemeLightBlue.primaryColor,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                            onPressed: () {
                              changeThemeBloc.add(LightThemeLightBlueEvent());
                            },
                            icon: const Icon(Icons.light_mode_outlined,
                              color: Colors.white,),
                          iconSize: 20,
                        ),
                        IconButton(
                            onPressed: () {
                              changeThemeBloc.add(DarkThemeLightBlueEvent());
                            },
                            icon: const Icon(Icons.dark_mode_outlined,
                              color: Colors.black87,),
                          iconSize: 20,
                        ),
                      ]),
                ),
                Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                  color: CustomTheme().darkThemeOrange.primaryColor,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                            onPressed: () {
                              changeThemeBloc.add(LightThemeOrangeEvent());
                            },
                            icon: Icon(Icons.light_mode_outlined,
                            color: Colors.white,
                            ),
                          iconSize: 20,
                        ),
                        IconButton(
                            onPressed: () {
                              changeThemeBloc.add(DarkThemeOrangeEvent());
                            },
                            icon: const Icon(Icons.dark_mode_outlined,
                              color: Colors.black87,),
                          iconSize: 20,
                        ),
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
