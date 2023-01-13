import 'package:chat_app/ui/widgets/library/library_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class Finders {
  //юзеры виджет карточки для проверки наличия юзера
  final Finder firstUserWidget = find.byKey(const Key('UserCard 0'));
  final Finder secondUserWidget = find.byKey(const Key('UserCard 1'));
  final Finder sixthUserWidget = find.byKey(const Key('UserCard 5'));
  final Finder seventhUserWidget = find.byKey(const Key('UserCard 6'));
  final Finder eighthUserWidget = find.byKey(const Key('UserCard 7'));

  //юзер карточка - кнопка для перехода на юзера
  final Finder firstUserButton = find.byKey(const Key('UserButton 0'));
  final Finder thirdUserButton = find.byKey(const Key('UserButton 2'));
  final Finder seventhUserButton = find.byKey(const Key('UserButton 6'));

  //кнопка создания юзера на главном экране
  final Finder buttonWidget = find.byKey(const Key('createButton'));

  //кнопка назад со страницы пользователя к выбору юзера
  final Finder backFromProfilePageButton =
      find.byKey(const Key('backFromProfilePageButton'));

  //кнопка назад со страницы настроек к выбору юзера
  final Finder backFromSettinsPageButton =
      find.byKey(const Key('exitFromSettings'));

  //виджет создания юзера и его поля ТекстИнпутФилды
  final Finder newUserWidget = find.byKey(const Key('newUserWidget'));
  final Finder usernameInputWidget = find.byKey(const Key('name'));
  final Finder emailInputWidget = find.byKey(const Key('email'));
  final Finder passwordInputWidget = find.byKey(const Key('password'));

  //кнопка настроек - нужно искать по иконке
  final Finder settingsPageButton = find.byIcon(Icons.settings_outlined);
  //кнопка страницы профиля
  final Finder profilePageButton = find.byIcon(Icons.person_outline_outlined);

  //кнопка перехода в настройки темы changeTheme
  final Finder changeThemeButton = find.byKey(const Key('changeThemeButton'));
  //кнопка в настройках темы, скругления углов
  final Finder roundedBorderButton =
      find.byKey(const Key('roundedBorderButton'));

  //кнопка asap page
  final Finder asapPageButton = find.byIcon(Icons.chat_bubble_outline_rounded);
  //поиск userCardWidget
  final Finder userCardWidget = find.byType(UserCardWidget);
  //userCardWidget с первым другом
  final Finder firstUserCard = find.byKey(const Key('userCardWidget 0'));
  //текст филд ввода сообщения
  final Finder messageInputField = find.byKey(const Key('messageInputField'));
  //кнопка отправки сообщения
  final Finder sendMessageButton = find.byKey(const Key('sendMessageButton'));
  //кнопка выбора картинки в сообщениях
  final Finder chooseImageButton = find.byIcon(Icons.emoji_emotions_outlined);

  //кнопки на экране заполнения данных нового юзера
  final Finder createUserButton = find.byKey(const Key('createUserButton'));
  final Finder cancelCreateButton =
      find.byKey(const Key('cancelUserCreateButton'));
  //кнопка подтверждения ОК при завержении создания юзера
  final Finder createUserDialogButton =
      find.byKey(const Key('createUserDialogButton'));
}
