import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'finders.dart';

class SettingsFinder extends TestFinder {
  //кнопка перехода в настройки темы changeTheme
  final Finder changeThemeButton = find.byType(ElevatedButton);

  //кнопка в настройках темы, скругления углов
  final Finder roundedBorderButton =
      find.byKey(const Key('roundedBorderButton'));

  //кнопка настроек - нужно искать по иконке
  final Finder settingsPageButton = find.byIcon(Icons.settings_outlined);
}
