import 'package:flutter_test/flutter_test.dart';

import '../finders.dart';

class DeleteUserRobot {
  DeleteUserRobot({required this.tester});
  final WidgetTester tester;

  Future<void> goToProfilePage() async {
    await tester.pumpAndSettle(const Duration(milliseconds: 500));
  }

  Future<void> delete() async {
    await tester.pumpAndSettle(const Duration(milliseconds: 500));
  }

  Future<void> goToAuthPage() async {
    await tester.pumpAndSettle(const Duration(milliseconds: 500));
    await tester.tap(Finders().backFromProfilePageButton);
    await tester.pumpAndSettle(const Duration(milliseconds: 500));
    await tester.pumpAndSettle();
    expect(Finders().firstUserWidget, findsOneWidget);
    await tester.pumpAndSettle(const Duration(milliseconds: 500));
  }
}
