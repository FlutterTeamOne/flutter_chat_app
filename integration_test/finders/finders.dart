import 'package:chat_app/ui/pages/profile_page/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

abstract class TestFinder {
  //кнопка назад со страницы пользователя к выбору юзера
  final Finder exitButton = find.byType(ExitButton);

  //кнопка страницы профиля
  final Finder profilePageButton = find.byIcon(Icons.person_outline_outlined);

  //кнопка подтверждения ОК ErrorDialog
  final Finder dialogButton = find.byType(TextButton);

  //поле ввода
  final Finder textFormField = find.byType(TextFormField);
}
