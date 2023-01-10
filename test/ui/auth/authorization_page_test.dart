import 'package:chat_app/domain/data/dto/user_dto/user_dto.dart';
import 'package:chat_app/modules/signal_service/river/river.dart';
import 'package:chat_app/modules/signal_service/river/user_ref/user_notifier.dart';
import 'package:chat_app/modules/signal_service/river/user_ref/user_state_ref.dart';
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
    testWidgets('Column', (tester) async {
      final mockUserPod = MockUserNotifier();
      // mockUserPod.readUser().then((value) => UserStateRef(users: [
      //       UserDto(
      //           name: 'name',
      //           email: 'email',
      //           createdDate: 'createdDate',
      //           profilePicLink: 'profilePicLink',
      //           updatedDate: 'updatedDate')
      //     ]));
      await tester.pumpWidget(ProviderScope(
        overrides: [
          River.futureUserPod.overrideWith((ref) => ref.watch(River.userPod)),
          River.userPod.overrideWith((ref) {
            // UserNotifier().readUser();
            // ref.container.debugChildren;
            return MockUserNotifier()
              ..readUser()
                  .then((value) => UserStateRef(users: [
                        UserDto(
                            name: 'name',
                            email: 'email',
                            createdDate: 'createdDate',
                            profilePicLink: 'profilePicLink',
                            updatedDate: 'updatedDate')
                      ]))
                  .onError((error, stackTrace) => UserStateRef(users: [
                        UserDto(
                            name: 'name',
                            email: 'email',
                            createdDate: 'createdDate',
                            profilePicLink: 'profilePicLink',
                            updatedDate: 'updatedDate')
                      ]));
          })
        ],
        child: const MyApp(),
      ));
      var progress = find.byType(Column);
      await tester.pump();
      expect(progress, findsOneWidget);
    });
  });
}
