import 'package:flutter/material.dart';

import '../../widgets/custom_theme/custom_theme_widget.dart';

class CustomThemesPage extends StatefulWidget {
  const CustomThemesPage({Key? key}) : super(key: key);
  static const routeName = '/custom_theme_page';

  @override
  State<CustomThemesPage> createState() => _CustomThemesPageState();
}

class _CustomThemesPageState extends State<CustomThemesPage> {
  @override
  Widget build(BuildContext context) {
    return CustomThemesWidget();
  }
}
