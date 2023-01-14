import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

abstract class TestFinder {
  //кнопка назад со страницы пользователя к выбору юзера
  final Finder backFromProfilePageButton =
      find.byKey(const Key('backFromProfilePageButton'));
}
