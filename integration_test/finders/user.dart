import 'package:chat_app/ui/auth/authorization_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'finders.dart';

class UserFinder extends TestFinder {
  final Finder userWidget = find.byType(UserCard);

  //кнопкаСоздания
  final Finder createButton = find.byType(ElevatedButton);

  //кнопка отмены
  final Finder cancelCreateButton = find.byType(CloseButton);

  final Finder createUserText = find.text('Create new user');

  //юзер карточка - кнопка для перехода на юзера
  final Finder firstUserButton = find.byKey(const Key('UserButton 0'));
  final Finder thirdUserButton = find.byKey(const Key('UserButton 2'));
  final Finder seventhUserButton = find.byKey(const Key('UserButton 6'));

  //кнопка подтверждения ОК при завержении создания юзера
  final Finder createDialogButton = find.byType(TextButton);

  //виджет создания юзера и его поля ТекстИнпутФилды
  final Finder usernameInputWidget = find.byKey(const Key('createName'));
  final Finder emailInputWidget = find.byKey(const Key('createEmail'));
  final Finder passwordInputWidget = find.byKey(const Key('createPassword'));
  final Finder confirmPasswordInputWidget =
      find.byKey(const Key('createConfirmPassword'));
}
