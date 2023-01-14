import 'package:chat_app/ui/widgets/library/library_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'finders.dart';

class UserFinder extends TestFinder {
  final Finder userWidget = find.byType(UserCardWidget);
  //final Finder createUserButton = find.byType(ElevatedButton);

  //юзер карточка - кнопка для перехода на юзера
  final Finder firstUserButton = find.byKey(const Key('UserButton 0'));
  final Finder thirdUserButton = find.byKey(const Key('UserButton 2'));
  final Finder seventhUserButton = find.byKey(const Key('UserButton 6'));

  //кнопка создания юзера на главном экране
  final Finder buttonWidget = find.byKey(const Key('createButton'));

  //кнопки на экране заполнения данных нового юзера
  final Finder createUserButton = find.byKey(const Key('createUserButton'));
  final Finder cancelCreateButton =
      find.byKey(const Key('cancelUserCreateButton'));

  //кнопка подтверждения ОК при завержении создания юзера
  final Finder createUserDialogButton =
      find.byKey(const Key('createUserDialogButton'));

  //виджет создания юзера и его поля ТекстИнпутФилды
  final Finder newUserWidget = find.byKey(const Key('newUserWidget'));
  final Finder usernameInputWidget = find.byKey(const Key('name'));
  final Finder emailInputWidget = find.byKey(const Key('email'));
  final Finder passwordInputWidget = find.byKey(const Key('password'));
  final Finder confirmPasswordInputWidget =
      find.byKey(const Key('confirmPassword'));
}
