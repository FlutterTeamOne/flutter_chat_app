import 'package:sqflite_common/sqlite_api.dart';

import '../db_helper.dart';

abstract class IMessages extends DBHelper  {

  IMessages();

  addNewMessage({required Database db, required int friendsChatId, required int senderId, required String content, required String date});

  getMessageById({required Database db, required int id});

  updateMessage({required Database db, required String newValues, required String condition});

  deleteMessage({required Database db, required int id});

  getMessagesBySenderId({required Database db, required int senderID});

  getMessagesByChatId({required Database db, required int chatID});

  getAllMessages({required Database db});

}