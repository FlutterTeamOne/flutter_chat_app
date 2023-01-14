import 'package:flutter_test/flutter_test.dart';
import '../finders/asap.dart';
import '../finders/user.dart';

class AsapPageRobot {
  AsapPageRobot({required this.tester});
  final WidgetTester tester;
  final AsapFinder finder = AsapFinder();
  final UserFinder userFinder = UserFinder();

  Future<void> goToAsapPage() async {
    await tester.pumpAndSettle(const Duration(seconds: 1));

    await tester.tap(userFinder.firstUserButton);
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

  Future<void> goToAuthPage() async {
    await tester.pumpAndSettle(const Duration(seconds: 1));

    await tester.tap(finder.profilePageButton);
    await tester.pumpAndSettle();

    await tester.tap(finder.backFromProfilePageButton);
    await tester.pumpAndSettle(const Duration(seconds: 1));

    await tester.pumpAndSettle();
    expect(userFinder.firstUserButton, findsOneWidget);
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