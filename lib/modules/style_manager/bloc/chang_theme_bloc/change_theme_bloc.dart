import 'package:bloc/bloc.dart';

import '../../../../src/libraries/library_all.dart';

class ChangeThemeBloc extends Bloc<ChangeThemeEvent, ChangeThemeState> {
  // final savedTheme = UserPreferences().getTheme() == null
  //     ? 'darkThemeDeepPurple'
  //     : UserPreferences().getTheme();
  ChangeThemeBloc() : super(ChangeThemeState(theme: 'darkThemeDeepPurple')) {
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
    emit(ChangeThemeState(theme: 'lightThemeDeepPurple'));
  }

  void _setLightThemeLightBlue(
      ChangeThemeEvent event, Emitter<ChangeThemeState> emit) async {
    await UserPreferences().setTheme('lightThemeLightBlue');
    emit(ChangeThemeState(theme: 'lightThemeLightBlue'));
  }

  void _setLightThemeOrange(
      ChangeThemeEvent event, Emitter<ChangeThemeState> emit) async {
    await UserPreferences().setTheme('lightThemeOrange');
    emit(ChangeThemeState(theme: 'lightThemeOrange'));
  }

  void _setDarkThemeDeepPurple(
      ChangeThemeEvent event, Emitter<ChangeThemeState> emit) async {
    await UserPreferences().setTheme('darkThemeDeepPurple');
    emit(ChangeThemeState(theme: 'darkThemeDeepPurple'));
  }

  void _setDarkThemeLightBlue(
      ChangeThemeEvent event, Emitter<ChangeThemeState> emit) async {
    await UserPreferences().setTheme('darkThemeLightBlue');
    emit(ChangeThemeState(theme: 'darkThemeLightBlue'));
  }

  void _setDarkThemeOrange(
      ChangeThemeEvent event, Emitter<ChangeThemeState> emit) async {
    await UserPreferences().setTheme('darkThemeOrange');
    emit(ChangeThemeState(theme: 'darkThemeOrange'));
  }
}
