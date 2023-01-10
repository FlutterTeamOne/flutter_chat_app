import 'package:chat_app/ui/pages/library/library_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Отрисовка Center в Videos page', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: VideosPage()));
    expect(find.byKey(const Key('center in videos_page')), findsOneWidget);
  });
  testWidgets(
    'Отрисовка текста в Videos page',
    (tester) async {
      await tester.pumpWidget(const MaterialApp(home: VideosPage()));
      expect(find.byKey(const Key('videos_page text')), findsOneWidget);
    },
  );
}
