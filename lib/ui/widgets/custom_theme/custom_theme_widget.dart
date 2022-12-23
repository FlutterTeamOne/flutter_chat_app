import 'package:chat_app/ui/pages/library/library_pages.dart';
import 'package:flutter/material.dart';

class CustomThemeWidget extends StatefulWidget {
  const CustomThemeWidget({Key? key}) : super(key: key);

  @override
  State<CustomThemeWidget> createState() => _CustomThemeWidgetState();
}

class _CustomThemeWidgetState extends State<CustomThemeWidget> {
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
          )
        ],
      ),
    );
  }
}
