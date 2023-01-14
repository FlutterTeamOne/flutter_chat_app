import 'package:flutter_test/flutter_test.dart';

import '../finders/asap.dart';
import '../finders/user.dart';

class DeleteUserRobot {
  DeleteUserRobot({required this.tester});
  final WidgetTester tester;
  final UserFinder userFinder = UserFinder();
  final AsapFinder asapFinder = AsapFinder();

  Future<void> goToProfilePage() async {
    await tester.pumpAndSettle(const Duration(milliseconds: 500));
  }

  Future<void> delete() async {
    await tester.pumpAndSettle(const Duration(milliseconds: 500));
  }

  Future<void> goToAuthPage() async {
    await tester.pumpAndSettle(const Duration(milliseconds: 500));

    await tester.tap(asapFinder.backFromProfilePageButton);
    await tester.pumpAndSettle(const Duration(milliseconds: 500));

    await tester.pumpAndSettle();
    //expect(asapFinder.firstUserWidget, findsOneWidget);

    await tester.pumpAndSettle(const Duration(milliseconds: 500));
  }
}
