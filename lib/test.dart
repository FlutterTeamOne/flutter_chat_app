import 'package:flutter/cupertino.dart';

import 'storage_manager/db_helper.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await DBHelper.instanse.initDB();
  runApp(AppTest());
}

class AppTest extends StatelessWidget {
  const AppTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
