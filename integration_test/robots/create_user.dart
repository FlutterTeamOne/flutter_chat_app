import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../finders.dart';

class CreateUserRobot {
  CreateUserRobot({required this.tester});
  final WidgetTester tester;

  Future<void> createUserTest(
      {required Finder userWidget,
      required String name,
      required String email,
      required String password}) async {
    sleep(const Duration(seconds: 5));
    await tester.pumpAndSettle(const Duration(milliseconds: 100));

    //Проверка 1-го и 6го виджетов юзеров
    await tester.pumpAndSettle();
    expect(Finders().firstUserWidget, findsOneWidget);
    await tester.pumpAndSettle(const Duration(milliseconds: 500));
    expect(Finders().sixthUserWidget, findsOneWidget);

    //Нажатие на создание юзера
    await tester.pumpAndSettle(const Duration(milliseconds: 500));
    expect(Finders().buttonWidget, findsOneWidget);
    await tester.pumpAndSettle(const Duration(milliseconds: 500));
    await tester.tap(find.byType(ElevatedButton));
    await tester.pumpAndSettle(const Duration(milliseconds: 500));
    expect(Finders().newUserWidget, findsOneWidget);
    await tester.pumpAndSettle();

    //создаем юзера
    await tester.pumpAndSettle(const Duration(milliseconds: 500));
    await tester.enterText(Finders().usernameInputWidget, name);
    await tester.pumpAndSettle(const Duration(milliseconds: 500));
    await tester.enterText(Finders().emailInputWidget, 'newuser@mail.ru');
    await tester.pumpAndSettle(const Duration(milliseconds: 500));
    await tester.enterText(Finders().passwordInputWidget, 'password');
    await tester.pumpAndSettle(const Duration(milliseconds: 500));
    await tester.tap(Finders().createUserButton);
    await tester.pumpAndSettle(const Duration(milliseconds: 500));
    await tester.tap(Finders().createUserDialogButton);
    await tester.pumpAndSettle(const Duration(milliseconds: 500));
    //Проверка 7-го виджета юзера
    await tester.pumpAndSettle();
    expect(userWidget, findsOneWidget);
    await tester.pumpAndSettle();
    await tester.pumpAndSettle(const Duration(seconds: 1));
    //надо почистить базу для повторного запуска или поменять данные...
    //... юзера и проверки для корректности теста
  }

  Future<void> checkCreateUser(
      {required Finder userWidget, required String username}) async {
    expect(userWidget, findsOneWidget);
    await tester.pumpAndSettle(const Duration(milliseconds: 500));
    await tester.tap(Finders().seventhUserButton);
    await tester.pumpAndSettle(const Duration(milliseconds: 500));
    expect(find.text(username), findsOneWidget);
    //назад к выборы юзеров
    await tester.pumpAndSettle();
    await tester.tap(Finders().backFromProfilePageButton);
    await tester.pumpAndSettle(const Duration(seconds: 1));
  }

  Future<void> cancelCreateUser({required Finder userWidget}) async {
    //нажатие на кнопку создания юзера
    await tester.pumpAndSettle(const Duration(milliseconds: 500));
    await tester.tap(find.byType(ElevatedButton));
    await tester.pumpAndSettle(const Duration(milliseconds: 500));
    expect(Finders().newUserWidget, findsOneWidget);
    //нажатие на кнопку cancel
    await tester.pumpAndSettle(const Duration(milliseconds: 500));
    await tester.tap(Finders().cancelCreateButton);
    //проверка N юзера
    await tester.pumpAndSettle(const Duration(milliseconds: 500));
    expect(userWidget, findsNothing);
    await tester.pumpAndSettle(const Duration(seconds: 1));
  }
}
