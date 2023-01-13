import 'package:flutter_test/flutter_test.dart';

import '../finders.dart';

class SettingsPageRobot {
  SettingsPageRobot({required this.tester});
  final WidgetTester tester;

  Future<void> tapSettings() async {
    //нажать на первого юзера finders.firstUserButton
    await tester.pumpAndSettle(const Duration(seconds: 1));
    //Finders().firstUserButton
    await tester.tap(Finders().firstUserButton);
    //нажать на настройки
    await tester.pumpAndSettle();
    await tester.tap(Finders().settingsPageButton);
    await tester.pumpAndSettle();
  }

  Future<void> tapChangeTheme() async {
    //нажать на смену темы
    await tester.pumpAndSettle(const Duration(seconds: 1));
    await tester.tap(Finders().changeThemeButton);
    await tester.pumpAndSettle();
    //проверка
    expect(Finders().roundedBorderButton, findsOneWidget);
    await tester.pumpAndSettle();
  }

  Future<void> goToAuthPage() async {
    await tester.pumpAndSettle(const Duration(seconds: 1));
    await tester.tap(Finders().backFromSettinsPageButton);
    await tester.pumpAndSettle(const Duration(seconds: 1));
    await tester.pumpAndSettle();
    expect(Finders().firstUserButton, findsOneWidget);
    await tester.pumpAndSettle();
  }
}
