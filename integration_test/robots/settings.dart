import 'package:flutter_test/flutter_test.dart';

import '../finders/settings.dart';
import '../finders/user.dart';

class SettingsPageRobot {
  SettingsPageRobot({required this.tester});
  final WidgetTester tester;
  final SettingsFinder finder = SettingsFinder();
  final UserFinder userFinder = UserFinder();

  Future<void> tapSettings() async {
    //нажать на первого юзера finders.firstUserButton
    await tester.pumpAndSettle(const Duration(seconds: 1));

    //Finders().firstUserButton
    await tester.tap(userFinder.firstUserButton);
    await tester.pumpAndSettle();

    //нажать на настройки
    await tester.tap(finder.settingsPageButton);
    await tester.pumpAndSettle();
  }

  Future<void> tapChangeTheme() async {
    //нажать на смену темы
    await tester.pumpAndSettle(const Duration(seconds: 1));

    await tester.tap(finder.changeThemeButton);
    await tester.pumpAndSettle();

    //проверка
    expect(finder.roundedBorderButton, findsOneWidget);
    await tester.pumpAndSettle();
  }

  Future<void> goToAuthPage() async {
    await tester.pumpAndSettle(const Duration(seconds: 1));

    await tester.tap(finder.exitButton);
    await tester.pumpAndSettle(const Duration(seconds: 1));

    await tester.pumpAndSettle();
    expect(userFinder.firstUserButton, findsOneWidget);
    await tester.pumpAndSettle();
  }
}
