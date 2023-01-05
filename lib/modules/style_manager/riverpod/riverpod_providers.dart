part of 'package:chat_app/main.dart';

final changeCustomThemeStateProvider = StateProvider<UserThemeData>((ref) {
  return UserThemeData(
      fontFamily: 'Roboto',
      fontSizeFactor: 1,
      textColor: Colors.black87,
      brightness: Brightness.light,
      primaryColor: MyApp().createMaterialColor(const Color(0xFFFF9800)),
      borderRadius: 20);
});
