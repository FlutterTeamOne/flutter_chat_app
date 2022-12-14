import 'package:flutter/material.dart';
import '../../widgets/settings_page/theme_settings_widget.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: themeSettings(context)));
  }

  Center themeSettings(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 200,
          width: 100,
          child: Expanded(
              child: ListView.builder(
                  itemCount: 3,
                  itemBuilder: (BuildContext context, int index) {
                    return CardWidget(context, index);
                  })),
        )
      ],
    ));
  }
}

