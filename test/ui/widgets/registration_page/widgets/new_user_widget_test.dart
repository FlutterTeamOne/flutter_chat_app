import 'package:chat_app/ui/widgets/registration_page/widgets/new_user_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: NewUserWidget());
  }
}

void main() {
  group("Тесты для поля ввода Имени пользователя", () {
    setUpAll(() async {});
    testWidgets('Отрисовка buildNameRow', (tester) async {});
  });
}
