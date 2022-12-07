import 'package:bloc/bloc.dart';

import 'change_theme_event.dart';
import 'change_theme_state.dart';

class ChangeThemeBloc extends Bloc<ChangeThemeEvent, ChangeThemeState> {
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
    emit(ChangeThemeState(theme: 'lightThemeDeepPurple'));
  }

  void _setLightThemeLightBlue(
      ChangeThemeEvent event, Emitter<ChangeThemeState> emit) async {
    emit(ChangeThemeState(theme: 'lightThemeLightBlue'));
  }

  void _setLightThemeOrange(
      ChangeThemeEvent event, Emitter<ChangeThemeState> emit) async {
    emit(ChangeThemeState(theme: 'lightThemeOrange'));
  }

  void _setDarkThemeDeepPurple(
      ChangeThemeEvent event, Emitter<ChangeThemeState> emit) async {
    emit(ChangeThemeState(theme: 'darkThemeDeepPurple'));
  }

  void _setDarkThemeLightBlue(
      ChangeThemeEvent event, Emitter<ChangeThemeState> emit) async {
    emit(ChangeThemeState(theme: 'darkThemeLightBlue'));
  }

  void _setDarkThemeOrange(
      ChangeThemeEvent event, Emitter<ChangeThemeState> emit) async {
    emit(ChangeThemeState(theme: 'darkThemeOrange'));
  }
}
