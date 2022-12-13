import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:chat_app/modules/storage_manager/preferences/user_preferences.dart';
import 'package:chat_app/modules/style_manager/themes/custom_themes.dart';


import 'change_theme_event.dart';
import 'change_theme_state.dart';

class ChangeThemeBloc extends Bloc<ChangeThemeEvent, ChangeThemeState> {

  // final bloc = ChangeThemeBloc();
  ChangeThemeBloc()
      : super(ChangeThemeState(
    theme: CustomTheme.darkThemeDeepPurple,
    index: 1,
  )) {
    on<SetThemeEvent>(_setThemeEvent);
  }

  void _setThemeEvent(SetThemeEvent event,
      Emitter<ChangeThemeState> emit) async {
    // initState();
    await UserPreferences().SetThemeEvent('lightThemeDeepPurple');
    await UserPreferences().getTheme();
    print(event.index);
    for (int i = 0; i <= 5; i++) {
      if (i == event.index) {
        state.iconColor[i] = Colors.white;
      } else {
        state.iconColor[i] = Colors.white.withOpacity(0.2);
      }
      print('state.index ${state.iconColor[event.index]}');

      emit(ChangeThemeState(
          theme: CustomTheme().themes[event.index]!, index: event.index));
      // dispose();
    }
  }
}