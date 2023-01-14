import 'package:chat_app/ui/auth/authorization_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'finders.dart';

class UserFinder extends TestFinder {
  final Finder userWidget = find.byType(UserCard);

  //кнопкаСоздания
  final Finder createButton = find.byType(ElevatedButton);

  //Кнопка удаления юзера
  final Finder deleteUserButton = find.byKey(const Key('deleteUserButton'));

  //Кнопка редактирования пароля
  final Finder changePassword = find.byKey(const Key('changePassword'));

  //edit created user
  final Finder editCreatedName = find.byKey(const Key('edit newuser'));
  final Finder editCreatedEmail = find.byKey(const Key('edit newuser@mail.ru'));

  //кнопка отмены
  final Finder cancelCreateButton = find.byType(CloseButton);

  //exit error
  final Finder okExitErrorButton = find.byKey(const Key('OkExitErrorButton'));

  final Finder createUserText = find.text('Create new user');

  //passwords field
  final Finder oldPasswordField = find.byKey(const Key('passwordField 0'));
  final Finder newPasswordField = find.byKey(const Key('passwordField 1'));
  final Finder newConfirmPasswordField =
      find.byKey(const Key('passwordField 2'));

  //юзер карточка - кнопка для перехода на юзера
  final Finder firstUserButton = find.byKey(const Key('UserButton 0'));
  final Finder thirdUserButton = find.byKey(const Key('UserButton 2'));
  final Finder seventhUserButton = find.byKey(const Key('UserButton 6'));

  //виджет создания юзера и его поля ТекстИнпутФилды
  final Finder usernameInputWidget = find.byKey(const Key('createName'));
  final Finder emailInputWidget = find.byKey(const Key('createEmail'));
  final Finder passwordInputWidget = find.byKey(const Key('createPassword'));
  final Finder confirmPasswordInputWidget =
      find.byKey(const Key('createConfirmPassword'));
}
