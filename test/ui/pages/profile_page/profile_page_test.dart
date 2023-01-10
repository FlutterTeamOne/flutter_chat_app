import 'package:chat_app/domain/data/dto/user_dto/user_dto.dart';
import 'package:chat_app/main.dart';
import 'package:chat_app/modules/signal_service/river/river.dart';
import 'package:chat_app/modules/signal_service/river/user_ref/user_state_ref.dart';
import 'package:chat_app/ui/pages/profile_page/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Consumer(
      builder: (context, ref, _) => ref.read(userPod).users?[0].name != null
          ? const ProfileLayout(key: Key('ProfileLayout'))
          : const Center(
              child: CircularProgressIndicator(key: Key('CircularProfilePage')),
            ),
    ));
  }
}

final userPod = StateProvider<UserStateRef>((ref) => UserStateRef(users: [
      UserDto(
          name: 'TestName',
          email: '',
          createdDate: '',
          profilePicLink: '',
          updatedDate: '')
    ], userDb: false, isDeleted: null));

main() {
  group('test profile_page', () {
    testWidgets('Если нет базы юзеров', (tester) async {
      // final userPod = StateProvider<UserStateRef>(
      //     (ref) => UserStateRef(users: null, userDb: null, isDeleted: null));
      await tester.pumpWidget(ProviderScope(child: MyApp()));
      expect(find.byKey(ValueKey('ProfileLayout')), findsNothing);
      expect(find.byKey(ValueKey('CircularProfilePage')), findsOneWidget);
    });

    testWidgets('Если есть юзер, то отрисовать профиль', (tester) async {
      var user = UserDto(
          name: 'TestName',
          email: '',
          createdDate: '',
          profilePicLink: '',
          updatedDate: '');
      final userPod = StateProvider<UserStateRef>(
          (ref) => UserStateRef(users: [user], userDb: false, isDeleted: null));
      await tester.pumpWidget(ProviderScope(child: MyApp()));
      expect(find.byKey(ValueKey('CircularProfilePage')), findsNothing);
    });
  });
}
