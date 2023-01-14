import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../finders/user.dart';

class CreateUserRobot {
  CreateUserRobot({required this.tester});
  final WidgetTester tester;
  final UserFinder finder = UserFinder();

  Future<void> checkUsers() async {
    await tester.pumpAndSettle(const Duration(seconds: 1));

    //Проверка 1-го по 6-ой виджетов юзеров
    expect(finder.userWidget, findsNWidgets(6));

    await tester.pumpAndSettle();
  }

  Future<void> createUser() async {
    await tester.pumpAndSettle(const Duration(seconds: 1));

    //Нажатие на создание юзера
    await tester.pumpAndSettle();
    await tester.tap(find.byType(ElevatedButton));

    await tester.pumpAndSettle();
    expect(finder.createUserText, findsOneWidget);

    //пытаемся создать юзера с пустыми
    await tester.pumpAndSettle();
    await tester.tap(finder.createButton);

    await tester.pumpAndSettle();
    expect(
        find.text('Name must contain at least 3 characters'), findsOneWidget);

    //создаем юзера
    await tester.pumpAndSettle();
    await tester.enterText(finder.usernameInputWidget, 'newuser');

    await tester.pumpAndSettle();
    await tester.enterText(finder.emailInputWidget, 'newuser@mail.ru');

    await tester.pumpAndSettle();
    await tester.enterText(finder.passwordInputWidget, 'Password!0');

    await tester.pumpAndSettle();
    await tester.enterText(finder.confirmPasswordInputWidget, 'Password!0');

    await tester.pumpAndSettle();
    await tester.tap(finder.createButton);

    await tester.pumpAndSettle();
    await tester.tap(finder.createDialogButton);

    //Проверка 7-го виджета юзера
    await tester.pumpAndSettle();
    expect(finder.userWidget, findsNWidgets(7));

    await tester.pumpAndSettle();

    //надо почистить базу для повторного запуска или поменять данные...
    //... юзера и проверки для корректности теста
  }

  Future<void> checkCreateUser() async {
    await tester.pumpAndSettle(const Duration(seconds: 1));
    expect(finder.userWidget, findsNWidgets(7));
    await tester.pumpAndSettle();

    await tester.tap(finder.seventhUserButton);
    await tester.pumpAndSettle();

    expect(find.text('newuser'), findsOneWidget);
    await tester.pumpAndSettle();

    //назад к выборы юзеров
    await tester.tap(finder.exitButton);
    await tester.pumpAndSettle();
  }

  Future<void> cancelCreateUser() async {
    //нажатие на кнопку создания юзера
    await tester.pumpAndSettle(const Duration(seconds: 1));

    await tester.tap(finder.createButton);
    await tester.pumpAndSettle();

    //нажатие на кнопку cancel
    await tester.tap(finder.cancelCreateButton);
    await tester.pumpAndSettle();

    //проверка N юзера
    expect(finder.userWidget, findsNWidgets(6));

    await tester.pumpAndSettle();
  }
}
