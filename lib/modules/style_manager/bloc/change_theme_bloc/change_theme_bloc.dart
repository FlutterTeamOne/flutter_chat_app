import 'package:bloc/bloc.dart';
import 'package:chat_app/modules/storage_manager/preferences/user_preferences.dart';
import 'package:chat_app/modules/style_manager/themes/custom_themes.dart';

import 'change_theme_event.dart';
import 'change_theme_state.dart';

class ChangeThemeBloc extends Bloc<ChangeThemeEvent, ChangeThemeState> {
  // final initTheme = CustomTheme().darkThemeDeepPurple;
  ChangeThemeBloc()
      : super(ChangeThemeState(theme: CustomTheme().darkThemeDeepPurple)) {
    on<LightThemeDeepPurpleEvent>(_setLightThemeDeepPurple);
    on<LightThemeLightBlueEvent>(_setLightThemeLightBlue);
    on<LightThemeOrangeEvent>(_setLightThemeOrange);
    on<DarkThemeDeepPurpleEvent>(_setDarkThemeDeepPurple);
    on<DarkThemeLightBlueEvent>(_setDarkThemeLightBlue);
    on<DarkThemeOrangeEvent>(_setDarkThemeOrange);
  }

  void _setLightThemeDeepPurple(
      ChangeThemeEvent event, Emitter<ChangeThemeState> emit) async {
    await UserPreferences().setTheme('lightThemeDeepPurple');
    emit(ChangeThemeState(theme: CustomTheme().lightThemeDeepPurple));
  }

  void _setLightThemeLightBlue(
      ChangeThemeEvent event, Emitter<ChangeThemeState> emit) async {
    await UserPreferences().setTheme('lightThemeLightBlue');
    emit(ChangeThemeState(theme: CustomTheme().lightThemeLightBlue));
  }

  void _setLightThemeOrange(
      ChangeThemeEvent event, Emitter<ChangeThemeState> emit) async {
    await UserPreferences().setTheme('lightThemeOrange');
    emit(ChangeThemeState(theme: CustomTheme().lightThemeOrange));
  }

  void _setDarkThemeDeepPurple(
      ChangeThemeEvent event, Emitter<ChangeThemeState> emit) async {
    await UserPreferences().setTheme('darkThemeDeepPurple');
    emit(ChangeThemeState(theme: CustomTheme().darkThemeDeepPurple));
  }

  void _setDarkThemeLightBlue(
      ChangeThemeEvent event, Emitter<ChangeThemeState> emit) async {
    await UserPreferences().setTheme('darkThemeLightBlue');
    emit(ChangeThemeState(theme: CustomTheme().darkThemeLightBlue));
  }

  void _setDarkThemeOrange(
      ChangeThemeEvent event, Emitter<ChangeThemeState> emit) async {
    await UserPreferences().setTheme('darkThemeOrange');
    emit(ChangeThemeState(theme: CustomTheme().darkThemeOrange));
  }
}
