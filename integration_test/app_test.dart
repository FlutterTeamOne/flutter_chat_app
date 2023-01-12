import 'package:chat_app/main.dart' as app;
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'finders.dart';
import 'robots/asap_page.dart';
import 'robots/create_user.dart';
import 'robots/settings.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  Finders finders;
  CreateUserRobot createUserTest;
  SettingsPageRobot settingsTest;
  AsapPageRobot asapTest;

  group('Integration test', () {
    setUpAll(() {
      app.main();
    });

    testWidgets('whole app test', (WidgetTester tester) async {
      finders = Finders();
      createUserTest = CreateUserRobot(tester: tester);
      settingsTest = SettingsPageRobot(tester: tester);
      asapTest = AsapPageRobot(tester: tester);

      await createUserTest.createUserTest(
          userWidget: finders.seventhUserWidget,
          name: 'newuser',
          email: 'newuser@mail.ru',
          password: 'password');
      await createUserTest.checkCreateUser(
          userWidget: finders.seventhUserButton, username: 'newuser');
      await createUserTest.cancelCreateUser(
          userWidget: finders.eighthUserWidget);

      await settingsTest.tapSettings();
      await settingsTest.tapChangeTheme();
      await settingsTest.goToAuthPage();

      await asapTest.goToAsapPage(userButton: finders.firstUserButton);
      await asapTest.checkChats();
      await asapTest.addMessage(message: 'message');
      await asapTest.goToAuthPage();

      await tester.pumpAndSettle();
      await tester.pumpAndSettle(const Duration(seconds: 3));
    });
  });
}
