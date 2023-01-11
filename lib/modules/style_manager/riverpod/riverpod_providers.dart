part of 'package:chat_app/main.dart';

final changeCustomThemeStateProvider =
    StateProvider<UserThemeData>((ref) {
  return UserThemeData(
      fontFamily: 'Roboto',
      fontSizeFactor: 1,
      textColor: Colors.black87,
      brightness: Brightness.light,
      primaryColor: StyleManagerUtils().createMaterialColor(const Color(0xFFFF9800)),
      borderRadius: 20);
});
class Themes {
  static myTheme(BuildContext context, UserThemeData theme) {
    return ThemeData(
      textTheme: Theme.of(context).textTheme.apply(
          fontFamily: theme.fontFamily!,
          displayColor: theme.textColor,
          bodyColor: theme.textColor,
          fontSizeFactor: theme.fontSizeFactor!),
      useMaterial3: true,
      listTileTheme: ListTileThemeData(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(theme.borderRadius!))),
      cardTheme: CardTheme(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(theme.borderRadius!))),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
              shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(theme.borderRadius!))))),
      buttonTheme: ButtonThemeData(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(theme.borderRadius!))),
      brightness: theme.brightness,
      primarySwatch:
          StyleManagerUtils().createMaterialColor(theme.primaryColor!),

      primaryColor:
          StyleManagerUtils().createMaterialColor(theme.primaryColor!),
      errorColor: Colors.redAccent.shade200,

      textSelectionTheme: TextSelectionThemeData(
        cursorColor: theme.textColor,
        selectionColor: theme.textColor,
        selectionHandleColor: theme.textColor,
      ),
      //стиль для scroll down button
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black54,
      ),
    );
  }
}
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
