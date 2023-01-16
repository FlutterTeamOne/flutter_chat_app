import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../finders/asap.dart';
import '../finders/user.dart';

class AsapPageRobot {
  AsapPageRobot({required this.tester});
  final WidgetTester tester;
  final AsapFinder finder = AsapFinder();
  final UserFinder userFinder = UserFinder();

  Future<void> gotoFirstUserAsapPage() async {
    await tester.pumpAndSettle(const Duration(seconds: 1));

    await tester.tap(userFinder.firstUserButton);
    await tester.pumpAndSettle();

    //вводим пароль
    await tester.enterText(find.byType(TextFormField), '123Qw!');
    await tester.pumpAndSettle();

    //login
    await tester.tap(finder.loginButton);
    await tester.pumpAndSettle();

    //нажимаем на чат - asapPage
    await tester.tap(finder.asapPageButton);
    await tester.pumpAndSettle();
  }

  Future<void> checkChats() async {
    await tester.pumpAndSettle(const Duration(seconds: 1));

    //проверяем карточки юзеров у первого три чата
    expect(finder.userCardWidget, findsNWidgets(3));
    await tester.pumpAndSettle();

    expect(finder.firstUserCard, findsOneWidget);
    await tester.pumpAndSettle();
  }

  Future<void> addMessage({required String message}) async {
    await tester.pumpAndSettle(const Duration(seconds: 1));

    //добавляем сообщение в чат с первым юзером
    await tester.tap(finder.firstUserCard);
    await tester.pumpAndSettle();

    await tester.tap(finder.messageInputField);
    await tester.pumpAndSettle();

    await tester.enterText(finder.messageInputField, message);
    await tester.pumpAndSettle();

    await tester.tap(finder.sendMessageButton);
    await tester.pumpAndSettle();
  }

  Future<void> checkMessage({required String message}) async {
    await tester.pumpAndSettle(const Duration(seconds: 1));

    await tester.tap(userFinder.thirdUserButton);
    await tester.pumpAndSettle();

    //вводим пароль
    await tester.enterText(find.byType(TextFormField), '123Qw!');
    await tester.pumpAndSettle();

    //login
    await tester.tap(finder.loginButton);
    await tester.pumpAndSettle();

    //нажимаем на чат - asapPage
    await tester.tap(finder.asapPageButton);
    await tester.pumpAndSettle();

    //проверяем карточки юзеров
    expect(finder.userCardWidget, findsOneWidget);
    await tester.pumpAndSettle();

    expect(finder.firstUserCard, findsOneWidget);
    await tester.pumpAndSettle();

    await tester.tap(finder.firstUserCard);
    await tester.pumpAndSettle();

    expect(find.text(message), findsOneWidget);
    await tester.pumpAndSettle();
  }

  Future<void> goToAuthPage() async {
    await tester.pumpAndSettle(const Duration(seconds: 1));

    await tester.tap(finder.profilePageButton);
    await tester.pumpAndSettle();

    await tester.tap(finder.exitButton);
    await tester.pumpAndSettle(const Duration(seconds: 1));

    await tester.pumpAndSettle();
    expect(userFinder.firstUserButton, findsOneWidget);
    await tester.pumpAndSettle();
  }
}
