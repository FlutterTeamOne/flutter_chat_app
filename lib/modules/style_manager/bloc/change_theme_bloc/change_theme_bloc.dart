import 'package:bloc/bloc.dart';
import 'package:chat_app/modules/storage_manager/preferences/user_preferences.dart';
import 'package:chat_app/modules/style_manager/themes/custom_themes.dart';


import 'change_theme_event.dart';
import 'change_theme_state.dart';

class ChangeThemeBloc extends Bloc<ChangeThemeEvent, ChangeThemeState> {
  // static const Color choiceColor = Colors.white;
  // static final Color unchoiceColor = Colors.white.withOpacity(0.2);
  // static final
  ChangeThemeBloc()
      : super(ChangeThemeState(
          theme: CustomTheme().darkThemeDeepPurple,
          index: 1,
        )) {
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
    await UserPreferences().getTheme();
    emit(ChangeThemeState(
        theme: CustomTheme().lightThemeDeepPurple, index: event.index));
  }

  void _setLightThemeLightBlue(
      ChangeThemeEvent event, Emitter<ChangeThemeState> emit) async {
    await UserPreferences().setTheme('lightThemeLightBlue');
    await UserPreferences().getTheme();
    emit(ChangeThemeState(
        theme: CustomTheme().lightThemeLightBlue, index: event.index));
  }

  void _setLightThemeOrange(
      ChangeThemeEvent event, Emitter<ChangeThemeState> emit) async {
    await UserPreferences().setTheme('lightThemeOrange');
    await UserPreferences().getTheme();
    emit(ChangeThemeState(
        theme: CustomTheme().lightThemeOrange, index: event.index));
  }

  void _setDarkThemeDeepPurple(
      ChangeThemeEvent event, Emitter<ChangeThemeState> emit) async {
    await UserPreferences().setTheme('darkThemeDeepPurple');
    await UserPreferences().getTheme();
    emit(ChangeThemeState(
        theme: CustomTheme().darkThemeDeepPurple, index: event.index));
  }

  void _setDarkThemeLightBlue(
      ChangeThemeEvent event, Emitter<ChangeThemeState> emit) async {
    await UserPreferences().setTheme('darkThemeLightBlue');
    await UserPreferences().getTheme();
    emit(ChangeThemeState(
        theme: CustomTheme().darkThemeLightBlue, index: event.index));
  }

  void _setDarkThemeOrange(
      ChangeThemeEvent event, Emitter<ChangeThemeState> emit) async {
    await UserPreferences().setTheme('darkThemeOrange');
    await UserPreferences().getTheme();
    emit(ChangeThemeState(
        theme: CustomTheme().darkThemeOrange, index: event.index));
  }
}
