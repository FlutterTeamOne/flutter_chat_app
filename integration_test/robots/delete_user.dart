import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../finders/user.dart';

class DeleteUserRobot {
  DeleteUserRobot({required this.tester});
  final WidgetTester tester;
  final UserFinder finder = UserFinder();

  Future<void> deleteCreatedUser() async {
    await tester.pumpAndSettle(const Duration(seconds: 1));

    await tester.tap(finder.seventhUserButton);
    await tester.pumpAndSettle();

    //вводим пароль
    await tester.enterText(find.byType(TextFormField), 'Password!1');
    await tester.pumpAndSettle();

    //login
    await tester.tap(finder.loginButton);
    await tester.pumpAndSettle();

    await tester.tap(finder.deleteUserButton);
    await tester.pumpAndSettle();

    await tester.tap(finder.dialogButton);
    await tester.pumpAndSettle();
  }
}
