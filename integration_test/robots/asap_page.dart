import 'package:flutter_test/flutter_test.dart';

import '../finders.dart';

class AsapPageRobot {
  AsapPageRobot({required this.tester});
  final WidgetTester tester;

  Future<void> goToAsapPage() async {
    await tester.pumpAndSettle(const Duration(seconds: 1));
    await tester.tap(Finders().firstUserButton);
    //нажимаем на чат - asapPage
    await tester.pumpAndSettle();
    await tester.tap(Finders().asapPageButton);
    await tester.pumpAndSettle();
  }

  Future<void> checkChats() async {
    await tester.pumpAndSettle(const Duration(seconds: 1));
    //проверяем карточки юзеров у первого три чата
    expect(Finders().userCardWidget, findsNWidgets(3));
    await tester.pumpAndSettle();
    expect(Finders().firstUserCard, findsOneWidget);
    await tester.pumpAndSettle();
  }

  Future<void> addMessage({required String message}) async {
    await tester.pumpAndSettle(const Duration(seconds: 1));
    //добавляем сообщение в чат с первым юзером
    await tester.tap(Finders().firstUserCard);
    await tester.pumpAndSettle();
    await tester.tap(Finders().messageInputField);
    await tester.pumpAndSettle();
    await tester.enterText(Finders().messageInputField, message);
    await tester.pumpAndSettle();
    await tester.tap(Finders().sendMessageButton);
    await tester.pumpAndSettle();
  }

  Future<void> goToAuthPage() async {
    await tester.pumpAndSettle(const Duration(seconds: 1));
    await tester.tap(Finders().profilePageButton);
    await tester.pumpAndSettle();
    await tester.tap(Finders().backFromProfilePageButton);
    await tester.pumpAndSettle(const Duration(seconds: 1));
    await tester.pumpAndSettle();
    expect(Finders().firstUserButton, findsOneWidget);
    await tester.pumpAndSettle();
  }
}




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

      // //назад к странице пользователя
      // await tester.pumpAndSettle(const Duration(milliseconds: 500));
      // await tester.tap(finders.profilePageButton);
      // await tester.pumpAndSettle(const Duration(milliseconds: 500));