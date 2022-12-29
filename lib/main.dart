import 'dart:io';

import 'package:chat_app/modules/signal_service/bloc/grpc_connection_bloc/grpc_connection_bloc.dart';
import 'package:chat_app/modules/storage_manager/db_helper/user_path.dart';
import 'package:chat_app/modules/style_manager/themes/custom_themes.dart';
import 'package:chat_app/src/generated/grpc_lib/grpc_user_lib.dart';
import 'package:chat_app/src/constants/app_data_constants.dart';

import 'package:chat_app/ui/auth/authorization_page.dart';
import 'package:chat_app/ui/pages/custom_theme/color_picker_page.dart';

import 'package:chat_app/ui/pages/registration_page/registration_page.dart';
import 'package:chat_app/ui/widgets/registration_page/bloc/new_user_bloc.dart';
import 'package:path/path.dart';
import 'modules/storage_manager/db_helper/db_helper_start.dart';

import 'ui/pages/library/library_pages.dart';
import 'src/libraries/library_all.dart';
import 'modules/signal_service/service_locator/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:window_size/window_size.dart';



Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    setWindowMinSize(const Size(960, 480));
  }
  Locator.setUp();

  await UserPref.init();
  await UserPref.restore();
  print("UserPref: ${UserPref.getUserDbPref}");
  UserPref.getUserDbPref
    ? await DBHelperStart.instanse.initDB()
    : await DBHelper.instanse.initDB();
  
  var envVars = AppDataConstants.envVars;
  var userDir = AppDataConstants.userDirectory;
  var directory = await Directory('$userDir/AppData/Local/FlutterChatApp/databases').create(recursive: true);
  print(directory.path);
  runApp(MyApp());
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

  MaterialColor getMaterialColor(Color color) {
    final int red = color.red;
    final int green = color.green;
    final int blue = color.blue;

    final Map<int, Color> shades = {
      50: Color.fromRGBO(red, green, blue, .1),
      100: Color.fromRGBO(red, green, blue, .2),
      200: Color.fromRGBO(red, green, blue, .3),
      300: Color.fromRGBO(red, green, blue, .4),
      400: Color.fromRGBO(red, green, blue, .5),
      500: Color.fromRGBO(red, green, blue, .6),
      600: Color.fromRGBO(red, green, blue, .7),
      700: Color.fromRGBO(red, green, blue, .8),
      800: Color.fromRGBO(red, green, blue, .9),
      900: Color.fromRGBO(red, green, blue, 1),
    };
    return MaterialColor(color.value, shades);
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
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
      ],
      child: BlocBuilder<ChangeThemeBloc, ChangeThemeState>(
        builder: (context, state) {
          if (state.index == 6) {
            final ThemeData theme = ThemeData(
              // colorScheme: ColorScheme(
              //     brightness: state.brightness!,
              //     primary: state.primaryColor!,
              //     onPrimary: Colors.white,
              //     secondary: Colors.white,
              //     onSecondary: Colors.white,
              //     error: Colors.redAccent,
              //     onError: Colors.white,
              //     background: Colors.black54,
              //     onBackground: Colors.white,
              //     surface: Colors.black54,
              //     onSurface: Colors.black54),
              textTheme: Theme.of(context).textTheme.apply(
                  displayColor: state.textColor,
                  bodyColor: state.textColor,
                  fontSizeFactor: state.fontSizeFactor!),
              // iconTheme: IconThemeData(color: Colors.white),
              useMaterial3: true,
              listTileTheme: ListTileThemeData(
                  shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(state.borderRadius!))),
              cardTheme: CardTheme(
                  shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(state.borderRadius!))),
              elevatedButtonTheme: ElevatedButtonThemeData(
                  style: ButtonStyle(
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(state.borderRadius!))))),
              buttonTheme: ButtonThemeData(
                  shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(state.borderRadius!))),
              brightness: state.brightness,
              primarySwatch: createMaterialColor(state.primaryColor!),
              // primarySwatch: createMaterialColor(state.primaryColor!),
              primaryColor: createMaterialColor(state.primaryColor!),
              errorColor: Colors.redAccent.shade200,
              // backgroundColor: Colors.black45,
              textSelectionTheme: TextSelectionThemeData(
                cursorColor: state.textColor,
                selectionColor: state.textColor,
                selectionHandleColor: state.textColor,
              ),
              //стиль для scroll down button
              floatingActionButtonTheme: const FloatingActionButtonThemeData(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black54,
              ),
            );
            return buildMaterialApp(theme!);
          } else {
            final ThemeData? theme = state.theme;
            return buildMaterialApp(theme!);
          }
        },
      ),
    );
  }

  //
  MaterialApp buildMaterialApp(ThemeData theme) {
    return MaterialApp(
      theme: theme,
      title: 'Flutter chat app',
      debugShowCheckedModeBanner: false,
      initialRoute:
          !UserPref.getUserDbPref ? MainLayout.routeName : AuthPage.routeName,
      routes: {
        '/registration page': (context) => const RegistrationPage(),
        AuthPage.routeName: (context) => const AuthPage(),
        MainLayout.routeName: (context) => const MainLayout(),
        '/Settings page': (context) => const SettingsPage(),
        '/color picker page': (context) => const ColorPickerPage(),
      },
    );
  }
}
