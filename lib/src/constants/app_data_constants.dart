import 'dart:io';

class AppDataConstants {
  AppDataConstants();

  static final os = Platform.operatingSystem;

  static final envVars = Platform.environment;
  // ignore: prefer_function_declarations_over_variables
  static final userDirectory = AppData().userDir(envVars: envVars);

  static final dbDirectory =
      '$userDirectory/AppData/Local/FlutterChatApp/databases/';
}

class AppData {
  AppData();

  // ignore: body_might_complete_normally_nullable
  String? userDir({required Map<String, String> envVars}) {
    {
      if (Platform.isMacOS) {
        return envVars['HOME'];
      } else if (Platform.isLinux) {
        return envVars['HOME'];
      } else if (Platform.isWindows) {
        return envVars['UserProfile'];
      }
    }
  }
}
