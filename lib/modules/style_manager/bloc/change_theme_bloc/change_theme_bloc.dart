import 'package:chat_app/modules/style_manager/themes/saved_theme.dart';
import 'package:chat_app/modules/style_manager/themes/themes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:chat_app/modules/storage_manager/preferences/user_preferences.dart';


import 'change_theme_event.dart';
import 'change_theme_state.dart';

class ChangeThemeBloc extends Bloc<ChangeThemeEvent, ChangeThemeState> {
  // static int initIndex = SavedTheme().initThemeIndex;
  ChangeThemeBloc()
      : super(ChangeThemeState(
          theme: CustomTheme().themes[1],
          index: 1,
        )) {
    on<SetThemeEvent>(_setThemeEvent);
  }

  void _setThemeEvent(
      SetThemeEvent event, Emitter<ChangeThemeState> emit) async {
    await UserPreferences().setThemeEvent(event.index);
    // SavedTheme().initThemeIndex = event.index;
    // var i = await UserPreferences().getTheme();
    // print(i);
    emit(ChangeThemeState(
        theme: CustomTheme().themes[event.index], index: event.index));
  }
}
