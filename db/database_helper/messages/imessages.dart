import '../db_helper.dart';

abstract class IMessages extends DBHelper  {

  IMessages();

  addNewMessage({required int friendsChatId, required int senderId, required String content, required String date});

  getMessageById({required int id});

  updateMessage({required String newValues, required String condition});

  deleteMessage({required int id});

  getMessagesBySenderId({required int senderID});

  getMessagesByChatId({required int chatID});

  getAllMessages();

}