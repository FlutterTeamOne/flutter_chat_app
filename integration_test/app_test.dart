import 'package:chat_app/main.dart' as app;
import 'package:chat_app/ui/widgets/library/library_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'finders.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  Finders finders;

  group('Full test app', () {
    setUpAll(() {
      app.main();
    });

    testWidgets('Full test', (tester) async {
      finders = Finders();
      //TEST 1: CREATE USER TEST
      await tester.pumpAndSettle(const Duration(milliseconds: 100));

      //Проверка 1-го и 6го виджетов юзеров
      await tester.pumpAndSettle();
      expect(finders.firstUserWidget, findsOneWidget);
      await tester.pumpAndSettle(const Duration(milliseconds: 500));
      expect(finders.sixthUserWidget, findsOneWidget);

      //Нажатие на создание юзера
      await tester.pumpAndSettle(const Duration(milliseconds: 500));
      expect(finders.buttonWidget, findsOneWidget);
      await tester.pumpAndSettle(const Duration(milliseconds: 500));
      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle(const Duration(milliseconds: 500));
      expect(finders.newUserWidget, findsOneWidget);
      await tester.pumpAndSettle();

      //создаем юзера
      await tester.pumpAndSettle(const Duration(milliseconds: 500));
      await tester.enterText(finders.usernameInputWidget, 'newuser');
      await tester.pumpAndSettle(const Duration(milliseconds: 500));
      await tester.enterText(finders.emailInputWidget, 'newuser@mail.ru');
      await tester.pumpAndSettle(const Duration(milliseconds: 500));
      await tester.enterText(finders.passwordInputWidget, 'password');
      await tester.pumpAndSettle(const Duration(milliseconds: 500));
      await tester.tap(finders.createUserButton);
      await tester.pumpAndSettle(const Duration(milliseconds: 500));
      await tester.tap(finders.createUserDialogButton);
      await tester.pumpAndSettle(const Duration(milliseconds: 500));
      //Проверка 7-го виджета юзера
      await tester.pumpAndSettle();
      expect(finders.seventhUserWidget, findsOneWidget);
      await tester.pumpAndSettle();
      await tester.pumpAndSettle(const Duration(seconds: 1));
      //надо почистить базу для повторного запуска или поменять данные...
      //... юзера и проверки для корректности теста

      //TEST 2: CHECK CREATED USER (7) NAME
      expect(finders.seventhUserWidget, findsOneWidget);
      await tester.pumpAndSettle(const Duration(milliseconds: 500));
      await tester.tap(finders.seventhUserButton);
      await tester.pumpAndSettle(const Duration(milliseconds: 500));
      expect(find.text('newuser'), findsOneWidget);
      //назад к выборы юзеров
      await tester.pumpAndSettle();
      await tester.tap(finders.backFromProfilePageButton);
      await tester.pumpAndSettle();
      await tester.pumpAndSettle(const Duration(seconds: 1));

      //TEST 3: CANCEL CREAT USER
      //нажатие на кнопку создания юзера
      await tester.pumpAndSettle(const Duration(milliseconds: 500));
      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle(const Duration(milliseconds: 500));
      expect(finders.newUserWidget, findsOneWidget);
      //нажатие на кнопку cancel
      await tester.pumpAndSettle(const Duration(milliseconds: 500));
      await tester.tap(finders.cancelCreateButton);
      //проверка возьмого юзера
      await tester.pumpAndSettle(const Duration(milliseconds: 500));
      expect(finders.eighthUserWidget, findsNothing);
      await tester.pumpAndSettle();
      await tester.pumpAndSettle(const Duration(seconds: 1));

      //TEST 4: SETTINGS
      //нажать на первого юзера
      await tester.tap(finders.firstUserButton);
      await tester.pumpAndSettle();
      //нажать на настройки
      await tester.pumpAndSettle(const Duration(milliseconds: 500));
      await tester.tap(finders.settingsPageButton);
      await tester.pumpAndSettle(const Duration(milliseconds: 500));
      //нажать на смену темы
      await tester.tap(finders.changeThemeButton);
      await tester.pumpAndSettle(const Duration(milliseconds: 500));
      expect(finders.roundedBorderButton, findsOneWidget);
      await tester.pumpAndSettle(const Duration(milliseconds: 500));
      //Выход из смены темы
      await tester.tap(finders.backFromSettinsPageButton);
      await tester.pumpAndSettle(const Duration(milliseconds: 500));
      expect(finders.firstUserWidget, findsOneWidget);
      await tester.pumpAndSettle();

      //TEST 5: ASAP PAGE, CHECK CHATS
      await tester.pumpAndSettle(const Duration(milliseconds: 500));
      await tester.tap(finders.firstUserButton);
      await tester.pumpAndSettle();
      //нажимаем на чат - asapPage
      await tester.pumpAndSettle(const Duration(milliseconds: 500));
      await tester.tap(finders.asapPageButton);
      await tester.pumpAndSettle(const Duration(milliseconds: 500));
      //проверяем карточки юзеров у первого три чата
      expect(finders.userCardWidget, findsNWidgets(3));
      await tester.pumpAndSettle(const Duration(milliseconds: 500));
      expect(finders.firstUserCard, findsOneWidget);
      await tester.pumpAndSettle(const Duration(milliseconds: 500));
      //добавляем сообщение в чат с первым юзером
      await tester.tap(finders.firstUserCard);
      await tester.pumpAndSettle(const Duration(microseconds: 500));
      await tester.tap(finders.messageInputField);
      await tester.pumpAndSettle(const Duration(microseconds: 500));
      await tester.enterText(finders.messageInputField, 'HELLO MY DEAR FRIEND');
      await tester.pumpAndSettle(const Duration(microseconds: 500));
      await tester.tap(finders.sendMessageButton);
      await tester.pumpAndSettle(const Duration(seconds: 3));
      // //переходим к юзеру 3 с кем у нас чат
      // await tester.tap(finders.profilePageButton);
      // await tester.pumpAndSettle(const Duration(microseconds: 500));
      // await tester.tap(finders.backFromProfilePageButton);
      // await tester.pumpAndSettle(const Duration(microseconds: 500));
      // await tester.tap(finders.thirdUserButton);
      // //нажимаем на чат - asapPage
      // await tester.pumpAndSettle(const Duration(milliseconds: 500));
      // await tester.tap(finders.asapPageButton);
      // await tester.pumpAndSettle(const Duration(milliseconds: 500));
      // //нажимаем на чат с первым юзером
      // await tester.tap(finders.firstUserCard);
      // await tester.pumpAndSettle(const Duration(milliseconds: 500));
      // expect(find.text('HELLO MY DEAR FRIEND'), findsOneWidget);
      // await tester.pumpAndSettle(const Duration(seconds: 3));

      //назад к странице пользователя
      await tester.tap(finders.profilePageButton);
      await tester.pumpAndSettle(const Duration(milliseconds: 500));

      await tester.pumpAndSettle();
      await tester.pumpAndSettle(const Duration(seconds: 3));
    });
  });
}
