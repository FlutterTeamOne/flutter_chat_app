import 'package:chat_app/app_init.dart';
import 'package:chat_app/modules/style_manager/riverpod/theme_models.dart';
import 'package:chat_app/modules/style_manager/utils/style_manager_utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:chat_app/ui/pages/custom_theme/color_picker_page.dart';

import 'modules/storage_manager/db_helper/user_path.dart';
import 'ui/auth/authorization_page.dart';
import 'ui/pages/registration_page/registration_page.dart';
import 'ui/widgets/registration_page/bloc/new_user_bloc.dart';

import 'ui/pages/library/library_pages.dart';
import 'src/libraries/library_all.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'modules/style_manager/riverpod/riverpod_providers.dart';

Future<void> main() async {
  await AppInit.init();
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final GrpcClient grpcClient = GrpcClient();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (context) => NewUserBloc()),
    ], child: buildMaterialApp(context));
  }
}

Consumer buildMaterialApp(BuildContext context) {
  return Consumer(
    builder: (context, ref, child) {
      final theme = ref.watch(changeCustomThemeStateProvider);
      return MaterialApp(
        theme: ThemeData(
          textTheme: Theme.of(context).textTheme.apply(
              fontFamily: theme.fontFamily!,
              displayColor: theme.textColor,
              bodyColor: theme.textColor,
              fontSizeFactor: theme.fontSizeFactor!),
          useMaterial3: true,
          listTileTheme: ListTileThemeData(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(theme.borderRadius!))),
          cardTheme: CardTheme(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(theme.borderRadius!))),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ButtonStyle(
                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(theme.borderRadius!))))),
          buttonTheme: ButtonThemeData(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(theme.borderRadius!))),
          brightness: theme.brightness,
          primarySwatch:
              StyleManagerUtils().createMaterialColor(theme.primaryColor!),

          primaryColor:
              StyleManagerUtils().createMaterialColor(theme.primaryColor!),
          errorColor: Colors.redAccent.shade200,

          textSelectionTheme: TextSelectionThemeData(
            cursorColor: theme.textColor,
            selectionColor: theme.textColor,
            selectionHandleColor: theme.textColor,
          ),
          //стиль для scroll down button
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black54,
          ),
        ),
        title: 'Flutter chat app',
        debugShowCheckedModeBanner: false,
        initialRoute:
            !UserPref.getUserDbPref ? MainLayout.routeName : AuthPage.routeName,
        routes: {
          RegistrationPage.routeName: (context) => const RegistrationPage(),
          AuthPage.routeName: (context) => const AuthPage(),
          MainLayout.routeName: (context) => const MainLayout(),
          '/settings_page': (context) => const SettingsPage(),
          '/color_picker_page': (context) => const ColorPickerPage(),
        },
      );
    },
  );
}
