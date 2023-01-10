import 'dart:io';

import 'package:chat_app/modules/storage_manager/db_helper/db_helper_start.dart';
import 'package:chat_app/src/constants/app_data_constants.dart';
import 'package:flutter/material.dart';
import 'package:window_size/window_size.dart';

import 'modules/storage_manager/db_helper/user_path.dart';
import 'modules/storage_manager/library/library_storage_manager.dart';

class AppInit{
  static init()async{
     WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    setWindowMinSize(const Size(960, 480));
  }
  // Locator.setUp();

  await UserPref.init();
  await UserPref.restore();
  print("UserPref: ${UserPref.getUserDbPref}");
  UserPref.getUserDbPref
      ? await DBHelperStart.instanse.initDB()
      : await DBHelper.instanse.initDB();

  var envVars = AppDataConstants.envVars;
  var userDir = AppDataConstants.userDirectory;
  var directory =
      await Directory('$userDir/AppData/Local/FlutterChatApp/databases')
          .create(recursive: true);
  print(directory.path);
  }
}