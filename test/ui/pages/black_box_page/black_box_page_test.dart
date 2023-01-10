import 'package:chat_app/ui/pages/black_box_page/black_box_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Отрисовка Center в Black Box page', (tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: BlackBoxPage(),
    ));
    expect(
        find.byKey(const ValueKey('center in black_box_page')), findsOneWidget);
  });
  testWidgets(
    'Отрисока текста в Black Box page',
    (tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: BlackBoxPage(),
      ));
      expect(find.byKey(const Key('black_box_page text')), findsOneWidget);
    },
  );
}
