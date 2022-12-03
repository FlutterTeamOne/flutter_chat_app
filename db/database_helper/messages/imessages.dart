import '../db_helper.dart';

abstract class IMessages extends DBHelper  {

  IMessages();

  addNewMessage();

  getMessageById();

  updateMessage();

  deleteMessage();

  getMessagesByUserId();

  getMessagesByChatId();

  getAllMessages();

}