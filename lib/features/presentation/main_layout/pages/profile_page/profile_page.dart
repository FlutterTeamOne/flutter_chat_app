import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../src/libs/bloc_lib.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserBloc, UserState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return state.users?[0].name != null
            ? Center(
                child: Column(
                  children: [
                    Container(
                      // color: AppColor.color7E57C2,
                      child: Text(
                        'Profile',
                        // style: AppTextStyle.s36Abel,
                      ),
                    ),
                    Text(state.users![0].name),
                    Text(state.users![0].email),
                    Text(state.users![0].profilePicLink)
                  ],
                ),
              )
            : Center(
                child: CircularProgressIndicator(),
              );
      },
    );
  }
}
