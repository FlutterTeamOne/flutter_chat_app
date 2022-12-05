import 'package:sqflite_common/sqlite_api.dart';

import '../db_helper.dart';

abstract class IChats extends DBHelper {

  IChats();

  createChat({required Database db, required int friend1_id, required int friend2_id});

  getChatById({required Database db, required int id});

  updateChat({required Database db, required String newValues, required String condition});

  deleteChat({required Database db, required int id});

  getChatsByUserId({required Database db, required int userID});

  getChatByTwoIds({required Database db, required int friend1_id, required int friend2_id});

  getAllChats({required Database db});

}