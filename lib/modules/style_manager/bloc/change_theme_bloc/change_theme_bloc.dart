import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:chat_app/modules/storage_manager/preferences/user_preferences.dart';
import 'package:chat_app/modules/style_manager/themes/custom_themes.dart';


import 'change_theme_event.dart';
import 'change_theme_state.dart';

class ChangeThemeBloc extends Bloc<ChangeThemeEvent, ChangeThemeState> {
  ChangeThemeBloc()
      : super(ChangeThemeState(
    theme: CustomTheme().darkThemeDeepPurple,
    index: 1,
  )) {
    on<SetTheme>(_setTheme);
  }

  void _setTheme(ChangeThemeEvent event, Emitter<ChangeThemeState> emit) async {
    await UserPreferences().setTheme('lightThemeDeepPurple');
    await UserPreferences().getTheme();
    emit(ChangeThemeState(
        theme: CustomTheme().themes[event.index]!, index: event.index));
  }
}