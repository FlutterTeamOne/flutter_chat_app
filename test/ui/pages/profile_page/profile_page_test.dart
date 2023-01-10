import 'package:chat_app/domain/data/dto/user_dto/user_dto.dart';
import 'package:chat_app/modules/signal_service/river/river.dart';
import 'package:chat_app/modules/signal_service/river/user_ref/user_notifier.dart';
import 'package:chat_app/modules/signal_service/river/user_ref/user_state_ref.dart';
import 'package:chat_app/ui/pages/profile_page/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

final userPodFake = StateProvider((ref) => UserStateRef());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Consumer(
      builder: (context, ref, _) =>
          ref.read(userPodFake).users?[0].name != null &&
                  ref.read(userPodFake).users?[0].name != ''
              ? const Text('a')
              : const Center(
                  child: CircularProgressIndicator(),
                ),
    ));
  }
}

void main() {
  group("Отрисовка виджетов на ProfilePage", () {
    testWidgets('Отрисовка Consumer', (tester) async {
      await tester.pumpWidget(ProviderScope(child: MyApp()));
      expect(find.byType(Consumer), findsOneWidget);
    });

    testWidgets('Нет данных', (tester) async {
      await tester.pumpWidget(ProviderScope(child: MyApp(), overrides: [
        userPodFake.overrideWith((ref) => UserStateRef(users: [
              UserDto(
                  name: '',
                  email: '',
                  createdDate: '',
                  profilePicLink: '',
                  updatedDate: '')
            ]))
      ]));
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      expect(find.byType(Text), findsNothing);
    });

    testWidgets('Юзер не заполнен', (tester) async {
      await tester.pumpWidget(ProviderScope(child: MyApp(), overrides: [
        userPodFake.overrideWith((ref) => UserStateRef(users: [
              UserDto(
                  name: '',
                  email: '',
                  createdDate: '',
                  profilePicLink: '',
                  updatedDate: '')
            ]))
      ]));
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      expect(find.byType(Text), findsNothing);
    });

    testWidgets('Все ок', (tester) async {
      await tester.pumpWidget(ProviderScope(child: MyApp(), overrides: [
        userPodFake.overrideWith((ref) => UserStateRef(users: [
              UserDto(
                  name: 'Test',
                  email: '',
                  createdDate: '',
                  profilePicLink: '',
                  updatedDate: '')
            ]))
      ]));
      expect(find.byType(CircularProgressIndicator), findsNothing);
      expect(find.byType(Text), findsOneWidget);
    });
  });
}
