import 'package:chat_app/app_init.dart';
import 'package:chat_app/modules/style_manager/riverpod/theme_models.dart';
import 'package:chat_app/modules/style_manager/utils/style_manager_utils.dart';
import 'package:chat_app/ui/pages/change_password_page/change_password_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:chat_app/ui/pages/custom_theme/color_picker_page.dart';
import 'modules/storage_manager/db_helper/user_path.dart';
import 'ui/auth/authorization_page.dart';
import 'ui/pages/registration_page/registration_page.dart';
import 'ui/pages/library/library_pages.dart';
import 'package:flutter/material.dart';
part 'modules/style_manager/riverpod/riverpod_providers.dart';

Future<void> main() async {
  //Инициализация
  await AppInit.init();

  //Запуск приложения
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ///Инициализируем Bloc для создания юзера

    ///Инициализация Стилей Riverpod
    return Consumer(
      builder: (context, ref, child) {
        final theme = ref.watch(changeCustomThemeStateProvider);
        return MaterialApp(
          theme: Themes.myTheme(context, theme),
          title: 'Flutter chat app',
          debugShowCheckedModeBanner: false,

          //Стартовая страница
          initialRoute: !UserPref.getUserDbPref
              ? MainLayout.routeName
              : AuthPage.routeName,
          routes: {
            RegistrationPage.routeName: (context) => const RegistrationPage(),
            AuthPage.routeName: (context) => const AuthPage(),
            MainLayout.routeName: (context) => const MainLayout(),
            SettingsPage.routeName: (context) => const SettingsPage(),
            ColorPickerPage.routeName: (context) => const ColorPickerPage(),
            ChangePasswordPage.routeName: (context) =>
                const ChangePasswordPage()
          },
        );
      },
    );
  }
}
