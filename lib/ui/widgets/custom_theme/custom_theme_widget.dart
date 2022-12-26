import 'package:chat_app/ui/pages/library/library_pages.dart';
import 'package:chat_app/ui/widgets/custom_theme/color_wheel_picker.dart';
import 'package:flutter/material.dart';

class CustomThemesWidget extends StatefulWidget {
  const CustomThemesWidget({Key? key}) : super(key: key);

  @override
  State<CustomThemesWidget> createState() => _CustomThemesWidgetState();
}

class _CustomThemesWidgetState extends State<CustomThemesWidget> {
  final iconCheck = Icons.check;
  final themeMainColor = [
    Colors.pink,
    Colors.red,
    Colors.deepOrange,
    Colors.orange,
    Colors.amber,
    Colors.yellow,
    Colors.lime,
    Colors.lightGreen,
    Colors.green,
    Colors.teal,
    Colors.cyan,
    Colors.lightBlue,
    Colors.blue,
    Colors.indigo,
    Colors.purple,
    Colors.deepPurple,
    Colors.blueGrey,
    Colors.brown,
    Colors.grey,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(MainLayout.routeName);
                  },
                  icon: Icon(Icons.close_rounded))
            ],
          ),
          Text('Choise main theme color'),
          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: themeMainColor.length,
                itemBuilder: (context, index) {
                  return ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(themeMainColor[index])),
                      onPressed: () {},
                      child: Icon(iconCheck));
                }),
          ),
          Text('Choise secondary theme color'),
          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: themeMainColor.length,
                itemBuilder: (context, index) {
                  return ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(themeMainColor[index])),
                      onPressed: () {},
                      child: Icon(iconCheck));
                }),
          ),
          Expanded(child: ColorWheelPicker(color: Colors.blueGrey, onChanged: (Color value) {  }, onWheel: (bool value) {  }, )),
        ],
      ),
    );
  }
}
