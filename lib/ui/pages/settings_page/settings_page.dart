import 'package:chat_app/ui/pages/custom_theme/custom_page.dart';
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
        ),
        ElevatedButton(
            style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ))),
            onPressed: () {
              Navigator.of(context).pushNamed(CustomThemePage.routeName);
            },
            child: Text('Custom theme'))
      ],
    ));
  }
}
