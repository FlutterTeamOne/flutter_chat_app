import 'package:chat_app/src/libraries/library_all.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // BlocProvider.of<ChangeThemeBloc>(context);
    return Scaffold(body: Center(child: themeSettings(context)));
  }

  Center themeSettings(BuildContext context) {

    return Center(
      child: CustomScrollView(

        scrollDirection: Axis.vertical,
        slivers: [
          SliverGrid(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 100.0,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              childAspectRatio: 2.0,
            ),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int gridIndex) {
                final ChangeThemeBloc changeThemeBloc = context.read<ChangeThemeBloc>();
                 return Card(
                    shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                   color: changeThemeBloc.state.cardColor[gridIndex],
                   child: IconButton(
                     onPressed: () {
                       changeThemeBloc.add(SetThemeEvent(index: gridIndex));
                     },
                     icon: Icon(
                       changeThemeBloc.state.selectIcon[gridIndex],
                       color: changeThemeBloc.iconColor[gridIndex],
                     ),
                     iconSize: 20,
                   ),
                 );
              },
              childCount: 6,
            ),
          ),
        ],
      ),
    );
  }
}

//   SizedBox themeSettings(BuildContext context) {
//     final ChangeThemeBloc changeThemeBloc = context.read<ChangeThemeBloc>();
//     return SizedBox(
//       height: 500,
//       width: 500,
//       child: ListView.builder(
//           itemCount: 3,
//           itemBuilder: (BuildContext context, int cardIndex) {
//             return Card(
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(20.0)),
//                 color: changeThemeBloc.state.cardColor[cardIndex],
//                 child: Wrap(children: [
//                   ListView.builder(
//                       scrollDirection: Axis.horizontal,
//                       itemCount: 2,
//                       itemBuilder:
//                           (BuildContext context, int iconIndex) {
//                         return IconButton(
//                           onPressed: () {
//                             changeThemeBloc.add(SetThemeEvent(
//                                 activeElementIndex:
//                                     cardIndex * 2 + iconIndex));
//                           },
//                           icon: Icon(
//                             changeThemeBloc.state.selectIcon[iconIndex],
//                             color: changeThemeBloc.state.iconColor[
//                                 changeThemeBloc.state.elementIndex],
//                           ),
//                           iconSize: 20,
//                         );
//                       }),
//                 ]));
//           }),
//     );
//   }
// }
