import 'package:bloc/bloc.dart';

import 'change_theme_event.dart';
import 'change_theme_state.dart';

class ChangeThemeBloc extends Bloc<ChangeThemeEvent, ChangeThemeState> {
  ChangeThemeBloc() : super(ChangeThemeState(theme: 'dark')) {
    on<LightThemeEvent>(_setLightTheme);
    on<DarkThemeEvent>(_setDarkTheme);
  }

  void _setLightTheme(ChangeThemeEvent event, Emitter<ChangeThemeState> emit) async {
    const lightTheme = 'light';
    emit(ChangeThemeState(theme: lightTheme));
  }

  void _setDarkTheme(ChangeThemeEvent event, Emitter<ChangeThemeState> emit) async {
    const darkTheme = 'dark';
    emit(ChangeThemeState(theme: darkTheme));
  }
}
