import 'package:flutter/material.dart';

class FieldFormClass {
  final String lableText;
  final bool? obscureText;
  final RegExp inputFormatters;
  final int? maxLength;
  final String? Function(String?) validator;
  final TextEditingController controller;

  FieldFormClass({
    required this.lableText,
    required this.controller,
    this.obscureText = false,
    required this.inputFormatters,
    this.maxLength = 16,
    required this.validator,
  });

  //TODO: Валидации не хватает проверки на хотя бы один символ и хотя бы одну цифру
  static String? validatorPassword(String? password) {
    if (password == null || password.length < 6) {
      //если длинна пароля меньше 6 символов выводиим ошибку
      return 'Password must contain at least 6 characters';
    } else if (!password.contains(RegExp(r'[A-Z]'))) {
      //если пароль не содержит хотя бы одну заглавную буквку выводим ошибку
      return 'Password must contain at least one capital\nletter';
    } else {
      return null;
    }
  }

  static String? validatorOldNewPassword(
      String passwordOld, String passwordNew) {
    if (passwordNew == passwordOld) {
      return "Пароль совпадает со старым";
    }
    return null;
  }

  static String? validatorNewPasswords(String password1, String password2) {
    if (password1 != password2) {
      return "Пароль не совпадает";
    }
    return null;
  }
}
