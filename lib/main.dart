import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat_app/features/presentation/main_layout/main_layout.dart';
import 'package:flutter_chat_app/style%20manager/bloc/change_theme_bloc/change_theme_bloc.dart';
import 'package:flutter_chat_app/style%20manager/bloc/change_theme_bloc/change_theme_state.dart';
import 'package:flutter_chat_app/style%20manager/settings_page.dart';
import 'package:flutter_chat_app/style%20manager/themes/custom_themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // ChangeThemeBloc changeThemeBloc = BlocProvider.of<ChangeThemeBloc>(context);
    return BlocProvider(
      create: (context) => ChangeThemeBloc(),
      child: BlocBuilder<ChangeThemeBloc, ChangeThemeState>(
        builder: (context, state) {
          if (state.theme == 'lightThemeDeepPurple') {
            final theme = CustomTheme().lightThemeDeepPurple;
            return MaterialApp(
              theme: theme,
              title: 'Flutter chat app',
              debugShowCheckedModeBanner: false,
              initialRoute: '/',
              routes: {
                '/': (context) => const MainLayout(),
                '/mainLayout': (context) => const MainLayout(),
                '/Settings page': (context) => const SettingsPage(),
              },
            );
          } else if (state.theme == 'lightThemeLightBlue') {
            final theme = CustomTheme().lightThemeLightBlue;
            return MaterialApp(
              theme: theme,
              title: 'Flutter chat app',
              debugShowCheckedModeBanner: false,
              initialRoute: '/',
              routes: {
                '/': (context) => const MainLayout(),
                '/mainLayout': (context) => const MainLayout(),
                '/Settings page': (context) => const SettingsPage(),
              },
            );
          } else if (state.theme == 'lightThemeOrange') {
            final theme = CustomTheme().lightThemeOrange;
            return MaterialApp(
              theme: theme,
              title: 'Flutter chat app',
              debugShowCheckedModeBanner: false,
              initialRoute: '/',
              routes: {
                '/': (context) => const MainLayout(),
                '/mainLayout': (context) => const MainLayout(),
                '/Settings page': (context) => const SettingsPage(),
              },
            );
          } else if (state.theme == 'darkThemeLightBlue') {
            final theme = CustomTheme().darkThemeLightBlue;
            return MaterialApp(
              theme: theme,
              title: 'Flutter chat app',
              debugShowCheckedModeBanner: false,
              initialRoute: '/',
              routes: {
                '/': (context) => const MainLayout(),
                '/mainLayout': (context) => const MainLayout(),
                '/Settings page': (context) => const SettingsPage(),
              },
            );
          } else if (state.theme == 'darkThemeOrange') {
            final theme = CustomTheme().darkThemeOrange;
            return MaterialApp(
              theme: theme,
              title: 'Flutter chat app',
              debugShowCheckedModeBanner: false,
              initialRoute: '/',
              routes: {
                '/': (context) => const MainLayout(),
                '/mainLayout': (context) => const MainLayout(),
                '/Settings page': (context) => const SettingsPage(),
              },
            );
          } else {
            final theme = CustomTheme().darkThemeDeepPurple;
            return MaterialApp(
              theme: theme,
              title: 'Flutter chat app',
              debugShowCheckedModeBanner: false,
              initialRoute: '/',
              routes: {
                '/': (context) => const MainLayout(),
                '/mainLayout': (context) => const MainLayout(),
                '/Settings page': (context) => const SettingsPage(),
              },
            );
          }
        },
      ),
    );
  }
}
