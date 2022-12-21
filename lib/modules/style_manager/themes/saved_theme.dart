import 'package:chat_app/modules/storage_manager/library/library_storage_manager.dart';

class SavedTheme {
  late int _initThemeIndex;
  late UserPreferences _preferences;
  int get initThemeIndex => _initThemeIndex;

  SavedTheme() {
    _initThemeIndex = 1;
    _preferences = UserPreferences();
    getPreferences();
  }
  set initThemeIndex(int value) {
    _initThemeIndex = value;
    _preferences.setThemeEvent(value);
  }

  getPreferences() async {
    _initThemeIndex = await _preferences.getTheme();
    return _initThemeIndex as int;
  }
}
