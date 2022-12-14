import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static const FRIENDS_CHAT_ID_KEY = "friends_chat_id_key";
  static const IS_READ_KEY = "is_read_key";
  static const MESSAGE_ID_KEY = "message_id_key";
  static const THEME_KEY = "theme_key";

  setIsRead(bool value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool(IS_READ_KEY, value);
  }

  getIsRead() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool(IS_READ_KEY);
  }

  setFriendsChatId(int value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setInt(FRIENDS_CHAT_ID_KEY, value);
  }

  getFriendsChatId() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getInt(FRIENDS_CHAT_ID_KEY);
  }

  setMessageId(int value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setInt(MESSAGE_ID_KEY, value);
  }

  getMessageId() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getInt(MESSAGE_ID_KEY);
  }

  setThemeEvent(int value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setInt(THEME_KEY, value);
  }

  getTheme() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getInt(THEME_KEY);
  }
}
