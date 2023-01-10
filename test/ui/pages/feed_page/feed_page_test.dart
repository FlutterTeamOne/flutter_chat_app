import 'package:chat_app/ui/pages/feed_page/feed_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Отрисовка текста в Feed page', (tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: FeedPage(),
    ));
    expect(find.byKey(const Key('feed_page text')), findsOneWidget);
  });
}
