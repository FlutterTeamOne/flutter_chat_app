import 'package:chat_app/src/libraries/library_all.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

Widget CardWidget(BuildContext context, int index) {
  final ChangeThemeBloc changeThemeBloc = context.read<ChangeThemeBloc>();
  return Card(
    color: changeThemeBloc.state.cardColor[index],
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20.0),
    ),
    child: SizedBox(
      height: 40,
      width: 40,
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        IconButton(
          onPressed: () {
            changeThemeBloc.add(SetThemeEvent(index: index * 2 + 0));
          },
          icon: Icon(
            changeThemeBloc.state.selectIcon[0],
            color: changeThemeBloc.state.iconColor[index * 2 + 0],
          ),
          iconSize: 20,
        ),
        IconButton(
          onPressed: () {
            changeThemeBloc.add(SetThemeEvent(index: index * 2 + 1));
          },
          icon: Icon(
            changeThemeBloc.state.selectIcon[1],
            color: changeThemeBloc.state.iconColor[index * 2 + 1],
          ),
          iconSize: 20,
        ),
      ]),
    ),
  );
}
// child: ListView.builder(
//     itemCount: 3,
//     itemBuilder: (BuildContext context, int cardIndex) {
// return Card(
//     shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(20.0)),
//     color: changeThemeBloc.state.cardColor[cardIndex],
//     child: Wrap(children: [
//       ListView.builder(
//           scrollDirection: Axis.horizontal,
//           itemCount: 2,
//           itemBuilder: (BuildContext context, int iconIndex) {
//             return IconButton(
//               onPressed: () {
//                 // changeThemeBloc.add(SetThemeEvent(
//                 //     activeElementIndex: cardIndex * 2 + iconIndex));
//               },
//               icon: Icon(
//                 changeThemeBloc.state.selectIcon[iconIndex],
//                 color: Colors.red,
//                 // changeThemeBloc.state
//                 //     .iconColor[changeThemeBloc.state.elementIndex],
//               ),
//               iconSize: 20,
//             );
//           }),
//     ]));
// }),
