// import 'package:flutter_test/flutter_test.dart';

// import '../finders.dart';

// class CreateUserRobot {
//   CreateUserRobot({required this.tester});
//   final WidgetTester tester;

//   {
//       //TEST 2: CHECK CREATED USER (7) NAME
//       expect(Finders().seventhUserWidget, findsOneWidget);
//       await tester.pumpAndSettle(const Duration(milliseconds: 500));
//       await tester.tap(Finders().seventhUserButton);
//       await tester.pumpAndSettle(const Duration(milliseconds: 500));
//       expect(find.text('newuser'), findsOneWidget);
//       //назад к выборы юзеров
//       await tester.pumpAndSettle();
//       await tester.tap(Finders().backFromProfilePageButton);
//       await tester.pumpAndSettle();
//       await tester.pumpAndSettle(const Duration(seconds: 1));

//       //TEST 3: CANCEL CREAT USER
//       //нажатие на кнопку создания юзера
//       await tester.pumpAndSettle(const Duration(milliseconds: 500));
//       await tester.tap(find.byType(ElevatedButton));
//       await tester.pumpAndSettle(const Duration(milliseconds: 500));
//       expect(finders.newUserWidget, findsOneWidget);
//       //нажатие на кнопку cancel
//       await tester.pumpAndSettle(const Duration(milliseconds: 500));
//       await tester.tap(finders.cancelCreateButton);
//       //проверка возьмого юзера
//       await tester.pumpAndSettle(const Duration(milliseconds: 500));
//       expect(finders.eighthUserWidget, findsNothing);
//       await tester.pumpAndSettle();
//       await tester.pumpAndSettle(const Duration(seconds: 1));
//   }

//   Future<void> createUser() async {
//     //TEST 1: CREATE USER TEST
//       await tester.pumpAndSettle(const Duration(milliseconds: 100));

//       //Проверка 1-го и 6го виджетов юзеров
//       await tester.pumpAndSettle();
//       expect(finders.firstUserWidget, findsOneWidget);
//       await tester.pumpAndSettle(const Duration(milliseconds: 500));
//       expect(finders.sixthUserWidget, findsOneWidget);

//       //Нажатие на создание юзера
//       await tester.pumpAndSettle(const Duration(milliseconds: 500));
//       expect(finders.buttonWidget, findsOneWidget);
//       await tester.pumpAndSettle(const Duration(milliseconds: 500));
//       await tester.tap(find.byType(ElevatedButton));
//       await tester.pumpAndSettle(const Duration(milliseconds: 500));
//       expect(finders.newUserWidget, findsOneWidget);
//       await tester.pumpAndSettle();

//       //создаем юзера
//       await tester.pumpAndSettle(const Duration(milliseconds: 500));
//       await tester.enterText(finders.usernameInputWidget, 'newuser');
//       await tester.pumpAndSettle(const Duration(milliseconds: 500));
//       await tester.enterText(finders.emailInputWidget, 'newuser@mail.ru');
//       await tester.pumpAndSettle(const Duration(milliseconds: 500));
//       await tester.enterText(finders.passwordInputWidget, 'password');
//       await tester.pumpAndSettle(const Duration(milliseconds: 500));
//       await tester.tap(finders.createUserButton);
//       await tester.pumpAndSettle(const Duration(milliseconds: 500));
//       await tester.tap(finders.createUserDialogButton);
//       await tester.pumpAndSettle(const Duration(milliseconds: 500));
//       //Проверка 7-го виджета юзера
//       await tester.pumpAndSettle();
//       expect(finders.seventhUserWidget, findsOneWidget);
//       await tester.pumpAndSettle();
//       await tester.pumpAndSettle(const Duration(seconds: 1));
//       //надо почистить базу для повторного запуска или поменять данные...
//       //... юзера и проверки для корректности теста
//   }
// }
