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
        return themeSettings(changeThemeBloc, state);
      })
    ])));
  }

  Column themeSettings(ChangeThemeBloc changeThemeBloc, state) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ListView.builder(
            itemCount: 3,
            itemBuilder: (BuildContext context, int cardIndex) {
              return Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  color: state.cardColor[cardIndex],
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ListView.builder(
                          scrollDirection: Axis.horizontal,
                            itemCount: 2,
                            itemBuilder: (BuildContext context, int iconIndex) {
                              return IconButton(
                                onPressed: () {
                                  changeThemeBloc.add(SetTheme(
                                      index: cardIndex*2 + iconIndex));
                                },
                                icon: Icon(
                                  state.selectIcon[iconIndex],
                                  color: state.iconColor[state.index],
                                ),
                                iconSize: 20,
                              );
                            })
                      ]));
            })
      ],
    );
  }
}
