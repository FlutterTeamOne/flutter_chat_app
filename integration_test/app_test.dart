import 'package:chat_app/main.dart' as app;
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'finders.dart';
import 'robots/asap_page.dart';
import 'robots/create_user.dart';
import 'robots/delete_user.dart';
import 'robots/settings.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  Finders finders;
  CreateUserRobot createUserTest;
  SettingsPageRobot settingsTest;
  AsapPageRobot asapTest;
  DeleteUserRobot deleteUserTest;

  group('Integration tests', () {
    setUpAll(() {
      app.main();
    });

    testWidgets(
      "CREATE USER AND CANCEL CREATE USER TESTS: ",
      (WidgetTester tester) async {
        finders = Finders();
        createUserTest = CreateUserRobot(tester: tester);

        await createUserTest.createUserTest(
            userWidget: finders.seventhUserWidget,
            name: 'newuser',
            email: 'newuser@mail.ru',
            password: 'password');
        await createUserTest.checkCreateUser(
            userWidget: finders.seventhUserButton, username: 'newuser');
        await createUserTest.cancelCreateUser(
            userWidget: finders.eighthUserWidget);
      },
    );

    testWidgets('SETTINGS TEST: ', (WidgetTester tester) async {
      finders = Finders();
      settingsTest = SettingsPageRobot(tester: tester);

      await settingsTest.tapSettings();
      await settingsTest.tapChangeTheme();
      await settingsTest.goToAuthPage();
    });

    testWidgets('ASAP CHAT TESTS: ', (WidgetTester tester) async {
      finders = Finders();
      asapTest = AsapPageRobot(tester: tester);

      await asapTest.goToAsapPage(userButton: finders.firstUserButton);
      await asapTest.checkChats();
      await asapTest.addMessage(message: 'message');
      await asapTest.goToAuthPage();
    });

    //Удаление юзера не написан
    testWidgets('Delete user', (WidgetTester tester) async {
      finders = Finders();
      deleteUserTest = DeleteUserRobot(tester: tester);
    });
  });
}
