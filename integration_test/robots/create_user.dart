import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../finders/user.dart';

class CreateUserRobot {
  CreateUserRobot({required this.tester});
  final WidgetTester tester;
  final UserFinder finder = UserFinder();

  Future<void> createUserTest() async {
    await tester.pumpAndSettle(const Duration(seconds: 1));

    //Проверка 1-го по 6-ой виджетов юзеров
    await tester.pumpAndSettle();
    expect(finder.userWidget, findsNWidgets(6));

    //Нажатие на создание юзера
    await tester.pumpAndSettle();
    expect(finder.buttonWidget, findsOneWidget);

    await tester.pumpAndSettle();
    await tester.tap(find.byType(ElevatedButton));

    await tester.pumpAndSettle();
    expect(finder.newUserWidget, findsOneWidget);

    await tester.pumpAndSettle();

    //создаем юзера
    await tester.pumpAndSettle();
    await tester.enterText(finder.usernameInputWidget, 'newuser');
    await tester.pumpAndSettle();
    await tester.enterText(finder.emailInputWidget, 'newuser@mail.ru');
    await tester.pumpAndSettle();
    await tester.enterText(finder.passwordInputWidget, 'password');
    await tester.pumpAndSettle();
    await tester.tap(finder.createUserButton);
    await tester.pumpAndSettle();
    await tester.tap(finder.createUserDialogButton);
    //Проверка 7-го виджета юзера
    await tester.pumpAndSettle();
    expect(finder, findsOneWidget);
    await tester.pumpAndSettle();

    //надо почистить базу для повторного запуска или поменять данные...
    //... юзера и проверки для корректности теста
  }

  Future<void> checkCreateUser() async {
    expect(finder, findsOneWidget);
    await tester.pumpAndSettle(const Duration(seconds: 1));

    await tester.tap(finder.seventhUserButton);
    await tester.pumpAndSettle();

    expect(find.text('newuser'), findsOneWidget);
    await tester.pumpAndSettle();

    //назад к выборы юзеров
    await tester.tap(finder.backFromProfilePageButton);
    await tester.pumpAndSettle();
  }

  Future<void> cancelCreateUser() async {
    //нажатие на кнопку создания юзера
    await tester.pumpAndSettle(const Duration(seconds: 1));

    await tester.tap(find.byType(ElevatedButton));
    await tester.pumpAndSettle();

    expect(finder.newUserWidget, findsOneWidget);

    //нажатие на кнопку cancel
    await tester.pumpAndSettle();
    await tester.tap(finder.cancelCreateButton);

    //проверка N юзера
    await tester.pumpAndSettle();
    expect(finder.seventhUserButton, findsNothing);

    await tester.pumpAndSettle();
  }
}
