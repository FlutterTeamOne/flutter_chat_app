import 'package:blur/blur.dart';
import 'package:chat_app/modules/signal_service/library/library_signal_service.dart';
import 'package:chat_app/modules/storage_manager/db_helper/db_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'widgets/change_user_pic.dart';
part 'widgets/load_method.dart';
part 'widgets/app_blured_image.dart';
part 'widgets/_user_picture.dart';
part 'widgets/app_dialog.dart';
part 'widgets/layout/profile_layout.dart';

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
        print('State USERS: ${state.users}');
        return state.users?[0].name != null
            ? const _ProfileLayout()
            : const Center(
                child: CircularProgressIndicator(),
              );
      },
    );
  }
}
