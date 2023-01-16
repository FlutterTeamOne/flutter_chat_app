import 'package:chat_app/domain/data/dto/user_dto/user_dto.dart';
import 'package:chat_app/modules/signal_service/river/river.dart';
import 'package:chat_app/modules/signal_service/river/user_ref/user_notifier.dart';
import 'package:chat_app/modules/storage_manager/db_helper/user_path.dart';
import 'package:chat_app/ui/auth/authorization_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: AuthPage(),
    );
  }
}

class MockUserNotifier extends Mock implements UserNotifier {}

void main() async {
  await UserPref.init();
  group('AuthPage', () {
    testWidgets('CircularProgressIndicator', (tester) async {
      await tester.pumpWidget(const ProviderScope(child: MyApp()));
      var progress = find.byType(CircularProgressIndicator);
      expect(progress, findsOneWidget);
    });
    testWidgets('Find Text: Create new user', (tester) async {

      await tester.pumpWidget(ProviderScope(
        overrides: [
          River.userPod.overrideWith((ref) {
            return UserNotifier()
              ..setUsers([
                UserDto(
                    name: 'name',
                    email: 'email',
                    createdDate: 'createdDate',
                    profilePicLink: '',
                    updatedDate: 'updatedDate')
              ]);
          })
        ],
        child: const MyApp(),
      ));
      var text = find.text('Create new user');
      expect(text, findsOneWidget);
    });
  });
}
