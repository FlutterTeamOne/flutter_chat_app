import 'package:chat_app/ui/pages/library/library_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: BlackBoxPage());
  }
}

void main() {
  group("Отрисовка виджетов на BlackBoxPage", () {
    testWidgets('Отрисовка Текста на странице BlackBoxPage', (tester) async {
      await tester.pumpWidget(MyApp());
      expect(find.text('Black box'), findsOneWidget);
    });
  });
}
