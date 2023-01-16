import 'package:chat_app/ui/pages/library/library_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: BlackBoxPage());
  }
}

void main() {
  group("Отрисовка виджетов на BlackBoxPage", () {
    testWidgets('Отрисовка Текста на странице BlackBoxPage', (tester) async {
      await tester.pumpWidget(const MyApp());
      expect(find.text('Black box'), findsOneWidget);
    });
  });
}
