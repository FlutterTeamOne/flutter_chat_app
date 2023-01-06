import 'dart:io';
import 'package:chat_app/modules/style_manager/riverpod/theme_models.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:chat_app/modules/signal_service/bloc/grpc_connection_bloc/grpc_connection_bloc.dart';
import 'package:chat_app/modules/storage_manager/db_helper/user_path.dart';
import 'package:chat_app/src/constants/app_data_constants.dart';

import 'package:chat_app/ui/auth/authorization_page.dart';
import 'package:chat_app/ui/pages/custom_theme/color_picker_page.dart';

import 'package:chat_app/ui/pages/registration_page/registration_page.dart';
import 'package:chat_app/ui/widgets/registration_page/bloc/new_user_bloc.dart';
import 'modules/storage_manager/db_helper/db_helper_start.dart';

import 'ui/pages/library/library_pages.dart';
import 'src/libraries/library_all.dart';
import 'modules/signal_service/service_locator/locator.dart' as locator;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:window_size/window_size.dart';

part 'modules/style_manager/riverpod/riverpod_providers.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    setWindowMinSize(const Size(960, 480));
  }
  locator.Locator.setUp();

  await UserPref.init();
  await UserPref.restore();
  print("UserPref: ${UserPref.getUserDbPref}");
  UserPref.getUserDbPref
      ? await DBHelperStart.instanse.initDB()
      : await DBHelper.instanse.initDB();

  //var envVars = AppDataConstants.envVars;
  var userDir = AppDataConstants.userDirectory;
  var directory =
      await Directory('$userDir/AppData/Local/FlutterChatApp/databases')
          .create(recursive: true);
  print(directory.path);
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final GrpcClient grpcClient = GrpcClient();
  MaterialColor createMaterialColor(Color color) {
    List strengths = <double>[.05];
    Map<int, Color> swatch = {};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    for (var strength in strengths) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    }
    return MaterialColor(color.value, swatch);
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<ConnectionBloc>(
        create: (context) => ConnectionBloc(),
        // lazy: false,
      ),
      BlocProvider(
        create: (_) => GrpcConnectionBloc(grpcClient, ConnectionBloc())
          ..add(
            const GrpcConnectionStarted(),
          ),
        // lazy: false,
      ),
      BlocProvider<UserBloc>(
        create: (context) =>
            UserBloc()..add(ReadUsersEvent(userDb: UserPref.getUserDbPref)),
      ),
      BlocProvider<ChatBloc>(
        create: (context) => ChatBloc(userBloc: UserBloc()),
      ),
      BlocProvider<MessageBloc>(
        create: (context) => MessageBloc(
            grpcClient: grpcClient,
            grpcConnection: context.read<GrpcConnectionBloc>()),
      ),
      BlocProvider(
        create: (context) => ChangeThemeBloc(),
      ),
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
          primarySwatch: MyApp().createMaterialColor(theme.primaryColor!),
          // primarySwatch: createMaterialColor(state.primaryColor!),
          primaryColor: MyApp().createMaterialColor(theme.primaryColor!),
          errorColor: Colors.redAccent.shade200,
          // backgroundColor: Colors.black45,
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
