import 'package:chat_app/main.dart' as app;
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'robots/asap_page.dart';
import 'robots/create_user.dart';
import 'robots/delete_user.dart';
import 'robots/settings.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  CreateUserRobot createUserTest;
  SettingsPageRobot settingsTest;
  AsapPageRobot asapTest;
  DeleteUserRobot deleteUserTest;

  group('Integration tests', () {
    setUpAll(() {
      app.main();
    });

    testWidgets(
      "all in one test",
      (WidgetTester tester) async {
        createUserTest = CreateUserRobot(tester: tester);
        settingsTest = SettingsPageRobot(tester: tester);
        asapTest = AsapPageRobot(tester: tester);
        deleteUserTest = DeleteUserRobot(tester: tester);

        await tester.pumpAndSettle();

        //ТЕСТ 1
        //СОЗДАНИЕ ЮЗЕРА, ПРОВЕРКА СОЗДАНИЯ, ОТМЕНА СОЗДАНИЯ ЮЗЕРА
        await createUserTest.checkUsers();
        await createUserTest.cancelCreateUser();
        await createUserTest.createUser();
        await createUserTest.checkCreateUser();
        // TODO: удаление юзера

        // //ТЕСТ 2
        // // ПЕРЕХОД В НАСТРОЙКИ, НАЖИМАЕМ НА КНОПКУ СМЕНЫ ТЕМЫ, ПРОВЕРКА
        // await settingsTest.tapSettings();
        // await settingsTest.tapChangeTheme();
        // await settingsTest.goToAuthPage();

        // //ТЕСТ 3
        // //ПЕРЕХОДИМ В ЧАТЫ, ПРОВЕРЯЕМ ЧАТЫ ЮЗЕРА, ОТПРАВЛЯЕМ СООБЩЕНИЕ
        // await asapTest.goToAsapPage();
        // await asapTest.checkChats();
        // await asapTest.addMessage(message: 'message');
        // await asapTest.goToAuthPage();

        await tester.pumpAndSettle();
        await tester.pumpAndSettle(const Duration(seconds: 5));
      },
    );
  });
}
