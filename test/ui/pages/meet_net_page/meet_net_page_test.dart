import 'package:chat_app/ui/pages/library/library_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Отрисовка Center в Meet Net page', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: MeetNetPage()));
    expect(find.byKey(const Key('center in meet_net_page')), findsOneWidget);
  });
  testWidgets(
    'Отрисовка текста в Meet Net page',
    (tester) async {
      await tester.pumpWidget(const MaterialApp(home: MeetNetPage()));
      expect(find.byKey(const Key('meet_net_page text')), findsOneWidget);
    },
  );
}
