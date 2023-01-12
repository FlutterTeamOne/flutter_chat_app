import 'dart:async';

import 'package:chat_app/main.dart' as app;
import 'package:chat_app/ui/widgets/library/library_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  final Finder firstUserWidget = find.byKey(const Key('UserCard 0'));
  final Finder secondUserWidget = find.byKey(const Key('UserCard 1'));
  final Finder sixthUserWidget = find.byKey(const Key('UserCard 5'));
  final Finder seventhUserWidget = find.byKey(const Key('UserCard 6'));
  final Finder buttonWidget = find.byKey(const Key('1'));
  final Finder newUserWidget = find.byKey(const Key('newUserWidget'));
  final Finder usernameInputWidget = find.byKey(const Key('name'));
  final Finder emailInputWidget = find.byKey(const Key('email'));
  final Finder passwordInputWidget = find.byKey(const Key('password'));
  final Finder createUserButton = find.byKey(const Key('createUserButton'));
  final Finder cancelCreateButton =
      find.byKey(const Key('cancelUserCreateButton'));

  final Finder createUserDialogButton =
      find.byKey(const Key('createUserDialogButton'));

  group('Full test app', () {
    // testWidgets('Enter in account', (tester) async {
    //   //начало
    //   app.main();
    //   await tester.pumpAndSettle(const Duration(seconds: 3));
    //   //тыкаем на первого юзера
    //   expect(firstUserWidget, findsOneWidget);
    //   await tester.pumpAndSettle(const Duration(seconds: 1));
    //   await tester.tap(secondUserWidget);
    //   await tester.pumpAndSettle(const Duration(seconds: 3));
    //   expect(find.text('test1'), 'test1');
    // });

    testWidgets('Create user', (tester) async {
      app.main();
      await tester.pumpAndSettle(const Duration(seconds: 5));

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

      //создаем юзера
      await tester.pumpAndSettle(const Duration(milliseconds: 500));
      await tester.enterText(usernameInputWidget, 'newuser2');
      await tester.pumpAndSettle(const Duration(milliseconds: 500));
      await tester.enterText(emailInputWidget, 'newuser2@mail.ru');
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

      await tester.pumpAndSettle(const Duration(seconds: 5));
      //надо почистить базу для повторного запуска или поменять данные...
      //... юзера и проверки для корректности теста
    });
  });
}
