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
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      BlocBuilder<ChangeThemeBloc, ChangeThemeState>(builder: (context, state) {
        const double opacity = 0.2;
        Color iconDeepPurpleLightColor = Colors.white.withOpacity(opacity);
        Color iconDeepPurpleDarkColor = Colors.white.withOpacity(opacity);
        Color iconIndigoDarkColor = Colors.white.withOpacity(opacity);
        Color iconIndigoLightColor = Colors.white.withOpacity(opacity);
        Color iconBlueGreyLightColor = Colors.white.withOpacity(opacity);
        Color iconBlueGreyDarkColor = Colors.white.withOpacity(opacity);
        /// Need refactoring
        // DeepPurple icon color
        if (state.theme.primaryColor == Colors.deepPurple &&
            state.theme.brightness == Brightness.dark) {
          iconDeepPurpleDarkColor = Colors.white;
        } else if (state.theme.primaryColor == Colors.deepPurple &&
            state.theme.brightness == Brightness.light) {
          iconDeepPurpleLightColor = Colors.white;
          //  Indigo icon color
        } else if (state.theme.primaryColor == Colors.indigo &&
            state.theme.brightness == Brightness.light) {
          iconIndigoLightColor = Colors.white;
        } else if (state.theme.primaryColor == Colors.indigo &&
            state.theme.brightness == Brightness.dark) {
          iconIndigoDarkColor = Colors.white;
          //  BlueGrey icon color
        } else if (state.theme.primaryColor == Colors.blueGrey &&
            state.theme.brightness == Brightness.dark) {
          iconBlueGreyDarkColor = Colors.white;
        } else if (state.theme.primaryColor == Colors.blueGrey &&
            state.theme.brightness == Brightness.light) {
          iconBlueGreyLightColor = Colors.white;
        }
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              color: CustomTheme().darkThemeDeepPurple.primaryColor,
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                IconButton(
                  onPressed: () {
                    changeThemeBloc.add(LightThemeDeepPurpleEvent());
                  },
                  icon: Icon(
                    Icons.light_mode_outlined,
                    color: iconDeepPurpleLightColor,
                  ),
                  iconSize: 20,
                ),
                IconButton(
                  onPressed: () {
                    changeThemeBloc.add(DarkThemeDeepPurpleEvent());
                  },
                  icon: Icon(
                    Icons.dark_mode_outlined,
                    color: iconDeepPurpleDarkColor,
                  ),
                  iconSize: 20,
                ),
              ]),
            ),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              color: CustomTheme().darkThemeLightBlue.primaryColor,
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                IconButton(
                  onPressed: () {
                    changeThemeBloc.add(LightThemeLightBlueEvent());
                  },
                  icon: Icon(
                    Icons.light_mode_outlined,
                    color: iconIndigoLightColor,
                  ),
                  iconSize: 20,
                ),
                IconButton(
                  onPressed: () {
                    changeThemeBloc.add(DarkThemeLightBlueEvent());
                  },
                  icon: Icon(
                    Icons.dark_mode_outlined,
                    color: iconIndigoDarkColor,
                  ),
                  iconSize: 20,
                ),
              ]),
            ),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              color: CustomTheme().darkThemeOrange.primaryColor,
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                IconButton(
                  onPressed: () {
                    changeThemeBloc.add(LightThemeOrangeEvent());
                  },
                  icon: Icon(
                    Icons.light_mode_outlined,
                    color: iconBlueGreyLightColor,
                  ),
                  iconSize: 20,
                ),
                IconButton(
                  onPressed: () {
                    changeThemeBloc.add(DarkThemeOrangeEvent());
                  },
                  icon: Icon(
                    Icons.dark_mode_outlined,
                    color: iconBlueGreyDarkColor,
                  ),
                  iconSize: 20,
                ),
              ]),
            ),
          ],
        );
      })
    ])));
  }
}
