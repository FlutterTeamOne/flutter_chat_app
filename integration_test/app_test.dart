import 'package:chat_app/main.dart' as app;
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  final Finder _firstUserWidget = find.byKey(const Key('UserButton 0'));
  final Finder _secondUserWidget = find.byKey(const Key('UserButton 1'));
  final Finder _buttonWidget = find.byKey(const Key('1'));
  final Finder _newUserWidget = find.byKey(const Key('newUserWidget'));

  group('Full test app', () {
    testWidgets('Enter in account', (tester) async {
      //начало
      app.main();
      await tester.pumpAndSettle(const Duration(seconds: 3));
      //тыкаем на первого юзера
      expect(_firstUserWidget, findsOneWidget);
      await tester.pumpAndSettle(const Duration(seconds: 1));
      await tester.tap(_secondUserWidget);
      await tester.pumpAndSettle(const Duration(seconds: 3));
      expect(find.text('test1'), 'test1');
    });

    testWidgets('Tap create user', (tester) async {
      app.main();
      await tester.pumpAndSettle(const Duration(seconds: 1));
      expect(_buttonWidget, findsOneWidget);
      await tester.pumpAndSettle(const Duration(seconds: 3));
      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle(const Duration(seconds: 3));
      expect(_newUserWidget, findsOneWidget);
    });
  });
}
