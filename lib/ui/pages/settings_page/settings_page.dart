import '../../../src/libraries/library_all.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var changeThemeBloc = context.read<ChangeThemeBloc>();
    return Scaffold(
      body: CustomScrollView(
        shrinkWrap: true,
        slivers: [
          SliverToBoxAdapter(
            child: themeSettings(changeThemeBloc),
          ),
        ],
      ),
    );
  }

  themeSettings(changeThemeBloc) {
    return SizedBox(
      height: 600,
      child: Column(
        children: [
          Flexible(
            child: SingleChildScrollView(
              child: ListView.builder(
                  shrinkWrap: true,
                  // physics: NeverScrollableScrollPhysics(),
                  itemCount: 3,
                  itemBuilder: (BuildContext context, int cardIndex) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0)),
                          color: changeThemeBloc.state.cardColor[cardIndex],
                          child: SizedBox(
                            height: 350,
                            child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: 3,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, iconIndex) {
                                  return IconButton(
                                    onPressed: () {
                                      changeThemeBloc.add(SetThemeEvent(
                                          index: cardIndex * 2 + iconIndex));
                                    },
                                    icon: Icon(
                                      changeThemeBloc
                                          .state.selectIcon[iconIndex],
                                      color: changeThemeBloc.state.iconColor[
                                          changeThemeBloc.state.index],
                                    ),
                                    iconSize: 20,
                                  );
                                }),
                          )
                          //  Row(
                          //   children: [
                          //     ListView.builder(
                          //         scrollDirection: Axis.horizontal,
                          //         shrinkWrap: true,
                          //         // physics: NeverScrollableScrollPhysics(),

                          //         itemCount: 2,
                          //         itemBuilder:
                          //             (BuildContext context, int iconIndex) {
                          //           return SizedBox(
                          //             width: 500,
                          //             child: IconButton(
                          //               onPressed: () {
                          //                 changeThemeBloc.add(SetThemeEvent(
                          //                     index: cardIndex * 2 + iconIndex));
                          //               },
                          //               icon: Icon(
                          //                 changeThemeBloc
                          //                     .state.selectIcon[iconIndex],
                          //                 color: changeThemeBloc.state.iconColor[
                          //                     changeThemeBloc.state.index],
                          //               ),
                          //               iconSize: 20,
                          //             ),
                          //           );
                          //         }),
                          //   ],
                          // ),
                          ),
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
