import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static const FRIENDS_CHAT_ID_KEY = "friends_chat_id_key";
  static const MESSAGE_ID_KEY = "message_id_key";
  static const IS_READ_KEY = "is_read_key";

  setIsRead(bool value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool(IS_READ_KEY, value);
  }

  getIsRead() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool(IS_READ_KEY) ?? true;
  }

  setFriendsChatId(int value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(FRIENDS_CHAT_ID_KEY, value.toString());
  }

  getFriendsChatId() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(FRIENDS_CHAT_ID_KEY);
  }

  setMessageId(int value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(MESSAGE_ID_KEY, value.toString());
  }

  getMessageId() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(MESSAGE_ID_KEY);
  }
}
