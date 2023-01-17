import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static const friendsChatIdKey = "friends_chat_id_key";
  static const isReadKey = "is_read_key";
  static const messageIdKey = "message_id_key";
  static const themeKey = "theme_key";

  setIsRead(bool value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool(isReadKey, value);
  }

  getIsRead() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool(isReadKey);
  }

  setFriendsChatId(int value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setInt(friendsChatIdKey, value);
  }

  getFriendsChatId() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getInt(friendsChatIdKey);
  }

  setMessageId(int value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setInt(messageIdKey, value);
  }

  getMessageId() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getInt(messageIdKey);
  }

  setThemeEvent(int value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setInt(themeKey, value);
  }

  Future<int?> getTheme() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getInt(themeKey);
  }
}
