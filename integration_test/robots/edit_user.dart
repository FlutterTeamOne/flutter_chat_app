import 'package:flutter_test/flutter_test.dart';

import '../finders/user.dart';

class EditUserRobot {
  EditUserRobot({required this.tester});
  final WidgetTester tester;
  final UserFinder finder = UserFinder();

  Future<void> editCreatedUser() async {
    await tester.pumpAndSettle(const Duration(seconds: 1));

    //переходим на 7-го созданного юзера
    await tester.tap(finder.seventhUserButton);
    await tester.pumpAndSettle();

    //edit name
    await tester.tap(finder.editCreatedName);
    await tester.pumpAndSettle();

    await tester.tap(finder.okExitErrorButton);
    await tester.pumpAndSettle();

    expect(find.text('Enter new name'), findsOneWidget);
    await tester.pumpAndSettle();

    await tester.tap(finder.dialogButton);
    await tester.pumpAndSettle();

    await tester.enterText(finder.textFormField, '');
    await tester.pumpAndSettle();

    await tester.tap(finder.okExitErrorButton);
    await tester.pumpAndSettle();

    expect(find.text('Enter data'), findsOneWidget);
    await tester.pumpAndSettle();

    await tester.tap(finder.dialogButton);
    await tester.pumpAndSettle();

    await tester.enterText(finder.textFormField, 'usernew');
    await tester.pumpAndSettle();

    await tester.tap(finder.okExitErrorButton);
    await tester.pumpAndSettle();

    //edit email
    await tester.tap(finder.editCreatedEmail);
    await tester.pumpAndSettle();

    await tester.tap(finder.okExitErrorButton);
    await tester.pumpAndSettle();

    expect(find.text('Error'), findsOneWidget);
    await tester.pumpAndSettle();

    await tester.tap(finder.dialogButton);
    await tester.pumpAndSettle();

    await tester.enterText(finder.textFormField, '');
    await tester.pumpAndSettle();

    await tester.tap(finder.okExitErrorButton);
    await tester.pumpAndSettle();

    expect(find.text('Enter data'), findsOneWidget);
    await tester.pumpAndSettle();

    await tester.tap(finder.dialogButton);
    await tester.pumpAndSettle();

    await tester.enterText(finder.textFormField, 'usernew@mail.ru');
    await tester.pumpAndSettle();

    await tester.tap(finder.okExitErrorButton);
    await tester.pumpAndSettle();

    //change password
    await tester.tap(finder.changePassword);
    await tester.pumpAndSettle();

    await tester.tap(finder.createButton);
    await tester.pumpAndSettle();

    expect(find.text('Password must contain at least 6 characters'),
        findsNWidgets(2));
    await tester.pumpAndSettle();

    await tester.enterText(finder.oldPasswordField, 'Password!0');
    await tester.pumpAndSettle();
    await tester.enterText(finder.newPasswordField, 'Password!1');
    await tester.pumpAndSettle();
    await tester.enterText(finder.newConfirmPasswordField, 'Password!1');
    await tester.pumpAndSettle();

    await tester.tap(finder.createButton);
    await tester.pumpAndSettle();

    expect(find.text('Пароль успешно изменен'), findsOneWidget);
    await tester.pumpAndSettle();

    await tester.tap(finder.dialogButton);
    await tester.pumpAndSettle();

    //назад к выборы юзеров
    await tester.tap(finder.exitButton);
    await tester.pumpAndSettle();
  }
}
