part of 'package:chat_app/main.dart';

final changeCustomThemeStateProvider =
    StateProvider<UserThemeData>((ref) {
  return UserThemeData(
      fontFamily: 'Roboto',
      fontSizeFactor: 1,
      textColor: Colors.black87,
      brightness: Brightness.light,
      primaryColor: MyApp().createMaterialColor(const Color(0xFFFF9800)),
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
