import 'package:chat_app/domain/data/dto/user_dto/user_dto.dart';
import 'package:chat_app/modules/signal_service/river/river.dart';
import 'package:chat_app/modules/signal_service/river/user_ref/user_notifier.dart';
import 'package:chat_app/modules/storage_manager/db_helper/user_path.dart';
import 'package:chat_app/ui/pages/profile_page/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(body: ProfilePage()));
  }
}

void main() async {
  setUpAll(() async {
    await UserPref.init();
  });
  group("Отрисовка виджетов на ProfilePage", () {
    testWidgets('Отрисовка Consumer', (tester) async {
      await tester.pumpWidget(ProviderScope(child: MyApp()));
      expect(find.byType(Consumer), findsOneWidget);
    });

    testWidgets('Нет данных', (tester) async {
      await tester.pumpWidget(ProviderScope(child: MyApp()));
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      expect(find.byType(Text), findsNothing);
    });

    testWidgets('Все ок', (tester) async {
      
      await tester.pumpWidget(ProviderScope(child: MyApp(), overrides: [
        River.userPod.overrideWith((ref) {
          return UserNotifier()
            ..setUsers([
              UserDto(
                  name: 'name',
                  email: '',
                  createdDate: '',
                  profilePicLink: '',
                  updatedDate: '')
            ]);
        })
      ]));
      await tester.pump(Duration(seconds: 1));
      expect(find.byType(CircularProgressIndicator), findsNothing);
    });
  });
}
