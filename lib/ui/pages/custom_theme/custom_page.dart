import 'package:flutter/material.dart';

import '../../widgets/custom_theme/custom_theme_widget.dart';

class CustomThemePage extends StatefulWidget {
  const CustomThemePage({Key? key}) : super(key: key);
  static const routeName = '/custom_theme_page';

  @override
  State<CustomThemePage> createState() => _CustomThemePageState();
}

class _CustomThemePageState extends State<CustomThemePage> {
  @override
  Widget build(BuildContext context) {
    return CustomThemeWidget();
  }
}
