import 'dart:async';

import 'package:chat_app/main.dart' as app;
import 'package:chat_app/ui/pages/library/library_pages.dart';
import 'package:chat_app/ui/widgets/library/library_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:sidebarx/sidebarx.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  //юзеры виджет карточки для проверки наличия юзера
  final Finder firstUserWidget = find.byKey(const Key('UserCard 0'));
  final Finder secondUserWidget = find.byKey(const Key('UserCard 1'));
  final Finder sixthUserWidget = find.byKey(const Key('UserCard 5'));
  final Finder seventhUserWidget = find.byKey(const Key('UserCard 6'));
  final Finder eighthUserWidget = find.byKey(const Key('UserCard 7'));

  //юзер карточка - кнопка для перехода на юзера
  final Finder firstUserButton = find.byKey(const Key('UserButton 1'));
  final Finder seventhUserButton = find.byKey(const Key('UserButton 7'));

  //кнопка создания юзера на главном экране
  final Finder buttonWidget = find.byKey(const Key('createButton'));

  //кнопка назад со страницы пользователя к выбору юзера
  final Finder backFromProfilePageButton =
      find.byKey(const Key('backFromProfilePageButton'));

  //кнопка назад со страницы настроек к выбору юзера
  final Finder backFromSettinsPageButton =
      find.byKey(const Key('exitFromSettings'));

  //виджет создания юзера и его поля ТекстИнпутФилды
  final Finder newUserWidget = find.byKey(const Key('newUserWidget'));
  final Finder usernameInputWidget = find.byKey(const Key('name'));
  final Finder emailInputWidget = find.byKey(const Key('email'));
  final Finder passwordInputWidget = find.byKey(const Key('password'));

  //кнопка настроек - нужно искать по иконке
  final Finder settingsPageButton = find.byIcon(Icons.settings_outlined);

  //кнопка перехода в настройки темы changeTheme
  final Finder changeThemeButton = find.byKey(const Key('changeThemeButton'));

  //кнопка в настройках темы, скругления углов
  final Finder roundedBorderButton =
      find.byKey(const Key('roundedBorderButton'));

  //кнопки на экране заполнения данных нового юзера
  final Finder createUserButton = find.byKey(const Key('createUserButton'));
  final Finder cancelCreateButton =
      find.byKey(const Key('cancelUserCreateButton'));
  //кнопка подтверждения ОК при завержении создания юзера
  final Finder createUserDialogButton =
      find.byKey(const Key('createUserDialogButton'));

  group('Full test app', () {
    setUpAll(() {
      app.main();
    });

    testWidgets('Full test', (tester) async {
      //TEST 1: CREATE USER TEST
      await tester.pumpAndSettle(const Duration(milliseconds: 100));

      //Проверка 1-го и 6го виджетов юзеров
      await tester.pumpAndSettle();
      expect(firstUserWidget, findsOneWidget);
      await tester.pumpAndSettle(const Duration(milliseconds: 500));
      expect(sixthUserWidget, findsOneWidget);

      //Нажатие на создание юзера
      await tester.pumpAndSettle(const Duration(milliseconds: 500));
      expect(buttonWidget, findsOneWidget);
      await tester.pumpAndSettle(const Duration(milliseconds: 500));
      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle(const Duration(milliseconds: 500));
      expect(newUserWidget, findsOneWidget);
      await tester.pumpAndSettle();

      //создаем юзера
      await tester.pumpAndSettle(const Duration(milliseconds: 500));
      await tester.enterText(usernameInputWidget, 'newuser');
      await tester.pumpAndSettle(const Duration(milliseconds: 500));
      await tester.enterText(emailInputWidget, 'newuser@mail.ru');
      await tester.pumpAndSettle(const Duration(milliseconds: 500));
      await tester.enterText(passwordInputWidget, 'password');
      await tester.pumpAndSettle(const Duration(milliseconds: 500));
      await tester.tap(createUserButton);
      await tester.pumpAndSettle(const Duration(milliseconds: 500));
      await tester.tap(createUserDialogButton);
      await tester.pumpAndSettle(const Duration(milliseconds: 500));
      //Проверка 7-го виджета юзера
      await tester.pumpAndSettle();
      expect(seventhUserWidget, findsOneWidget);
      await tester.pumpAndSettle();
      await tester.pumpAndSettle(const Duration(seconds: 1));
      //надо почистить базу для повторного запуска или поменять данные...
      //... юзера и проверки для корректности теста

      //TEST 2: CHECK CREATED USER (7) NAME
      expect(seventhUserWidget, findsOneWidget);
      await tester.pumpAndSettle(const Duration(milliseconds: 500));
      await tester.tap(seventhUserButton);
      await tester.pumpAndSettle(const Duration(milliseconds: 500));
      expect(find.text('newuser'), findsOneWidget);
      //назад к выборы юзеров
      await tester.pumpAndSettle();
      await tester.tap(backFromProfilePageButton);
      await tester.pumpAndSettle();
      await tester.pumpAndSettle(const Duration(seconds: 1));

      //TEST 3: CANCEL CREAT USER
      //нажатие на кнопку создания юзера
      await tester.pumpAndSettle(const Duration(milliseconds: 500));
      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle(const Duration(milliseconds: 500));
      expect(newUserWidget, findsOneWidget);
      //нажатие на кнопку cancel
      await tester.pumpAndSettle(const Duration(milliseconds: 500));
      await tester.tap(cancelCreateButton);
      //проверка возьмого юзера
      await tester.pumpAndSettle(const Duration(milliseconds: 500));
      expect(eighthUserWidget, findsNothing);
      await tester.pumpAndSettle();
      await tester.pumpAndSettle(const Duration(seconds: 1));

      //TEST 4: GO TO SETTINGS
      //нажать на первого юзера
      await tester.tap(firstUserButton);
      await tester.pumpAndSettle();
      //нажать на настройки
      await tester.pumpAndSettle(const Duration(milliseconds: 500));
      await tester.tap(settingsPageButton);
      await tester.pumpAndSettle(const Duration(milliseconds: 500));
      //нажать на смену темы
      await tester.tap(changeThemeButton);
      await tester.pumpAndSettle(const Duration(milliseconds: 500));
      expect(roundedBorderButton, findsOneWidget);
      await tester.pumpAndSettle(const Duration(milliseconds: 500));
      //Выход из смены темы
      await tester.tap(backFromSettinsPageButton);
      await tester.pumpAndSettle(const Duration(milliseconds: 500));
      expect(firstUserWidget, findsOneWidget);

      await tester.pumpAndSettle();
      await tester.pumpAndSettle(const Duration(seconds: 3));
    });
  });
}
