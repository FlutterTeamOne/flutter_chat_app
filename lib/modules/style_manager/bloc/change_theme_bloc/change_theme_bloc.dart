import 'dart:async';

import 'package:chat_app/modules/style_manager/themes/saved_theme.dart';
import 'package:chat_app/modules/style_manager/themes/custom_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:chat_app/modules/storage_manager/preferences/user_preferences.dart';

import 'change_theme_event.dart';
import 'change_theme_state.dart';

class ChangeThemeBloc extends Bloc<ChangeThemeEvent, ChangeThemeState> {
  // static int initIndex = SavedTheme().initThemeIndex;
  ChangeThemeBloc()
      : super(ChangeThemeState(
          borderRadius: 20,
          fontSizeFactor: 1,
          primaryColor: Colors.blueGrey,
          brightness: Brightness.dark,
          theme: CustomThemes().themes[1],
          index: 1,
        )) {
    on<SetThemeEvent>(_setThemeEvent);
    on<SetCustomThemesEvent>(_onSetCustomThemesEvent);
  }

  void _setThemeEvent(
      SetThemeEvent event, Emitter<ChangeThemeState> emit) async {
    await UserPreferences().setThemeEvent(event.index);
    // SavedTheme().initThemeIndex = event.index;
    // var i = await UserPreferences().getTheme();
    // print(i);
    emit(ChangeThemeState(
        brightness: CustomThemes().themes[event.index].brightness,
        theme: CustomThemes().themes[event.index],
        index: event.index));
  }

  FutureOr<void> _onSetCustomThemesEvent(
      SetCustomThemesEvent event, Emitter<ChangeThemeState> emit) {
    print(event.index);
    emit(ChangeThemeState(
      borderRadius: event.borderRadius,
      primaryColor: event.primaryColor,
      index: event.index,
      brightness: event.brightness,
      fontSizeFactor: event.fontSizeFactor,
    ));
  }
}
