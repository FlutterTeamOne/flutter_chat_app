import 'package:chat_app/ui/pages/custom_theme/color_picker_page.dart';

import 'ui/widgets/custom_theme/flex_color_picker.dart';
import 'package:flutter/material.dart';

import '/ui/widgets/custom_theme/utils/app_scroll_behavior.dart';

void main() => runApp(const ColorPickerDemo());

class ColorPickerDemo extends StatefulWidget {
  const ColorPickerDemo({super.key});

  @override
  _ColorPickerDemoState createState() => _ColorPickerDemoState();
}

class _ColorPickerDemoState extends State<ColorPickerDemo> {
  late ThemeMode themeMode;

  @override
  void initState() {
    super.initState();
    themeMode = ThemeMode.light;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      scrollBehavior: AppScrollBehavior(),
      title: 'ColorPicker',
      theme: ThemeData.from(colorScheme: const ColorScheme.highContrastLight())
          .copyWith(scaffoldBackgroundColor: Colors.grey[50]),
      darkTheme:
          ThemeData.from(colorScheme: const ColorScheme.highContrastDark()),
      themeMode: themeMode,
      home: ColorPickerPage(
        themeMode: (ThemeMode mode) {
          setState(() {
            themeMode = mode;
          });
        },
      ),
    );
  }
}

