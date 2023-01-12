import 'package:chat_app/ui/pages/choose_page/choose_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Отрисовка Center в Choose page', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: ChoosePage()));
    expect(find.byKey(const Key('center in choose_page')), findsOneWidget);
  });
  testWidgets(
    'Отрисовка текста в Choose page',
    (tester) async {
      await tester.pumpWidget(const MaterialApp(home: ChoosePage()));
      expect(find.byKey(const Key('choose_page text')), findsOneWidget);
    },
  );
}
