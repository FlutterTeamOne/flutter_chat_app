import 'package:chat_app/ui/pages/find_friend_page/find_friend_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Отрисовка Center в Find friend page', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: FindFriendsPage()));
    expect(find.byKey(const Key('center in find_friend_page')), findsOneWidget);
  });
  testWidgets(
    'Отрисовка текста в Find friend page',
    (tester) async {
      await tester.pumpWidget(const MaterialApp(home: FindFriendsPage()));
      expect(find.byKey(const Key('find_friend_page text')), findsOneWidget);
    },
  );
}
