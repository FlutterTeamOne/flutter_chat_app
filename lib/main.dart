import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat_app/features/presentation/main_layout/main_layout.dart';
import 'package:flutter_chat_app/style%20manager/bloc/change_theme_bloc/change_theme_bloc.dart';
import 'package:flutter_chat_app/style%20manager/bloc/change_theme_bloc/change_theme_state.dart';
import 'package:flutter_chat_app/style%20manager/settings_page.dart';

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
          return MaterialApp(
            theme: state.theme == 'light'
                ? ThemeData(
                    brightness: Brightness.light,
                    primarySwatch: Colors.deepPurple,
                  )
                : ThemeData(
                    brightness: Brightness.dark,
                    primarySwatch: Colors.deepPurple,
                  ),
            title: 'Flutter chat app',
            debugShowCheckedModeBanner: false,
            initialRoute: '/',
            routes: {
              '/': (context) => const MainLayout(),
              '/mainLayout': (context) => const MainLayout(),
              '/Settings page': (context) => const SettingsPage(),
            },
          );
        },
      ),
    );
  }
}
