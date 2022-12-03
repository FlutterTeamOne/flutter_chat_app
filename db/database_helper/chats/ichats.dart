import '../db_helper.dart';

abstract class IChats extends DBHelper {

  IChats();

  createChat({required int friend1_id, required int friend2_id});

  getChatById({required int id});

  updateChat({required String newValues, required String condition});

  deleteChat({required int id});

  getChatsByUserId({required int userID});

  getChatByTwoIds({required int friend1_id, required int friend2_id});

  getAllChats();

}