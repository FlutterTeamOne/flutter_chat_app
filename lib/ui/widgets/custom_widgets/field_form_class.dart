import 'package:email_validator/email_validator.dart';
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

  static RegExp regExpPassword =
      RegExp(r'^[A-Za-z0-9!@#\$&*~а-яА-Я]+', unicode: true);
  static RegExp regExpEmail = RegExp(r'^[a-zA-Z0-9@._-]+');
  static RegExp regExpName =
      RegExp(r'^[A-Za-z0-9!@#\$&*~а-яА-Я]+', unicode: true);

  static String? validatorName(String? name) {
    if (name!.length < 3) {
      //если длинна имени меньше 3 символов выводиим ошибку
      return 'Name must contain at least 3 characters';
    }
    return null;
  }

  static validatorEmail(String? email) {
    if (email != null && !EmailValidator.validate(email)) {
      // Валидация сделана при помощи пакета email_validator
      return 'Enter a valid email';
    }
    return null;
  }

  static String? validatorPassword(String? password) {
    if (password == null || password.length < 6) {
      //если длинна пароля меньше 6 символов выводиим ошибку
      return 'Password must contain at least 6 characters';
    } else if (!password.contains(RegExp(r'[A-ZА-Я]'))) {
      //если пароль не содержит хотя бы одну заглавную буквку выводим ошибку
      return 'Password must contain at least \none uppercase letter';
    } else if (!password.contains(RegExp(r'[a-zа-я]'))) {
      //если пароль не содержит хотя бы одну заглавную буквку выводим ошибку
      return 'Password must contain at least \none lowercase letter';
    } else if (!password.contains(RegExp(r'[0-9]'))) {
      return 'Password must contain at least \none number';
    } else if (!password.contains(RegExp(r'[!@#\$&*~]'))) {
      return 'Password must contain at least \nsymbol !@#\\\$&*';
    } else {
      return null;
    }
  }

  static String? validatorOldNewPassword(
      String passwordOld, String passwordNew) {
    if (passwordNew == passwordOld) {
      return "The password is the same as the old one";
    }
    return null;
  }

  static String? validatorNewPasswords(String password1, String password2) {
    if (password1 != password2) {
      return "Passwords do not match. Try again.";
    }
    return null;
  }
}
