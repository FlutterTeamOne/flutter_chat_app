import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../modules/style_manager/bloc/change_theme_bloc/change_theme_bloc.dart';
import '../../../modules/style_manager/bloc/change_theme_bloc/change_theme_event.dart';
import '../../../modules/style_manager/bloc/change_theme_bloc/change_theme_state.dart';

Widget CardWidget(BuildContext context, int index) {
  final ChangeThemeBloc changeThemeBloc = context.read<ChangeThemeBloc>();
  return BlocBuilder<ChangeThemeBloc, ChangeThemeState>(
    builder: (context, state) {
      return Card(
        color: state.cardColor[index],
        // shape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.circular(20.0),
        // ),
        child: SizedBox(
          height: 40,
          width: 40,
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            IconButton(
              onPressed: () {
                changeThemeBloc.add(SetThemeEvent(fontSizeFactor: 1, index: index * 2 + 0));
              },
              icon: Icon(
                state.selectIcon[0],
                color: state.iconColor[index * 2 + 0],
              ),
              iconSize: 20,
            ),
            IconButton(
              onPressed: () {
                changeThemeBloc.add(SetThemeEvent(fontSizeFactor: 1, index: index * 2 + 1));
              },
              icon: Icon(
                state.selectIcon[1],
                color: state.iconColor[index * 2 + 1],
              ),
              iconSize: 20,
            ),
          ]),
        ),
      );
    },
  );
}

