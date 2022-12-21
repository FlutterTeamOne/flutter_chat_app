import 'package:chat_app/main.dart';
import 'package:chat_app/modules/storage_manager/db_helper/user_path.dart';
import 'package:chat_app/modules/style_manager/themes/saved_theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:chat_app/modules/storage_manager/preferences/user_preferences.dart';
import 'package:chat_app/modules/style_manager/themes/custom_themes.dart';

import 'change_theme_event.dart';
import 'change_theme_state.dart';

class ChangeThemeBloc extends Bloc<ChangeThemeEvent, ChangeThemeState> {
  static int get initThemeIndex => UserPreferences().getTheme();

      // UserPref.getThemeIndex == null ? 1 : UserPref.getThemeIndex;
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
    var i = await UserPreferences().getTheme();
    print('event. index: ${event.index}');
    print('get i: $i');
    // UserPref.setThemeIndex = event.index;
    emit(ChangeThemeState(
        theme: CustomTheme().themes[event.index], index: event.index));
  }
}
