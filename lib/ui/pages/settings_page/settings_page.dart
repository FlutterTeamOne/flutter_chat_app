import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  static const routeName = '/settings_page';
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
        // SizedBox(
        //   height: 200,
        //   width: 100,
        //   child: ListView.builder(
        //       itemCount: 3,
        //       itemBuilder: (BuildContext context, int index) {
        //         return CardWidget(context, index);
        //       }),
        // ),
        ElevatedButton(
            // style: ButtonStyle(
            //     shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            //         RoundedRectangleBorder(
            //   borderRadius: BorderRadius.circular(20.0),
            // ))),
            onPressed: () {
              // context.read<ChangeThemeBloc>().add(SetThemeEvent(index: 6));
              Navigator.of(context).pushNamed('/color_picker_page');
            },
            child: const Text('Custom theme'))
      ],
    ));
  }
}
