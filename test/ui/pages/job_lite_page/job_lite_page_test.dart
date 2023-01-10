import 'package:chat_app/ui/pages/job_lite_page/job_lite_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Отрисовка Center в Job Lite Page', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: JobLitePage()));
    expect(find.byKey(const Key('center in job_lite_page')), findsOneWidget);
  });
  testWidgets(
    'Отрисовка текста в Job Lite Page',
    (tester) async {
      await tester.pumpWidget(const MaterialApp(home: JobLitePage()));
      expect(find.byKey(const Key('job_lite_page text')), findsOneWidget);
    },
  );
}
