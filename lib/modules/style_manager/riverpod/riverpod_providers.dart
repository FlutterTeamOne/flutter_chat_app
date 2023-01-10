import 'package:chat_app/main.dart';
import 'package:chat_app/modules/style_manager/riverpod/theme_models.dart';

import 'package:chat_app/modules/style_manager/utils/style_manager_utils.dart';
import 'package:chat_app/ui/widgets/custom_theme/color_picker_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../storage_manager/db_helper/db_helper.dart';

final changeCustomThemeStateProvider = StateProvider<UserThemeData>((ref) {
  const String color = 'Colors.black87';
  const String tableName = 'user_theme';
  Map<String, dynamic> model = {
    'primaryColor':
        'StyleManagerUtils().createMaterialColor(const Color(0xFFFF9800))',
    'brightness': 'brightness',
    'fontFamily': 'fontFamily',
    'fontSizeFactor': 'fontSizeFactor',
    'borderRadius': 20,
    'textColor': 'Colors.black87'
  };
  DBHelper.instanse.onAdd(tableName: tableName, model: model);
  return UserThemeData(
      fontFamily: 'Roboto',
      fontSizeFactor: 1,
      textColor: color.toColor,
      brightness: Brightness.light,
      primaryColor:
          StyleManagerUtils().createMaterialColor(const Color(0xFFFF9800)),
      borderRadius: 20);
});

// class UserThemeDataNotifier extends StateNotifier<UserThemeData> {
//   UserThemeDataNotifier()
//       : super(UserThemeData(
//             fontFamily: 'Roboto',
//             fontSizeFactor: 1,
//             textColor: Colors.black87,
//             brightness: Brightness.light,
//             primaryColor: MyApp().createMaterialColor(const Color(0xFFFF9800)),
//             borderRadius: 20)) {}
//
//   changeThemeData({required UserThemeData userThemeData}) {
//     state = state.copyWith();
//   }
//
//   changeBrightness(value) {
//     state = state.copyWith(brightness: value);
//   }
//
//   changeFontFamily(value) {
//     state = state.copyWith(fontFamily: value);
//   }
//
//   changeFontSizeFactor(value) {
//     state = state.copyWith(fontSizeFactor: value);
//   }
//
//   changeTextColor(value) {
//     state = state.copyWith(textColor: value);
//   }
//
//   changePrimaryColor(value) {
//     state = state.copyWith(primaryColor: value);
//   }
//
//   changeBorderRadius(value) {
//     state = state.copyWith(borderRadius: value);
//   }
// }
