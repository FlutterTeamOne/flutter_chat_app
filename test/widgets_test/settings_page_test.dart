import 'package:chat_app/modules/style_manager/riverpod/riverpod_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

main () {
  testWidgets('Settings page buttons test', (widgetTester) async {
    await widgetTester.tap(find.byKey(Key('Big text size button key')));
    await widgetTester.pump();
    expect(changeCustomThemeStateProvider.state);
  });

}