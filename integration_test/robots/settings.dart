import '../finders.dart';
import '../library.dart';

class SettingsPageRobot {
  SettingsPageRobot({required this.tester});
  final WidgetTester tester;

  Future<void> tapSettings() async {
    //нажать на первого юзера finders.firstUserButton
    await tester.pumpAndSettle(const Duration(milliseconds: 500));
    await tester.tap(Finders().firstUserButton);
    //нажать на настройки
    await tester.pumpAndSettle(const Duration(milliseconds: 500));
    await tester.tap(Finders().settingsPageButton);
    await tester.pumpAndSettle(const Duration(milliseconds: 500));
  }

  Future<void> tapChangeTheme() async {
    //нажать на смену темы
    await tester.tap(Finders().changeThemeButton);
    await tester.pumpAndSettle(const Duration(milliseconds: 500));
    //проверка
    expect(Finders().roundedBorderButton, findsOneWidget);
    await tester.pumpAndSettle(const Duration(milliseconds: 500));
  }

  Future<void> goToAuthPage() async {
    await tester.pumpAndSettle(const Duration(milliseconds: 500));
    await tester.tap(Finders().backFromSettinsPageButton);
    await tester.pumpAndSettle(const Duration(milliseconds: 500));
    await tester.pumpAndSettle();
    expect(Finders().firstUserWidget, findsOneWidget);
    await tester.pumpAndSettle(const Duration(milliseconds: 500));
  }
}
